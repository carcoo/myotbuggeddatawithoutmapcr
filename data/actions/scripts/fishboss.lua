function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if player:getLevel() >= 200000 then
         player:teleportTo(Position(1269, 802, 7), false)
         player:getPosition():sendMagicEffect(29)
         player:say('Mystery Place?', TALKTYPE_MONSTER_SAY)
		 end
	return true
end
