    local addLootDays = 365

    function onUse(player, item, fromPos, target, toPos, isHotkey)
        
        player:addLootTime(86400 * addLootDays)
        local currTime = (player:getLootTime() - os.time())
        local currDays = math.ceil(currTime / 86400)
        player:sendTextMessage(MESSAGE_INFO_DESCR, string.format('Now you have %s days of auto looting', math.max(1, currDays)))
        player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
        item:remove(1)

        return true
    end