local acombat1 = createCombatObject()
local acombat2 = createCombatObject()
 
local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 26)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 1)
setCombatFormula(combat1, COMBAT_FORMULA_SKILL, 0, -100000, 0, -150000)

 
 
local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 10)
setCombatFormula(combat2, COMBAT_FORMULA_SKILL, 0, -100000, 0, -150000)

 
arr1 = {
{0, 0, 1, 1, 1, 1, 1, 0, 0},
{0, 1, 0, 0, 1, 0, 0, 1, 0},
{1, 0, 1, 0, 1, 0, 1, 0, 1},
{1, 0, 0, 1, 1, 1, 0, 0, 1},
{1, 1, 1, 1, 3, 1, 1, 1, 1},
{1, 0, 0, 1, 1, 1, 0, 0, 1},
{1, 0, 1, 0, 1, 0, 1, 0, 1},
{0, 1, 0, 0, 1, 0, 0, 1, 0},
{0, 0, 1, 1, 1, 1, 1, 0, 0}
}
 
arr2 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 1, 1, 0, 1, 1, 0, 0},
{0, 1, 0, 1, 0, 1, 0, 1, 0},
{0, 1, 1, 0, 0, 0, 1, 1, 0},
{0, 0, 0, 0, 3, 0, 0, 0, 0},
{0, 1, 1, 0, 0, 0, 1, 1, 0},
{0, 1, 0, 1, 0, 1, 0, 1, 0},
{0, 0, 1, 1, 0, 1, 1, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0}
}
 
local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
setCombatArea(acombat1, area1)
setCombatArea(acombat2, area2)
 
function onTargetTile(cid, pos)
    doCombat(cid,combat1,positionToVariant(pos))
end
 
function onTargetTile2(cid, pos)
    doCombat(cid,combat2,positionToVariant(pos))
end
 
setCombatCallback(acombat1, CALLBACK_PARAM_TARGETTILE, "onTargetTile")
setCombatCallback(acombat2, CALLBACK_PARAM_TARGETTILE, "onTargetTile2")
 
local function onCastSpell1(parameters)
    doCombat(parameters.cid, acombat1, parameters.var)
end
 
local function onCastSpell2(parameters)
    doCombat(parameters.cid, acombat2, parameters.var)
end
 
function onCastSpell(cid, var)
local parameters = { cid = cid, var = var}
addEvent(onCastSpell1, 100, parameters)
addEvent(onCastSpell2, 100, parameters)
return true
end
