local rank = "Elite" -- Required or higher rank to pass.


function onStepIn(creature, item, position, fromPosition)
	if creature:isPlayer() then
		if rankIsEqualOrHigher(getRankTask(creature), rank) then
			creature:sendTextMessage(MESSAGE_EVENT_ORANGE,"Good luck!!")
		else
			creature:teleportTo(fromPosition, true)
			creature:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE,"Your task rank must be equal to or higher than "..rank.." to pass.")
		end
	end
	return true
end