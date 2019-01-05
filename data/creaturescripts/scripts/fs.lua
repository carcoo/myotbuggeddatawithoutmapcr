dofile('data/firestorm_event.lua')
function onPrepareDeath(player, killer)
    local winner = 0
    if player:getStorageValue(fsJoinStorage) >= 1 then
       Game.setStorageValue(fsJoinedCountGlobalStorage, Game.getStorageValue(fsJoinedCountGlobalStorage)-1)
        player:teleportTo(player:getTown():getTemplePosition())
        player:setStorageValue(fsJoinStorage, 0)
        player:addHealth(player:getMaxHealth())
 
        if Game.getStorageValue(fsJoinedCountGlobalStorage) <= 1 then --Event ended, someone won!
         local pla, play = nil, Game.getPlayers()
         for i = 1, #play do
        pla = play[i]
              if pla:getStorageValue(fsJoinStorage) == 1 then
            winner = pla:getId()
            break
            end
            end
            winner = Player(winner)
             if winner then
                winner:teleportTo(winner:getTown():getTemplePosition())
                winner:addHealth(winner:getMaxHealth())
				winner:addItem(21251)
				winner:setStorageValue(fsJoinStorage, 0)
                local trophy = winner:addItem(fsTrophy, 1)
                if trophy then
                    trophy:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, '['.. winner:getName() ..'] has won the firestorm Event.')
                end
                 Game.broadcastMessage(string.format('%s is the winner of firestorm Event', winner:getName()), MESSAGE_STATUS_WARNING)
            end
            resetfsVariables()
        end
        return false
    end
    return true
end