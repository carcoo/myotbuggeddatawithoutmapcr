local points_need = 170 -- Points required to pass.
local removePoints = true -- True to remove and false to not remove the points.

function onStepIn(creature, item, position, fromPosition)
	if creature:isPlayer() then
		if taskPoints_get(creature) >= 170 then
			creature:sendTextMessage(MESSAGE_EVENT_ORANGE,"CONGRATULATIONS!")
			creature:addItem(26187, 1)
			creature:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE,' Task Points: You have '..taskPoints_get(creature)..' task points.\n Task Rank Points : You have '..taskRank_get(creature)..' rank points.\n Task Rank : '..getRankTask(creature)..'')
			creature:getPosition():sendMagicEffect(math.random(CONST_ME_FIREWORK_YELLOW, CONST_ME_FIREWORK_BLUE))
			if removePoints then
				taskPoints_remove(creature, points_need)
			end
		else
			creature:teleportTo(fromPosition, true)
			creature:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE,"You must have "..points_need.." task points to pass.")
		end
	end
	return true
end