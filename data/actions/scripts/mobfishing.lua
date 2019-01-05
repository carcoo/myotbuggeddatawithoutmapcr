local waters = {4614, 4615, 4616, 4617, 4618, 4619, 4620, 4621, 4622, 4623, 4624, 4625, 4665, 4666, 4820, 4821, 4822, 4823, 4824, 4825, 4608, 4609, 4610, 4611, 4612, 4613, 7236}
local lava = {598, 599, 600, 601, 9883}
local swamp = {4691, 4692, 4693, 4694, 4695, 4696, 4697, 4698, 4699, 4700, 4701, 4702, 4703, 4704, 4705, 4706, 4707, 4708, 4709, 4710, 4711, 4712, 4752}
 
local water_monsters = {
    [1] = {name = "Jaul", chance = 300, fishing = 10, level = 200000, msg = "|PLAYERNAME| has caught Jaul!", broadcastToServer = true},
    [2] = {name = "Tanjis", chance = 300, fishing = 10, level = 200000, msg = "|PLAYERNAME| has caught Tanjis!", broadcastToServer = true},
    [3] = {name = "Moohtant", chance = 5000, fishing = 10, level = 200000, msg = "|PLAYERNAME| has caught Raging Mage!", broadcastToServer = false}
}
 
local lava_monsters = {
    [1] = {name = "Deepling Spellsinger", chance = 100, fishing = 50, level = 200000, msg = "|PLAYERNAME| has caught a Deepling Spellsinger!", broadcastToServer = true}
}
 
local swap_monsters = {
    [1] = {name = "Jaul", chance = 300, fishing = 10, level = 200000, msg = "|PLAYERNAME| has caught Jaul!", broadcastToServer = true},
    [2] = {name = "Tanjis", chance = 300, fishing = 10, level = 200000, msg = "|PLAYERNAME| has caught Tanjis!", broadcastToServer = true},
    [3] = {name = "Kollos", chance = 2000, fishing = 10, level = 200000, msg = "|PLAYERNAME| has caught Raging Mage!", broadcastToServer = false}
}
 
local chance = 500000
 
local catchFishStorage = 15000 --This is used to so players can turn catching regular fish off or on.
local chanceCatchNormalFish = 70 --20% chance to catch normal fish
local chanceCatchNorthernPike = 70 --10% chance to catch northerpike
local fishId = 2667 -- Item id of normal fish
local NorthernPikeId = 2669 -- Item id of northern pike
exhaust = Condition(CONDITION_EXHAUST_HEAL)
exhaust:setParameter(CONDITION_PARAM_TICKS, (configManager.getNumber(configKeys.EX_ACTIONS_DELAY_INTERVAL) + 275))
	
function onUse(player, item, fromPosition, target, toPosition, isHotkey)
		if player:getCondition(CONDITION_EXHAUST_HEAL) then
			return player:sendTextMessage(MESSAGE_STATUS_SMALL, Game.getReturnMessage(RETURNVALUE_YOUAREEXHAUSTED))
		end
		
    if Tile(player:getPosition()):hasFlag(TILESTATE_PROTECTIONZONE) then
        return player:sendCancelMessage("You may not fish from protection zone.")
    end
  if not Tile(player:getPosition()):getItemById(12698) then
        return player:sendCancelMessage("You can't fish monsters outside fishing island, it's too dangerous for newbies.")
  end
    if not isInArray(waters, target.itemid) and not isInArray(lava, target.itemid) and not isInArray(swamp, target.itemid) then
        return false
    end
   
    local tmp_table = {}
   
    if isInArray(waters, target.itemid) then
        tmp_table = water_monsters
        toPosition:sendMagicEffect(CONST_ME_LOSEENERGY)
    elseif isInArray(lava, target.itemid) then
        tmp_table = lava_monsters
        toPosition:sendMagicEffect(CONST_ME_HITBYFIRE)
    elseif isInArray(swamp, target.itemid) then
        tmp_table = swap_monsters
        toPosition:sendMagicEffect(9)
    end
   
    for i = 1, #tmp_table do
        if player:getLevel() >= tmp_table[i].level and player:getSkillLevel(SKILL_FISHING) >= tmp_table[i].fishing then
            local catchChance = math.random(1, chance)
           
            if catchChance <= tmp_table[i].chance then
                local MONS = Game.createMonster(tmp_table[i].name, player:getPosition())
               
                if MONS then
                    if tmp_table[i].broadcastToServer then
                        local text = string.gsub(tmp_table[i].msg, "|PLAYERNAME|", player:getName())
                        Game.broadcastMessage(text)
                    end
                end
            break
            end
        end
    end
   
    if isInArray(waters, target.itemid) then
        if player:getStorageValue(catchFishStorage) == 1 then
            if math.random(1, 100) <= chanceCatchNormalFish then
                player:addItem(fishId, 1, true)
            else
                if math.random(1, 100) <= chanceCatchNorthernPike then
                    player:addItem(northernPikeId, 1, true)
                end
            end
        end
    end
    player:addSkillTries(SKILL_FISHING, 1)
	player:addCondition(exhaust)
return true
end