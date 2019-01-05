function onUse(player, item, fromPosition, target, toPosition, isHotkey)
if player:getLevel(cid) >= 100000 then
player:getPosition():sendMagicEffect(56)
player:say('Check CarcooIzx City Map (Hint : New Pin)', TALKTYPE_MONSTER_SAY)
player:addMapMark(Position(987, 923, 7), MAPMARK_EXCLAMATION, 'Treasure [Hard]')
        item:remove(1)
else
player:say('You Need level 100k', TALKTYPE_MONSTER_SAY)
return true
end
end
