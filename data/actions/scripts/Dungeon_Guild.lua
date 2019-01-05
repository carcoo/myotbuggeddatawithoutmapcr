local config = {
    time = 60 * 60,                               -- 1 Second. (1*60 To Minutes) inside the dungeon.
    level = 150000,                            -- Level Necessary.
    dungeonPos = Position(970, 385, 7),    -- Dungeon Pos.
    needPos = {
        [1] = Position(1060, 875, 7),       -- Position (where the player will click on the lever) and back position.
        [2] = Position(1063, 873, 7),
        [3] = Position(1060, 872, 7),
        [4] = Position(1057, 873, 7)
    },
    fromPos = {x = 900, y = 377, z = 7},   -- Position /\ < from the dungeon
    toPos = {x = 1076, y = 575, z = 7},     -- Position \/ > from the dungeon
 
    Storagetime = 42891,                    -- Storage Time.
    StorageDay = 42892,                     -- Storage Day.
 
    Timer = 24*60*60*7                        -- To re-enter in the dungeon. (24hrs)
}
 
function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
   
    local guild = player:getGuild()
 
    for i = 1, #config.needPos do
       
        local playerTile = Tile(config.needPos[2]):getTopCreature()
        local playerTile1 = Tile(config.needPos[3]):getTopCreature()
        local playerTile2 = Tile(config.needPos[4]):getTopCreature()
 
        if not playerTile or not playerTile:isPlayer() or not playerTile1 or not playerTile1:isPlayer() or not playerTile2 or not playerTile2:isPlayer() then
            player:getPosition():sendMagicEffect(CONST_ME_POFF)
            player:sendTextMessage(MESSAGE_STATUS_DEFAULT, "You need 4 players and stay on the orange floor.")
            return true
        end
 
        if not playerTile:getGuild() and not player:getGuild() and not playerTile1:getGuild() and not playerTile2:getGuild() then
            player:getPosition():sendMagicEffect(CONST_ME_POFF)
            return player:sendTextMessage(MESSAGE_STATUS_SMALL, "One of the members does not have guild.")
        end
 
        if playerTile:getLevel() < config.level or playerTile1:getLevel() < config.level or playerTile2:getLevel() < config.level then
            player:getPosition():sendMagicEffect(CONST_ME_POFF)
            return player:sendTextMessage(MESSAGE_STATUS_SMALL, "All the players need to be level "..config.level.." or higher.")
        end
 
        if player:getGuild():getId() ~= playerTile:getGuild():getId() or player:getGuild():getId() ~= playerTile1:getGuild():getId() or player:getGuild():getId() ~= playerTile2:getGuild():getId() then
            player:getPosition():sendMagicEffect(CONST_ME_POFF)
            return player:sendTextMessage(MESSAGE_STATUS_SMALL, "Only players in your guild can join you.")
        end
 
        if player:getStorageValue(config.Storagetime) - os.time() > 0 and playerTile:getStorageValue(config.Storagetime) - os.time() > 0 and playerTile1:getStorageValue(config.Storagetime) - os.time() > 0 and playerTile2:getStorageValue(config.Storagetime) - os.time() > 0 then
            player:getPosition():sendMagicEffect(CONST_ME_POFF)
            return false
        end
 
        if player:getStorageValue(config.StorageDay) - os.time() > 0 and playerTile:getStorageValue(config.StorageDay) - os.time() > 0 and playerTile1:getStorageValue(config.StorageDay) - os.time() > 0 and playerTile2:getStorageValue(config.StorageDay) - os.time() > 0 then
            player:getPosition():sendMagicEffect(CONST_ME_POFF)
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("You're in cooldown to enter in a dungeon again. Cooldown: %s.", string.diff(player:getStorageValue(config.StorageDay)-os.time())))
            return false
        end
 
        local players = {}
 
        for x = config.fromPos.x, config.toPos.x do
            for y = config.fromPos.y, config.toPos.y do
                for z = config.fromPos.z, config.toPos.z do
                    local tile = Tile(x, y, z)
                    local creature = Tile:getTopCreature()
                    if creature and creature:isPlayer() then
                        players[#players+1] = creature
                    end
                end
            end
        end
 
        if #players > 0 then
            player:getPosition():sendMagicEffect(CONST_ME_POFF)
            return player:sendTextMessage(MESSAGE_STATUS_SMALL, "Already has a guild inside.")
        end
 
        player:teleportTo(config.dungeonPos)
        playerTile:teleportTo(config.dungeonPos)
        playerTile1:teleportTo(config.dungeonPos)
        playerTile2:teleportTo(config.dungeonPos)
        playerTile:getPosition():sendMagicEffect(50)
       
        addEvent(function()
            player:teleportTo(config.needPos[1])
            playerTile:teleportTo(config.needPos[2])
            playerTile1:teleportTo(config.needPos[3])
            playerTile2:teleportTo(config.needPos[4])
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
            playerTile:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
            playerTile1:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
            playerTile2:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
            player:setStorageValue(config.StorageDay, os.time() + config.Timer)
            playerTile:setStorageValue(config.StorageDay, os.time() + config.Timer)
            playerTile1:setStorageValue(config.StorageDay, os.time() + config.Timer)
            playerTile2:setStorageValue(config.StorageDay, os.time() + config.Timer)
        end, config.time*1000)
 
        return false
    end
 
    return true
end