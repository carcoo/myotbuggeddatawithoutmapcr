function executeClean()
	cleanMap()
	broadcastMessage("Game map cleaned, next clean in 2 hours.", MESSAGE_EVENT_ADVANCE)
	return true
end

function onThink(interval, lastExecution, thinkInterval)
    broadcastMessage("Game map cleaning within 30 seconds, please pick up your items!", MESSAGE_EVENT_ADVANCE)
	addEvent(executeClean, 30000)
	return true
end
