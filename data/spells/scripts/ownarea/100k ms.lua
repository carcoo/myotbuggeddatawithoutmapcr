local acombat1 = createCombatObject()
local acombat2 = createCombatObject()
local acombat3 = createCombatObject()

local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 32)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 18)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, 32)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 12)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_DISTANCEEFFECT, 32)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, 39)
 
arr1 = {
{0, 0, 1, 1, 1, 1, 1, 0, 0},
{0, 1, 0, 0, 1, 0, 0, 1, 0},
{1, 0, 0, 0, 1, 0, 0, 0, 1},
{1, 0, 0, 0, 1, 0, 0, 0, 1},
{1, 1, 1, 1, 3, 1, 1, 1, 1},
{1, 0, 0, 0, 1, 0, 0, 0, 1},
{1, 0, 0, 0, 1, 0, 0, 0, 1},
{0, 1, 0, 0, 1, 0, 0, 1, 0},
{0, 0, 1, 1, 1, 1, 1, 0, 0}
}
 
arr2 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 1, 1, 0, 1, 1, 0, 0},
{0, 1, 1, 1, 0, 1, 1, 1, 0},
{0, 1, 1, 1, 0, 1, 1, 1, 0},
{0, 0, 0, 0, 3, 0, 0, 0, 0},
{0, 1, 1, 1, 0, 1, 1, 1, 0},
{0, 1, 1, 1, 0, 1, 1, 1, 0},
{0, 0, 1, 1, 0, 1, 1, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0}
}

arr3 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 1, 1, 0, 1, 1, 0, 0},
{0, 1, 1, 1, 0, 1, 1, 1, 0},
{0, 1, 1, 1, 0, 1, 1, 1, 0},
{0, 0, 0, 0, 3, 0, 0, 0, 0},
{0, 1, 1, 1, 0, 1, 1, 1, 0},
{0, 1, 1, 1, 0, 1, 1, 1, 0},
{0, 0, 1, 1, 0, 1, 1, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0}
}

local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
local area3 = createCombatArea(arr3)
setCombatArea(acombat1, area1)
setCombatArea(acombat2, area2)
setCombatArea(acombat3, area3)
 
function onTargetTile(cid, pos)
    doCombat(cid,combat1,positionToVariant(pos))
end
 
function onTargetTile2(cid, pos)
    doCombat(cid,combat2,positionToVariant(pos))
end

function onTargetTile3(cid, pos)
    doCombat(cid,combat3,positionToVariant(pos))
end
 
setCombatCallback(acombat1, CALLBACK_PARAM_TARGETTILE, "onTargetTile")
setCombatCallback(acombat2, CALLBACK_PARAM_TARGETTILE, "onTargetTile2")
setCombatCallback(acombat3, CALLBACK_PARAM_TARGETTILE, "onTargetTile3")

local function onCastSpell1(parameters)
    doCombat(parameters.cid, acombat1, parameters.var)
end
 
local function onCastSpell2(parameters)
    doCombat(parameters.cid, acombat2, parameters.var)
end

local function onCastSpell3(parameters)
    doCombat(parameters.cid, acombat3, parameters.var)
end

function onGetFormulaValues1(player, level, maglevel)
local maglevel = player:getMagicLevel()
local level = player:getLevel()
min = (maglevel*11700) +level/2 +960000
max = (maglevel*12000) +level/2 +990000
 
return -min, -max
end

function onGetFormulaValues2(player, level, maglevel)
local maglevel = player:getMagicLevel()
local level = player:getLevel()
min = (maglevel*5850) +level/2 +480000
max = (maglevel*6000) +level/2 +495000
 
return -min, -max
end

function onGetFormulaValues3(player, level, maglevel)
local maglevel = player:getMagicLevel()
local level = player:getLevel()
min = (maglevel*5850) +level/2 +480000
max = (maglevel*6000) +level/2 +495000
 
return -min, -max
end

setCombatCallback(combat1, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues1")
setCombatCallback(combat2, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues2")
setCombatCallback(combat3, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues3")

function onCastSpell(cid, var)
local parameters = { cid = cid, var = var}
addEvent(onCastSpell1, 100, parameters)
addEvent(onCastSpell2, 115, parameters)
addEvent(onCastSpell3, 130, parameters)
return true
end
