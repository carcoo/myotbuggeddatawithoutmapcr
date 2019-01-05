local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 38)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 28)
combat:setArea(createCombatArea({
{0, 1, 0},
{1, 3, 1},
{0, 1, 0}
}))
function onGetFormulaValues(player, skill, attack, factor)
local level = player:getLevel()
local min = (skill*8500) + (level/5) + 110000
local max = (skill*8500) + (level/5) + 120000
return -min, -max
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onUseWeapon(cid, var)
	return doCombat(cid, combat, var)
end
