function onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end

	if player:getAccountType() < ACCOUNT_TYPE_GOD then
		return false
	end
    if Game.getStorageValue(29294) == 1 then
	Game.setStorageValue(29294, -1)
	Game.broadcastMessage("Celeberating with Asgard Chest is done!", MESSAGE_EVENT_ADVANCE)
	player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Asgard Chest 'DeActivated'")
	return false
	end
	Game.setStorageValue(29294, 1)
	Game.broadcastMessage("Celeberate And take your daily rewards from Asgard Chest!", MESSAGE_EVENT_ADVANCE)
	player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Asgard Chest 'Activated'")
	return false
	end