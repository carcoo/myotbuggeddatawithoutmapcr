function onLogin(Player)
    if Player:getIsLoot() = false then
        setPlayerStorageValue(cid, 50500, 1)
    elseif Player:getLootTime() == 0 and getPlayerStorageValue(cid, 51000) == 1 then
        for i = AUTOLOOT_STORAGE_START, AUTOLOOT_STORAGE_END do
            player:setStorageValue(i, 0)
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'Your auto looting time have ended.')
    end
	end
    return true
end
 