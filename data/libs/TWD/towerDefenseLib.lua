dofile('data/libs/TWD/towerDefenseSpellsArea.lua')
dofile('data/libs/TWD/towerDefenseConfig.lua')
 
targetTurret = nil
turretPosition = nil
 
local twdEvents = {
    "TWDOnLose",
    "TWDBuildWindow",
    "TWDOtherWindow",
    "TWDHealthChange"
}
 
function Player.resetValues(self)
    self:removeItem(2557, 1)
    self:setStorageValue(coinStorage, 0)
    self:addHealth(self:getMaxHealth())
    self:setStorageValue(playingGameStorage, 0)
    self:teleportTo(self:getTown():getTemplePosition())
    for i = 1, #twdEvents do
        self:unregisterEvent(twdEvents[i])
    end
end
 
function sendReward(cid)
    local player = Player(cid)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have won the Tower Of Defense Event.")
    player:addItem(21251, 1)
    player:resetValues()
end
 
function resetEvent()
    turretPosition = nil
    targetTurret = nil
    setWaveLevel(0)
    Game.setStorageValue(totalMonsterKillCountGlobalStorage, 0)
    Game.setStorageValue(totalMonsterCountGlobalStorage, 0)
 
    local specs, turrets = Game.getSpectators(eventCenterPosition, false, false, 40, 40, 40, 40)
    for i = 1, #specs do
        turrets = specs[i]
        if turrets:isNpc() and turrets:getName() == "Turret" then
            turrets:remove()
        end
    end
end
 
-- Everytime the monster need to turn, you have to write the position of the turning point and where it should walk after it reached the point.
local walkPaths = {
    Position(1057, 784, 7),
    Position(1061, 784, 7),
    Position(1061, 793, 7),
    Position(1052, 793, 7),
    Position(1052, 799, 7),
    Position(1063, 799, 7),
    Position(1063, 804, 7),
    Position(1068, 804, 7),
    Position(1068, 799, 7),
    Position(1075, 799, 7),
    Position(1075, 787, 7),
    Position(1072, 787, 7),
    Position(1072, 783, 7)
}
 
local function monsterWalkTo(cid, fromPos, toPos, state) -- Limos
    local toPosState = toPos[state]
    if not toPosState then
        return false
    end
 
    if fromPos.y == toPosState.y then
        fromPos.x = fromPos.x > toPosState.x and fromPos.x - 1 or (fromPos.x < toPosState.x and fromPos.x + 1 or fromPos.x)
         else
        fromPos.y = fromPos.y > toPosState.y and fromPos.y - 1 or (fromPos.y < toPosState.y and fromPos.y + 1 or fromPos.y)
         end
 
    local monster = Monster(cid)
    if not monster then
        return false
    end
 
         monster:teleportTo(fromPos, true)
         if fromPos.x == toPosState.x and fromPos.y == toPosState.y then
             state = state + 1
         end
 
    local speed = monsters[monster:getName()].speed
    if not speed then
        speed = 0
    end
 
         addEvent(monsterWalkTo, 1000 - speed, cid, fromPos, toPos, state)
end
 
function Npc.searchTarget(self, xRange, yRange)
    local target = self:getTarget()
    local specs, creatures = Game.getSpectators(self:getPosition(), false, false, xRange, xRange, yRange, yRange)
    for i = 1, #specs do
        if target then -- We already have a target, which is in range. Let's break the loop then
            break
        end
 
        creatures = specs[i]
        if creatures:isMonster() then -- Let's pick a target, which is a monster
            return self:setTarget(creatures)
        end
    end
end
 
function Npc.shootSpell(self, attackType, target, combat, area, min, max, magicEffect, distEffect)
    if attackType == "aoe" then
        doAreaCombatHealth(self, combat, self:getPosition(), area, -min, -max, magicEffect)
    elseif attackType == "targetAoe" then
        doAreaCombatHealth(self, combat, target:getPosition(), area, -min, -max, magicEffect)
        self:getPosition():sendDistanceEffect(target:getPosition(), distEffect)
    else
        doTargetCombatHealth(self, target, combat, -min, -max, magicEffect)
        self:getPosition():sendDistanceEffect(target:getPosition(), distEffect)
    end
end
 
function getPlayerInEvent(xRange, yRange)
    local player
    if player then
        return player
    end
 
    local specs = Game.getSpectators(eventCenterPosition, false, true, xRange, xRange, yRange, yRange)
    for i = 1, #specs do
        if specs[i]:getStorageValue(playingGameStorage) == 1 then
            player = specs[i]
            return player
        end
    end
end
 
local function summonMonster(name)
    local monster = Game.createMonster(name .."_TWD", summonMonsterPosition, false, true)
    if monster then
        monster:setDirection(EAST)
        monsterWalkTo(monster:getId(), monster:getPosition(), walkPaths, 1)
        summonMonsterPosition:sendMagicEffect(CONST_ME_TELEPORT)
        monster:changeSpeed(-monster:getSpeed() + 130)
 
        local extraHealth = monsters[name].extraHealth
        if extraHealth then
            monster:setMaxHealth(monster:getMaxHealth() + extraHealth)
            monster:addHealth(monster:getMaxHealth())
        end
    end
end
 
function startWaveLevel(level) -- Ninja
    local table, total = waves, 0
    for a = 1, #waves do
        table = waves[level]
        for b = 1, #table.monsters do
            for c = 1, table.monsters[b].count do
                addEvent(function()
                    addEvent(summonMonster, b * table.monsters[b].interval, table.monsters[b].name)
                end, c * table.interval)
            end
 
            total = total + table.monsters[b].count
        end
        break
    end
 
    Game.setStorageValue(totalMonsterCountGlobalStorage, total)
end      
 
function startNextWave(level, interval)
    addEvent(startWaveLevel, interval * 1000, level)
end
 
function Npc.setTurretLevel(self, level)
    if level > 3 then
        level = 3
    end
 
    local lookId = self:getOutfit().lookType
    local setColor = turrets[lookId].cfg[level].colorId
    self:setOutfit({lookType = lookId, lookHead = setColor , lookBody = setColor, lookLegs = setColor, lookFeet = setColor, lookAddons = level})
end
 
function Npc.getTurretLevel(self)
    local addon = self:getOutfit().lookAddons
    if addon == 0 then
        return 1
    end
 
    return addon
end
 
function getWaveLevel()
    return Game.getStorageValue(waveLevelGlobalStorage) or 0
end
 
function setWaveLevel(lvl)
    Game.setStorageValue(waveLevelGlobalStorage, lvl)
end
 
function Player.getCoins(self)
    return self:getStorageValue(coinStorage)
end
 
function Player.addCoins(self, amount)
    self:setStorageValue(coinStorage, math.max(0, self:getStorageValue(coinStorage)) + amount)
end