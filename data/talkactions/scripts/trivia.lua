--// Config
 
--// All question answers must be in lowercase, if the answer is a number it must be a string (example: 6 -> "6")
local questions = {
    {text = "In which year CarcooIzxOT was released?", answer = "2018"},
    {text = "In which city is the freedom staue?", answer = "new york"},
    {text = "What is 17+28?", answer = "45"},
    {text = "What is 18*2/4?", answer = "9"},
    {text = "What is the best tibia server?", answer = "carcooizx"},
    {text = "What is 123+123-123/123?", answer = "123"},
    {text = "Type c-a-r-c-o-o-i-z-x without (-)", answer = "carcooizx"},
    {text = "muta_ion type the word with the missing letter", answer = "mutation"},
    {text = "How many letters in alphabet?", answer = "8"},
    {text = "How many premium points for ultra donation helmet", answer = "2000"},
    {text = "Do you like CarcooIzx?", answer = "yes"}
}
 
--// Random reward for the winner
local rewards = {
    {id = 21251}
}
 
local broadcastType = MESSAGE_STATUS_CONSOLE_BLUE -- Message type used for broadcasting
local messageType = MESSAGE_STATUS_CONSOLE_ORANGE -- Message type used for sending player messages (not broadcasts)
local autoQuestion = 30 -- Amount of seconds that a question should automatically be sent
local nextQuestion = 20 -- Amount of seconds that a question will be sent after a player answers correctly
local maxAnswers = 4 -- Amount of answers needed to recieve a reward
 
--\\
 
--// Non-config
if awaitingEvent then
    stopEvent(awaitingEvent)
end
playerAnswers = {}
questionCache = {}
currentQuestion = 0
--\\
 
function selectQuestion()
    local index = math.random(#questions)
    if (#questions == #questionCache) then
        return endTrivia(false, " No questions left.")
    end
    while isInArray(questionCache, index) do
        index = math.random(#questions)
    end
    questionCache[#questionCache+1] = index
    currentQuestion = index
    return questions[index]
end
 
function endTrivia(silent, reason)
    currentQuestion = 0
    questionCache = {}
    playerAnswers = {}
    stopEvent(awaitingEvent)
    if not silent then
        Game.broadcastMessage("[TRIVIA] Trivia event has been ended.".. reason or "", broadcastType)
    end
end
 
--// Silently end current event on reload
endTrivia(true)
 
function runTrivia(forced)
    if forced then
        Game.broadcastMessage("[TRIVIA] No one won the previous round.", broadcastType)
    end
    local question = selectQuestion()
    if not question then
        return
    end
    awaitingEvent = addEvent(runTrivia, autoQuestion * 1000, true)
    Game.broadcastMessage("[TRIVIA] ".. question.text, broadcastType)
end
 
function onSay(player, words, param)
    local activeQuestion = questions[currentQuestion]
    if (currentQuestion == 0) then
        player:sendTextMessage(messageType, "There is no active question.")
        return false
    end
    if (param == "") then
        player:sendTextMessage(messageType, "Input an answer.")
        return false
    end
    if (param:lower() ~= activeQuestion.answer) then
        player:sendTextMessage(messageType, "Incorrect answer.")
        return false
    end
    local guid = player:getGuid()
    local name = player:getName()
    playerAnswers[guid] = (playerAnswers[guid] or 0) + 1
    if (playerAnswers[guid] == maxAnswers) then
        local reward = rewards[(rewards)]
        player:addItem(21251)
        player:sendTextMessage(messageType, "You have answered ".. maxAnswers .." questions correctly, you have won a reward.")
        endTrivia(false, " ".. name .. " has won the event.")
    else
        player:sendTextMessage(messageType, ("You have answered the question correctly. You now have [%d / %d] points."):format(playerAnswers[guid], maxAnswers))
        Game.broadcastMessage(('%s has answered the question correctly. The correct answer was "%s". Next question in %d seconds.'):format(name, activeQuestion.answer, nextQuestion), broadcastType)
        currentQuestion = 0
        stopEvent(awaitingEvent)
        addEvent(runTrivia, nextQuestion * 1000)
    end
    return false
end