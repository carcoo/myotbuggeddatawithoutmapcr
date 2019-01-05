local startTime = 3 -- Minutes until the event will start
 
function onThink(interval)
    Game.broadcastMessage("[TRIVIA] A trivia event will start in ".. startTime .." minutes say !answer to answer the questions.", MESSAGE_STATUS_CONSOLE_BLUE)
    addEvent(runTrivia, startTime * 60 * 1000)
    return true
end