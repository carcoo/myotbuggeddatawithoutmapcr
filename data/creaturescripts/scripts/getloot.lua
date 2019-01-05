function onLogin(player)
	if player:getIsLoot() == false then
			return true
			end
		        local currTime = (player:getLootTime() - os.time())
        local currDays = math.floor(currTime / 86400)
		local currHours = math.floor((currTime - (86400 * currDays)) / 3600) 
   player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, ('You Have '.. currDays ..' days and '.. currHours ..' hours of AutoLooting!'))
	return true
end