-- firestorm Variables
fsJoinedCountGlobalStorage = 18900 --Player joined event count / recuento de players.
fsJoinStorage = 18901 --player join storage / storage del jugador a unirse.
fsMinPlayers = 2 --min players needed when time runout / minimo de players necesarios para comenzar el evento.
fsMaxPlayers = 20 --max players to join / maximo de players.
fsTrophy = 7369 --trophy itemid / itemid del premio(que no sea stackable).
fsEventCountGlobalStorage = 18902 --firestorm Count (no move/no moverle).
fsWaitMinutes = 1 --when event has opened, how long until it starts? / cuantos minutos tarde el evento en empezar.
fsWaitingRoomPos = Position(1508, 657, 7) --middle of waiting room / punto medio de el cuarto de espera.
fsArena = Position(1510, 628, 7) --when even start where should player be teleported in the arena? / punto donde seran transportados los players.
fsArenaFromPosition = Position(1505, 619, 7) --pos of top left corner / posicion de esquina superior izquierda.
fsArenaToPosition = Position(1523, 636, 7) --pos of bottom right corner /posicion de esquina inferior derecha.
fsMiddleEventArena = Position(1514, 628, 7) --Middle pos of the arena / punto medio de la arena
fsWaitingRoomRadiusX = 13 --depends how big the waiting room is 20sqm to x / depende de lo grande la sala de espera en x
fsWaitingRoomRadiusY = 7 --depends how big the waiting room is 20sqm to y / depende de lo grande la sala de espera en y
fsEventArenaRadiusX = 19 --Depends how big the firestorm arena is 50sqm to x / depende de lo grande de la arena en x
fsEventArenaRadiusY = 18 --Depends how big the firestorm arena is 50sqm to y / depende de lo grande de la arena en y
fsStartedGlobalStorage = 18903 -- Value: 0 == false, 1 == true, 2 == started --State of the event
fsCreateTeleportPosition = Position(1428, 999, 7) --Where should the teleport be created? / posicion donde sera creado el teleport?
 
function startfirestorm()
    local specs = Game.getSpectators(fsWaitingRoomPos, false, true, 0, fsWaitingRoomRadiusX, 0, fsWaitingRoomRadiusY)
    if Game.getStorageValue(fsJoinedCountGlobalStorage) <= fsMinPlayers then
        for i = 1, #specs do
            specs[i]:teleportTo(specs[i]:getTown():getTemplePosition(), false)
            specs[i]:setStorageValue(fsJoinStorage, 0)
        end
        resetfsVariables()
        Game.broadcastMessage('firestorm Event failed to start, because of to little players joined the event!', MESSAGE_STATUS_WARNING)
        return true
    end
    for i = 1, #specs do
        local rX, rY, rZ
        rX = math.random(fsArenaFromPosition.x, fsArenaToPosition.x)
        rY = math.random(fsArenaFromPosition.y, fsArenaToPosition.y)
        rZ = math.random(fsArenaFromPosition.z, fsArenaToPosition.z)
        specs[i]:teleportTo(Position(rX, rY, rZ))
    end
    Game.broadcastMessage("firestorm Event has started, good luck to all participant.", MESSAGE_STATUS_WARNING)
    Game.setStorageValue(fsStartedGlobalStorage, 2)
    doStartfirestorm()
end
 
function doStartfirestorm()
        if  Game.getStorageValue(fsJoinedCountGlobalStorage) > fsMaxPlayers then return false end
                if Game.getStorageValue(fsStartedGlobalStorage) == 2 then
                local specs = Game.getSpectators(fsArena, false, true, 0, 10, 0, 10)
                 for i = 1, #specs do
        local randX, randY, randZ
        randX = math.random(fsArenaFromPosition.x, fsArenaToPosition.x)
        randY = math.random(fsArenaFromPosition.y, fsArenaToPosition.y)
        randZ = math.random(fsArenaFromPosition.z, fsArenaToPosition.z)
                local randfire = Position(randX, randY, randZ)
                 local randX1, randY1, randZ1
        randX1 = math.random(fsArenaFromPosition.x, fsArenaToPosition.x)
        randY1 = math.random(fsArenaFromPosition.y, fsArenaToPosition.y)
        randZ1 = math.random(fsArenaFromPosition.z, fsArenaToPosition.z)
                local randfire1 = Position(randX1, randY1, randZ1)
            local creature, players = nil, Game.getPlayers()
                                                 for i = 1, #players do
                                                 creature = players[i]
                doSendDistanceShoot(fsArenaFromPosition, randfire, 4)
                doSendDistanceShoot(fsArenaToPosition, randfire, 4)
                doSendDistanceShoot(Position(1523, 619, 7), randfire, 4)
                doSendDistanceShoot(Position(1505, 636, 7), randfire, 4)
				doSendMagicEffect(randfire, 7)
           local target = Tile(randfire):getBottomCreature()
             if target then
                Creature(target):addHealth(-target:getMaxHealth())
             end
                end
                                end
 
            addEvent(doStartfirestorm, 500)
        end
end
 
function resetfsVariables()
        Game.setStorageValue(fsEventCountGlobalStorage, 0)
        Game.setStorageValue(fsJoinedCountGlobalStorage, 0)
        Game.setStorageValue(fsStartedGlobalStorage, 0)
end