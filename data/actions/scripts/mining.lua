local cfg = {
	chance = 1,            -- chance that the player will succeed in getting the ore
	skill = SKILL_FIST,      -- skill required to mine
	skillStr = ' FIST',      -- string for skill name | note: add a space before skill name
	stage2Regen = 60 * 1000, -- 3 seconds
	stage3Regen = 120 * 1000, -- 2 seconds
	ores = {
		{effect = CONST_ME_BLOCKHIT, ore = 5880, amount = {1, 3}, skillReq = 10, veins = {
				{id = 8636, lv = 75},
				{id = 8640, lv = 50}
			}
		}
	}
}

local function isInTable(value)
	for i = 1, #cfg.ores do
		for j = 1, #cfg.ores[i].veins do
			if cfg.ores[i].veins[j].id == value then
				return i, j -- Return ore row and vein index
			end
		end
	end
	return false
end

local regenerating = {}

local function regenVein(pos, id, row, index)
	local item = Tile(pos):getItemById(id)
	if not item then
		return false
	end
	local currVein = cfg.ores[row].veins
	local transformId = currVein[index].id
	item:transform(transformId)
	if currVein[index-1] and currVein[index-1].id then
		regenerating[pos] = addEvent(regenVein, cfg.stage3Regen, pos, transformId, row, index-1)
	end
end

exhaust = Condition(CONDITION_EXHAUST_HEAL)
exhaust:setParameter(CONDITION_PARAM_TICKS, (configManager.getNumber(configKeys.EX_ACTIONS_DELAY_INTERVAL) + 275))

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
		if player:getCondition(CONDITION_EXHAUST_HEAL) then
			return player:sendTextMessage(MESSAGE_STATUS_SMALL, Game.getReturnMessage(RETURNVALUE_YOUAREEXHAUSTED))
		end
	local row, vein = isInTable(target:getId())
	if (row and vein) then
		local playerPos = player:getPosition()
		local currOre = cfg.ores[row]
		local currVein = currOre.veins[vein]
		local skillLevel = player:getSkillLevel(cfg.skill)

		-- Check player skill level
		if not (skillLevel >= currOre.skillReq) then
			player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You must have '.. currOre.skillReq .. cfg.skillStr ..' before you may mine.')
			return true
		end
		 
		-- Check player level
		if not (player:getLevel() >= currVein.lv) then
			player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You must have '.. cfg.level ..' level before you may mine.')
			return true
		end

		-- If the vein is at the last stage, tell the player to wait
		if #currOre.veins == vein then
			player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You must wait for this vein to regen.')
			playerPos:sendMagicEffect(CONST_ME_POFF)
			return true
		end

		-- Stop current regeneration process (since the player hit the rock again)
		if regenerating[toPosition] then
			stopEvent(regenerating[toPosition])
		end

		-- If chance is correct, add the item to the player and start regeneration process
		if math.random(100) <= (cfg.chance) then
			local nextId = currOre.veins[vein+1].id
			local it = player:addItem(currOre.ore, math.random(currOre.amount[1], currOre.amount[2]))
			local count = it:getCount()
			local name = count > 1 and it:getPluralName() or it:getName()
			player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You have mined '.. count .. ' '.. name)
			player:addSkillTries(cfg.skill, math.random(3000, 5000) / skillLevel)
	player:addCondition(exhaust)
			toPosition:sendMagicEffect(currOre.effect)
			regenerating[toPosition] = addEvent(regenVein, (vein == 2) and cfg.stage2Regen or cfg.stage3Regen, toPosition, nextId, row, vein)
			target:transform(nextId)
		else
			playerPos:sendMagicEffect(CONST_ME_POFF)
	player:addCondition(exhaust)
		end

	end
	return true
end