local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 167)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 26)
combat:setArea(createCombatArea({
{0, 1, 0},
{1, 3, 1},
{0, 1, 0}
}))
function onGetFormulaValues(player, skill, attack, factor)
local level = player:getLevel()
local min = (skill*3500) + (level/5) + 400000
local max = (skill*3700) + (level/5) + 410000
return -min, -max
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onUseWeapon(cid, var)
	return doCombat(cid, combat, var)
end
