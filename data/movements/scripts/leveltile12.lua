function onStepIn(cid, item, position, fromPosition)
if getPlayerLevel(cid) >= 300000 then
doSendMagicEffect(getPlayerPosition(cid), 29)
doCreatureSay(cid, 'You Can Pass!!', TALKTYPE_MONSTER_SAY, getPlayerPosition(cid))
return true
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Sorry, You Need to be Level 300000+ to Pass")
doCreatureSay(cid, 'You Need 300,000+!', TALKTYPE_MONSTER_SAY, getPlayerPosition(cid))
doTeleportThing(cid, fromPosition, false)
end
end