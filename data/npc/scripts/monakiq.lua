-- Collecting items and monster missions by Carcoo
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
function onCreatureAppear(cid)  npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)  npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)  npcHandler:onCreatureSay(cid, type, msg) end
function onThink()  npcHandler:onThink() end
 
local missions = {
   [1] = {
     items = {
       {id = 13531, count = 1},
     },
     message = "After making million ring for CarcooIzx Community they doesn't need me anymore anyway, bring from the Miner",
     level = 375000, -- minimum level voor this mission
     rewarditems = {
       {id = 18408, count = 1}
     },
     rewardexp = 955000000
   },
}
 
local storage = 48295
 
local function getItemsMonstersFromTable(imtable)
     local text = ""
     for v = 1, #imtable do
         local ret = ", "
         if v == 1 then
             ret = ""
         elseif v == #imtable then
             ret = " and "
         end
         text = text .. ret
         count = imtable[v].count
         if imtable[v].id then
             info = ItemType(imtable[v].id)
             text = text .. (count > 1 and count or info:getArticle()).." "..(count > 1 and info:getPluralName() or info:getName())
         else
             text = text .. count .." "..imtable[v].name
         end
     end
     return text
end
 
function creatureSayCallback(cid, type, msg)
     if not npcHandler:isFocused(cid) then
         return false
     end
 
     local player = Player(cid)
     local x = missions[player:getStorageValue(storage)]
 
     if msgcontains(msg, 'find') or msgcontains(msg, 'quest') then
         if player:getStorageValue(storage) == -1 then
             selfSay("take any boat from here and go to the crystal mine you will meet the Miner there talk with him he will tell you everything, are you ready?", cid)
             npcHandler.topic[cid] = 1
         elseif x then
             if player:getLevel() >= x.level then
                 selfSay("Did you "..(x.items and "get "..getItemsMonstersFromTable(x.items) or "kill "..getItemsMonstersFromTable(x.monsters)).."?", cid)
                 npcHandler.topic[cid] = 1
             else
                 selfSay("The mission I gave you is for level "..x.level..", come back when you are experienced enough.", cid)
             end
         else
             selfSay("You already did the mission, great job though.", cid)
             npcHandler:releaseFocus(cid)
         end
     elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 1 then
         if player:getStorageValue(storage) == -1 then
             player:setStorageValue(storage, 1)
             local x = missions[player:getStorageValue(storage)]
             selfSay(x.message.." "..getItemsMonstersFromTable(x.items or x.monsters)..".", cid)
         elseif x then
             local imtable = x.items or x.monsters
             local amount = 0
             for it = 1, #imtable do
                 local check = x.items and player:getItemCount(imtable[it].id) or player:getStorageValue(imtable[it].storage)
                 if check >= imtable[it].count then
                     amount = amount + 1
                 end
             end
             if amount == #imtable then
                 if x.items then
                     for it = 1, #x.items do
                         player:removeItem(x.items[it].id, x.items[it].count)
                     end
                 end
                 if x.rewarditems then
                     for r = 1, #x.rewarditems do
                         player:addItem(x.rewarditems[r].id, x.rewarditems[r].count)
                     end
                     player:sendTextMessage(MESSAGE_EVENT_DEFAULT, "You received "..getItemsMonstersFromTable(x.rewarditems)..".")
                 end
                 if x.rewardexp then
                     player:addExperience(x.rewardexp)
                     player:sendTextMessage(MESSAGE_EVENT_DEFAULT, "You received "..x.rewardexp.." experience.")
                 end
                 player:setStorageValue(storage, player:getStorageValue(storage) + 1)
                 local x = missions[player:getStorageValue(storage)]
                 if x then
                     selfSay(x.message.." "..getItemsMonstersFromTable(x.items or x.monsters)..".", cid)
                 else
                     selfSay("Well done!, as the Miner told me you really deserve my prismatic ring, good luck using it!", cid)
                 end
             else
                 local n = 0
                 for i = 1, #imtable do
                     local check = x.items and player:getItemCount(imtable[i].id) or player:getStorageValue(imtable[i].storage)
                     if check < imtable[i].count then
                         n = n + 1
                     end
                 end
                 local text = ""
                 local c = 0
                 for v = 1, #imtable do
                     local check = x.items and player:getItemCount(imtable[v].id) or player:getStorageValue(imtable[v].storage)
                     if check < imtable[v].count then
                         c = c + 1
                         local ret = ", "
                         if c == 1 then
                             ret = ""
                         elseif c == n then
                             ret = " and "
                         end
                         text = text .. ret
                         if x.items then
                             local count, info = imtable[v].count - player:getItemCount(imtable[v].id), ItemType(imtable[v].id)
                             text = text .. (count > 1 and count or info:getArticle()).." "..(count > 1 and info:getPluralName() or info:getName())
                         else
                             local count = imtable[v].count - (player:getStorageValue(imtable[v].storage) + 1)
                             text = text .. count.." "..imtable[v].name
                         end
                     end
                 end
                 selfSay(x.items and "You didn't find the pendant yet?, you still need to get "..text..", is it that hard?" or "You didn't kill Abyssador, told you its not easy to face him "..text..".", cid)
             end
         end
         npcHandler.topic[cid] = 0
     elseif msgcontains(msg, 'no') and npcHandler.topic[cid] == 1 then
         selfSay("Oh well, I guess not then.", cid)
         npcHandler.topic[cid] = 0
     return true
end
end
 
npcHandler:setMessage(MESSAGE_FAREWELL, "Bye!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye!")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())