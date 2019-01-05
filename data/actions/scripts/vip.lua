    --[[SevuEntertainment(c)]]--
    --[[MedalAddVipTime]]--
    local addVipDays = 30

    function onUse(player, item, fromPos, target, toPos, isHotkey)
        	if player:getIsSVip() == true then
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You can't use x2 vip types at the same time.")
			return false
			end
        player:addVipTime(86400 * addVipDays)
        local currTime = (player:getVipTime() - os.time())
        local currDays = math.ceil(currTime / 86400)
        player:sendTextMessage(MESSAGE_INFO_DESCR, string.format('Now you have %s days vip', math.max(1, currDays)))
        player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
        item:remove(1)

        return true
    end