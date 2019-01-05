-- When player dies in Zombie Arena
function onDeath(player, corpse, killer, mostDamageKiller, lastHitUnjustified, mostDamageUnjustified)
 
    -- Has the event started?
    if not zombieArena:isStarted() then
        return false
    end
 
    -- Did a player die?
    if player:isPlayer() then
       
        -- Is the player doing the event?
        if not zombieArena:isPlayerOnEvent(player) then
            return false
        end
 
        zombieArena:removePlayer(player)
        zombieArena:debug(player:getName() .. " got teleported to " .. player:getTown():getName() .. ".")
 
        zombieArena:checkArena()
    end
    return true
end
 