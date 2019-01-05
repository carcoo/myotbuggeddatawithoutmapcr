local centeroffight = {x = 1452, y = 947, z = 8}
local waitingplace = {x = 1452, y = 947, z = 7}
local depotcenter = {x = 1000, y = 1000, z = 7}
local MinimumPlayers = 2
local rewardpoints = 300
local area_increase = 10
 
 
 
 
local function lmsclosed1()
    broadcastMessage("Last Man Standing event will start in 1 minutes. Portal is opened in events", MESSAGE_EVENT_ADVANCE)
end
 
 
local function lmsclosed()
 
count = 0
        local spectators = getSpectators(waitingplace, area_increase, area_increase, false)
        if spectators ~= nil then
                for _, spectator in ipairs(spectators) do
                        if isPlayer(spectator) then  
                         count = count + 1
                     
                        end
                end
        end
       
       
       
if (count >= MinimumPlayers) then
 
broadcastMessage("Last Man Standing event portal closed and event started!", MESSAGE_EVENT_ADVANCE)
 
for _, pid in ipairs(getOnlinePlayers()) do
    if getPlayerStorageValue(pid, 25001) == 1 then
local playerids = getPlayerByName(pid)
doTeleportThing(playerids,centeroffight)
doSendMagicEffect(center, CONST_ME_TELEPORT)
    end
     
end
 
else
 
broadcastMessage("Not enough players to start Last man Standing event! Minimum: "..MinimumPlayers.." players. We have "..count.." !", MESSAGE_EVENT_ADVANCE)
setGlobalStorageValue(25002, 0)
 
for _, pid in ipairs(getOnlinePlayers()) do
    if getPlayerStorageValue(pid, 25001) == 1 then
local playerids = getPlayerByName(pid)
doTeleportThing(playerids,depotcenter)
doSendMagicEffect(depotcenter, CONST_ME_TELEPORT)
setPlayerStorageValue(pid, 25001, 0)
 
    end
end
 
end
 
 
return true
end
 
 
 
 
 
local function lmscheck()
 
 
count = 0
        local spectators = getSpectators(centeroffight, area_increase, area_increase, false)
        if spectators ~= nil then
                for _, spectator in ipairs(spectators) do
                        if isPlayer(spectator) then  
                         count = count + 1
                     
                        end
                end
        end
 
if count == 1 then
 
 
for _, pid in ipairs(getOnlinePlayers()) do
    if getPlayerStorageValue(pid, 25001) == 1 then
local playerids = getPlayerByName(pid)
setPlayerStorageValue(playerids, 25001, 0)
    end
end
 
        local spectators = getSpectators(centeroffight, area_increase, area_increase, false)
        if spectators ~= nil then
                for _, spectator in ipairs(spectators) do
                        if isPlayer(spectator) then
 
           
           
doTeleportThing(spectator,depotcenter)
doSendMagicEffect(depotcenter, CONST_ME_TELEPORT)
broadcastMessage("LMS ended winner is: "..getPlayerName(spectator)..", reward is 300 premium points.", MESSAGE_STATUS_WARNING)
 
local accid = Player(spectator):getAccountId()
local points = rewardpoints
        db.query('UPDATE znote_accounts SET points = points+'.. points ..' WHERE account_id = ' .. getAccountNumberByPlayerName(getCreatureName(cid)))
                     end
                end
        end
       
 
 
for _, pid in ipairs(getOnlinePlayers()) do
    if getPlayerStorageValue(pid, 25001) == 1 then
local playerids = getPlayerByName(pid)
setPlayerStorageValue(pid, 25001, 0)
end
end
 
stopEvent(lmscheck)
 
else
addEvent(lmscheck, 10*1000)
end
end
 
 
 
local function lms()
    broadcastMessage("Last Man Standing event will start in 2 minutes. Portal is opened in events", MESSAGE_EVENT_ADVANCE)
 
    portalwhere = {x= 1420, y=1008, z=7}
    local portal = doCreateItem(1387,1,portalwhere)
  doSetItemActionId(portal, 25001)
  doSendMagicEffect(portalwhere, CONST_ME_TELEPORT)
 
  
addEvent(function() doRemoveItem(getTileItemById(portalwhere, 1387).uid) end, 120 * 1000)
addEvent(function() doSendMagicEffect(portalwhere, CONST_ME_TELEPORT) end, 120 * 1000)
 
addEvent(lmsclosed, 2*60*1000)
addEvent(lmsclosed1, 1*60*1000)
addEvent(lmscheck, 130*1000)
 
return true
end
 
 
 
function onThink(interval)
 
    broadcastMessage("Last Man Standing event will start in 3 minutes.", MESSAGE_EVENT_ADVANCE)
    addEvent(lms, 60*1000)
 
 
 
for _, pid in ipairs(getOnlinePlayers()) do
    if getPlayerStorageValue(pid, 25001) == 1 then
local playerids = getPlayerByName(pid)
doTeleportThing(playerids,depotcenter)
doSendMagicEffect(depotcenter, CONST_ME_TELEPORT)
setPlayerStorageValue(pid, 25001, 0)
 
    end
end
 
 
return true
end