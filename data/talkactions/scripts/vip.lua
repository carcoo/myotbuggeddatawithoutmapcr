		function onSay(player, words, param)
	if player:getIsVip() == false then
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You are not VIP player.")
			return false
			end
		        local currTime = (player:getVipTime() - os.time())
        local currDays = math.floor(currTime / 86400)
		local currHours = math.floor((currTime - (86400 * currDays)) / 3600) 
   player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, ('You Have '.. currDays ..' days and '.. currHours ..' hours of VIP!'))
			return false
		end