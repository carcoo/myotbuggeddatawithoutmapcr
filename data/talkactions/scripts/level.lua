function onSay(cid, words, param, channel)
doCreatureSay(cid, "Your level is ".. getPlayerLevel(cid) .."!", TALKTYPE_MONSTER_SAY)
return false
end