local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 62)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 25)
setCombatFormula(combat, COMBAT_FORMULA_SKILL, -1.9, -390000, -2, -401000)
function onUseWeapon(cid, var)
	return doCombat(cid, combat, var)
end

