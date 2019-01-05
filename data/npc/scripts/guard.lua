local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
 
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
 
local marks = {
    [1] = {
            {Position(1000, 1000, 7), MAPMARK_EXCLAMATION, "Temple"},
    },
    [2] = {
            {Position(886, 987, 7), MAPMARK_EXCLAMATION, "Lava Golems"},
    },
    [3] = {
            {Position(994, 1085, 7), MAPMARK_EXCLAMATION, "Losts"},
    },
    [4] = {
            {Position(15386, 15197, 8), MAPMARK_EXCLAMATION, "DeathStrike"},
    },
    [5] = {
            {Position(5290, 5221, 8), MAPMARK_EXCLAMATION, "Mad Mage"},
    },
    [6] = {
            {Position(5417, 5462, 7), MAPMARK_EXCLAMATION, "Glooth Slasher"},
    },
    [7] = {
            {Position(5552, 5586, 8), MAPMARK_EXCLAMATION, "Hellflayer"},
    },
}
 
local locations = {
    ["temple"] = {pos = Position(1000, 1000, 7), price = 50000000, pzcheck = true, marks = marks[1]},
    ["lava golems"] = {pos = Position(886, 987, 7), price = 50000000, pzcheck = true, marks = marks[1]},
    ["losts"] = {pos = Position(994, 1085, 7), price = 50000000, pzcheck = true, marks = marks[1]},
    ["deathstrike"] = {pos = Position(15386, 15197, 8), price = 50000000, pzcheck = true, marks = marks[1]},
    ["mad mage"] = {pos = Position(5290, 5221, 8), price = 50000000, pzcheck = true, marks = marks[1]},
    ["glooth slasher"] = {pos = Position(5417, 5462, 7), price = 50000000, pzcheck = true, marks = marks[1]},
    ["hellflayer"] = {pos = Position(5552, 5586, 8), price = 50000000, pzcheck = true, marks = marks[1]},
}
local function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then
        return false
    end
 
      local player = Player(cid)
    if msgcontains(msg, "location") then
        local ret = "I can tell you the locations of "
        for place, _ in pairs(locations) do
            ret = ret .. ("{%s}"):format(place) .. ", "
        end
        ret = ret:sub(1, #ret-2) .. "."
        npcHandler:say(ret, cid)
        npcHandler.topic[cid] = 1
    elseif locations[msg:lower()] then
        local info = locations[msg:lower()]
        if npcHandler.topic[cid] == 1 or not info.pos then
            npcHandler:say("There you go, look at your mini map.", cid)
            npcHandler.topic[cid] = 0
            for i = 1, #info.marks do
                player:addMapMark(info.marks[i][1], info.marks[i][2], info.marks[i][3])
            end
        else
            npcHandler:say("I can take you to " .. msg:lower() .. " for " .. info.price .. " gold coins. Would you like to go?", cid)
            npcHandler.topic[cid] = msg:lower()
        end
    elseif msgcontains(msg, "yes") and locations[npcHandler.topic[cid]] then
        local info = locations[npcHandler.topic[cid]]
        if info.pzcheck and player:isPzLocked() then
            npcHandler:say("Get out of there with this blood.", cid)
            npcHandler.topic[cid] = 0
            return true
        end
        if info.price and not player:removeMoney(info.price) then
            npcHandler:say("You don't have enough money.", cid)
            npcHandler.topic[cid] = 0
            return true
        end
 
        npcHandler:say("Here we go.", cid)
        player:teleportTo(info.pos)
        info.pos:sendMagicEffect(CONST_ME_TELEPORT)
        npcHandler.topic[cid] = 0
    end
    return true
end
 
local function greetCallback(cid)
    return true
end
 
local function onAddFocus(cid)
    npcHandler.topic[cid] = 0
end
 
npcHandler:setCallback(CALLBACK_ONADDFOCUS, onAddFocus)
 
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye |PLAYERNAME|!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "How rude!")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:addModule(FocusModule:new())