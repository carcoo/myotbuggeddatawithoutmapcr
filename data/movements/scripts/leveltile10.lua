function onStepIn(cid, item, position, fromPosition)
if getPlayerLevel(cid) >= 150000 and getPlayerLevel(cid) <= 200000 then
doSendMagicEffect(getPlayerPosition(cid), 29)
doCreatureSay(cid, 'You Can Pass!!', TALKTYPE_MONSTER_SAY, getPlayerPosition(cid))
return true
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Sorry, You Need to be Level 150k~200k to Pass")
doCreatureSay(cid, 'You Need 150k~200k!', TALKTYPE_MONSTER_SAY, getPlayerPosition(cid))
doTeleportThing(cid, fromPosition, false)
end
end