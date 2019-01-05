      function onStepIn(creature, item, position, fromPosition)
         local player = creature:getPlayer()
            player:teleportTo(fromPosition, true)
        player:teleportTo(Position(1448, 1003, 7))
        Game.broadcastMessage(string.format('%s has joined the Defense Of Tower Event!.', player:getName(), MESSAGE_EVENT_ADVANCE))
        return true
        end