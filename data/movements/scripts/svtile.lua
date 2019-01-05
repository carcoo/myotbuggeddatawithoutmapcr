	--[[SevuEntertainment(c)]]--
	--[[Tile-Pass-OnlyVipPlayer]]--
	function onStepIn(creature, item, position, fromPosition)
	
		if creature:isPlayer() then
			if not creature:getIsSVip() then
				creature:teleportTo(fromPosition, false)
				creature:sendCancelMessage('Only SVIP players can pass.')
				return true
			end
			creature:sendCancelMessage('Welcome SVIP player.')
	        creature:say('Welcome SVip Player', TALKTYPE_MONSTER_SAY)
			creature:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)

		end

		return true
	end
