function onLogin(player)
	if player:getIsSVip() == false then
			return true
			end
		        local currTime = (player:getSVipTime() - os.time())
        local currDays = math.floor(currTime / 86400)
		local currHours = math.floor((currTime - (86400 * currDays)) / 3600) 
   player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, ('You Have '.. currDays ..' days and '.. currHours ..' hours of x4 SVIP!'))
	return true
end