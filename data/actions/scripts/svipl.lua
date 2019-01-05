    --[[SevuEntertainment(c)]]--
    --[[MedalAddVipTime]]--
    local addSVipDays = 15

    function onUse(player, item, fromPos, target, toPos, isHotkey)
        	if player:getIsVip() == true then
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You can't use x2 vip types at the same time.")
			return false
			end
        player:addSVipTime(86400 * addSVipDays)
        local currTime = (player:getSVipTime() - os.time())
        local currDays = math.ceil(currTime / 86400)
        player:sendTextMessage(MESSAGE_INFO_DESCR, string.format('Now you have %s days of x4 SVip', math.max(1, currDays)))
        player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
        item:remove(1)

        return true
    end