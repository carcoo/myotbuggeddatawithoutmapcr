local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 46)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 38)
combat:setArea(createCombatArea({
{0, 1, 0},
{1, 3, 1},
{0, 1, 0}
}))
function onGetFormulaValues(player, maglevel, attack, factor)
local level = player:getLevel()
local maglevel = player:getMagicLevel()
local min = (maglevel*7750) + (level/5) + 105000
local max = (maglevel*7750) + (level/5) + 115000
return -min, -max
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onUseWeapon(cid, var)
	return doCombat(cid, combat, var)
end
