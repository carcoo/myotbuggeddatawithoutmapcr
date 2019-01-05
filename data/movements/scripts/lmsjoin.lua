local t = {
waitingroom = {x = 1452, y = 947, z = 7},
}

function onStepIn(cid, item, position, lastPosition)
doTeleportThing(cid, t.waitingroom)
doSendMagicEffect(t.waitingroom, CONST_ME_TELEPORT)



if (getGlobalStorageValue(25002) < 0) then
setGlobalStorageValue(25002,1)
setPlayerStorageValue(cid, 25001, 1)
broadcastMessage("Player "..getCreatureName(cid).." joined Last man standing event!", MESSAGE_EVENT_ADVANCE)

else

setGlobalStorageValue(25002,getGlobalStorageValue(25002)+1)
setPlayerStorageValue(cid, 25001, 1)

broadcastMessage("Player "..getCreatureName(cid).." joined Last man standing event!", MESSAGE_EVENT_ADVANCE)
end
end