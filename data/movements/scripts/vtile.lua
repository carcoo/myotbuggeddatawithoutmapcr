	--[[SevuEntertainment(c)]]--
	--[[Tile-Pass-OnlyVipPlayer]]--
	function onStepIn(creature, item, position, fromPosition)
	
		if creature:isPlayer() then
			if not creature:getIsVip() then
				creature:teleportTo(fromPosition, false)
				creature:sendCancelMessage('Only VIP players can pass.')
				return true
			end
			creature:sendCancelMessage('Welcome VIP player.')
	        creature:say('Welcome Vip Player', TALKTYPE_MONSTER_SAY)
			creature:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)

		end

		return true
	end
