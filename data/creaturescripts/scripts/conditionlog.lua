function onLogout(player)
            if(player:getCondition(CONDITION_MANASHIELD)) then
                player:removeCondition(CONDITION_MANASHIELD)
            end
			return true
			end