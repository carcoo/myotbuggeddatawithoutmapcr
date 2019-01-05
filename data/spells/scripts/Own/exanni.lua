local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, CONST_ME_GROUNDSHAKER)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WHIRLWINDSWORD)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, CONST_ME_GROUNDSHAKER)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WHIRLWINDSWORD)
 
local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, CONST_ME_GROUNDSHAKER)
setCombatParam(combat3, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WHIRLWINDSWORD)
 
arr1 = {
{0, 1, 0},
{1, 3, 1},
{0, 1, 0}
}
 
arr2 = {
{0, 1, 0},
{1, 3, 1},
{0, 1, 0}
}

arr3 = {
{0, 1, 0},
{1, 3, 1},
{0, 1, 0}
}

local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
local area3 = createCombatArea(arr3)
 
setCombatArea(combat1, area1)
setCombatArea(combat2, area2)
setCombatArea(combat3, area3)
 
local function onCastSpell1(parameters)
    return doCombat(parameters.cid, combat1, parameters.var)
end
 
local function onCastSpell2(parameters)
    return doCombat(parameters.cid, combat2, parameters.var)
end
 
local function onCastSpell3(parameters)
    return doCombat(parameters.cid, combat3, parameters.var)
end

function onGetFormulaValues1(player, skill, attack, factor)
local level = player:getLevel()
min = (skill*3200) +level/2 +270000
max = (skill*3400) +level/2 +280000
 
return -min, -max
end

function onGetFormulaValues2(player, skill, attack, factor)
local level = player:getLevel()
local level = player:getLevel()
min = (skill*3200) +level/2 +270000
max = (skill*3400) +level/2 +280000
 
return -min, -max
end

function onGetFormulaValues3(player, skill, attack, factor)
local level = player:getLevel()
local level = player:getLevel()
min = (skill*3200) +level/2 +270000
max = (skill*3400) +level/2 +280000
 
return -min, -max
end

setCombatCallback(combat1, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues1")
setCombatCallback(combat2, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues2")
setCombatCallback(combat3, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues3")

function onCastSpell(cid, var)
local parameters = { cid = cid, var = var}
addEvent(onCastSpell1, 100, parameters)
addEvent(onCastSpell2, 200, parameters)
addEvent(onCastSpell3, 300, parameters)
return true
end