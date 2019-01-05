function onLogin(player)
	local loginStr = "Welcome to " .. configManager.getString(configKeys.SERVER_NAME) .. "!"
	if player:getLastLoginSaved() <= 0 then
		loginStr = loginStr .. " Please choose your outfit."
		player:sendOutfitWindow()
	else
		if loginStr ~= "" then
			player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)
		end
function onPrepareDeath(creature, killer)
    local player = creature:getPlayer()
    if not player then
        return true
    end
    player:setStorageValue('death', 1)
    return true
end

		loginStr = string.format("Your last visit was on %s.", os.date("%a %b %d %X %Y", player:getLastLoginSaved()))
	end
	player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)

	-- Stamina
	nextUseStaminaTime[player.uid] = 0

	-- Promotion
	local vocation = player:getVocation()
	local promotion = vocation:getPromotion()
	if player:isPremium() then
		local value = player:getStorageValue(STORAGEVALUE_PROMOTION)
		if not promotion and value ~= 1 then
			player:setStorageValue(STORAGEVALUE_PROMOTION, 1)
		elseif value == 1 then
			player:setVocation(promotion)
		end
	elseif not promotion then
		player:setVocation(vocation:getDemotion())
	end

-- LevelLoss
local function getExpForLevel(lv)
    lv = lv - 1
    return ((50 * lv * lv * lv) - (150 * lv * lv) + (400 * lv)) / 3
end
	-- Events
	player:registerEvent("PlayerDeath")
	player:registerEvent("DropLoot")
     player:registerEvent("AdvanceSave")
     player:registerEvent("ZombieArenaKill")
     player:registerEvent("ZombieArenaDeath")
     player:registerEvent("ZombieArenaLogout")
     player:registerEvent("fire_event")
     player:registerEvent("AutoLoot")
     player:registerEvent("GetVIP")
     player:registerEvent("GetSVIP")
	 player:registerEvent("taskSystem")
     player:registerEvent("GetLoot")
     player:registerEvent("QuestK")
     player:registerEvent("Looter")
     player:registerEvent("loot_slot")
     player:registerEvent("Bloot")
     player:registerEvent("AntiBot")
     player:registerEvent("pvp")
	player:registerEvent("Missions")
	player:registerEvent("BossParticipation")
	player:registerEvent("Referral")
	player:registerEvent("OFFMSG")
	player:registerEvent("conditionlogout")
     player:registerEvent("statLogin")
     -- player:registerEvent("teambattle_login")
	 -- player:registerEvent("teambattle_stats")
     -- player:registerEvent("teambattle_death")

	return true
        end
