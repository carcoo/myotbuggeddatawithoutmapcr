local waves = {
    [1] = Wave({
            ["Dwarf"] = 5,
            ["Dwarf Guard"] = 5,
        }),
    [2] = Wave({
            ["Clay Guardian"] = 8,
        }),
    [3] = Wave({
            ["Deepling Master Librarian"] = 5,
        }),
    [4] = Wave({
            ["Deepling Master Librarian"] = 5,
            ["Deepling Guard"] = 5,
        }),
    [5] = Wave({
            ["Corym Charlatan"] = 5,
            ["Corym Skirmisher"] = 5,
        }),
    [6] = Wave({
            ["Choking Fear"] = 10,
        }),
    [7] = Wave({
            ["Clay Guardian"] = 8,
            ["Dwarf Guard"] = 5,
        }),
    [8] = Wave({
            ["Deepling Master Librarian"] = 8,
            ["Deepling Guard"] = 8,
        }),
    [9] = Wave({
            ["Tyrant"] = 4,
        }),
    [10] = Wave({
            ["Deepling Master Librarian"] = 5,
            ["Deepling Spellsinger"] = 2,
        }),
}
 
local config = {
    levers = {1945, 1946},
}
 
function rewardPlayers(player, arena)
    player:addItem(11259, 1)
    player:addItem(15515, 1)
    player:setStorageValue(21241, os.time() + 24 * 60 * 60)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations, you finished the dungeon " .. arena.name .. ".")
    return true
end
 
function checkPlayer(player)
    if player:getStorageValue(21241) <= os.time() then
        return true
    else
        return false
    end
end
 
function spawnBroadcast(player, waveid, arena)
    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Spawning wave " .. waveid .. ".")
    return true
end
 
function waveClear(player, waveid, arena)
    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You cleared wave " .. waveid .. ".")
    if player:getMaxHealth()-player:getHealth() > 0 then
        player:addHealth(player:getMaxHealth()-player:getHealth())
    end
    return true
end
 
function jokerDeath(player, waveid, arena)
    player:say("MUAHAHAHA", TALKTYPE_MONSTER_SAY, false, player, arena.position)
end
 
function arenaStart(player, arena)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have entered the dungeon " .. arena.name .. ".")
end
 
function arenaThink(arena, interval)
    local players = arena:getPlayersInside()
    if #players == 0 then
        arena:reset()
    else
        for i, player in ipairs(players) do
            player:addHealth(-50000)
        end
    end
end
 
local arena = Arena("Hell", Position(852, 698, 7), Position(1000, 1000, 7), 3, Position(1000, 1000, 7))
arena:addPlayerPosition(Position(1056, 859, 7))
arena:addWaves(unpack(waves))
arena:setJokerCreature("Jaul")
arena:setDelayWaves(1000)
arena:setRewardCallback(rewardPlayers)
arena:setCheckCallback(checkPlayer)
arena:setSpawnCallback(spawnBroadcast)
arena:setWaveclearCallback(waveClear)
arena:setJokerdeathCallback(jokerDeath)
 
arena:setStartCallback(arenaStart)
arena:setThinkCallback(arenaThink)
 
function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if item:getId() == config.levers[1] then
        local ret = arena:useLever(player)
 
        if ret then
            item:transform(config.levers[2])
        else
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("You're in cooldown to enter in a dungeon again. Cooldown: %s.", string.diff(player:getStorageValue(21241) - os.time())))
            item:getPosition():sendMagicEffect(CONST_ME_POFF)
        end
 
    elseif item:getId() == config.levers[2] then
        item:transform(config.levers[1])
    end
    return true
end
