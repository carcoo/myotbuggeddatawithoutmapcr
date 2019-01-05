function onUse(cid, item, frompos, item2, topos)
mag = getPlayerMagLevel(cid)
if mag >= 3 then
doSendMagicEffect(topos,49)
doCreatureSay(cid,"Super Manarune",TALKTYPE_MONSTER_SAY)
doPlayerAddMana(cid, 400000)
if item.type > 1 then
end
else
doSendMagicEffect(frompos,2)
doPlayerSendCancel(cid,"You don't have the required magic level to use that rune.")
end
return 1
end

