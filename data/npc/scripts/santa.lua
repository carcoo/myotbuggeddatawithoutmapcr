local random_items = {
{chance = 5, itemid = 2112}, -- 0.5% to get teddy bear
{chance = 20, itemid = 6512}, -- 2% to get santa doll
{chance = 40, itemid = 2114}, -- 4% to get piggy bank
{chance = 40, itemid = 9971, count = 50}, -- 4% to get 100 platinum coins
{chance = 80, itemid = 2111, count = 5}, -- 8% to get 5 snowballs
{chance = 80, itemid = 2688, count = 8}, -- 8% to get 8 candy canes
{chance = 80, itemid = 2110, count = 1}, -- 8% to get doll
{chance = 400, itemid = 2688, count = 15}, -- 40% to get 15 red apples
{chance = 100, itemid = 6527, count = 1}, -- 10% to get 8 cookies
{chance = 100, itemid = 24115, count = 1}, -- 10% to get 8 cookies
{chance = 100, itemid = 21401, count = 1}, -- 10% to get 8 cookies
{chance = 100, itemid = 11259, count = 1}, -- 10% to get 8 cookies
}
local PRESENT_TIMER = 54164

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)


function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)      npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                          npcHandler:onThink()                        end

local voices = {
{ text = 'HO HO HO! MERRY CHRISTMAS', yell = true },
{ text = 'Hi there young ones, have you been good this year?' }
}

local PRESENT_STORAGE = 88888
 
function santaNPC(cid, message, keywords, present, node)
    if not npcHandler:isFocused(cid) then
        return false
    end
    if not present then
        npcHandler:say('Come back when you start behaving good.', cid)
        return true
    end
    local player = Player(cid)
    local item, reward = nil, {}
    for i = 1, #random_items do
        item = random_items
        if math.random(1000) < item[i].chance then
            reward.itemid  = item[i].itemid
            reward.subType = item[i].count or 1
            break
        end
    end
    if player:getStorageValue(PRESENT_STORAGE) <= os.time() then
        player:addItem(reward.itemid, reward.subType)
        npcHandler:say(string.format('HO HO HO! You were good like a little dwarf this year! I got %d %s for you.', reward.subType, ItemType(reward.itemid):getName()), cid)
        npcHandler:resetNpc()
        player:setStorageValue(PRESENT_STORAGE, os.time() + (24 * 60 * 60)) -- sets the next time for 1 day later than current time
        return true
    else
        npcHandler:say('You\'ve already received a present.', cid)
    end
end

npcHandler:setMessage(MESSAGE_GREET, "Merry Christmas |PLAYERNAME|. I'm Santa Claus. I got {present}s for good children.")
local node = keywordHandler:addKeyword({'present'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Were you good this year?'})
node:addChildKeywordNode(KeywordNode:new({'yes'}, santaNPC, true))
node:addChildKeywordNode(KeywordNode:new({'no'}, santaNPC, false))
npcHandler:addModule(FocusModule:new())