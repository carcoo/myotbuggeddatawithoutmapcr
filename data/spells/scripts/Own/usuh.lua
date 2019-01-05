local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 40)
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, 1)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)

function onGetFormulaValues(player, level, maglevel)
	local min = (level * 5.3) + (maglevel * 2) + 42
	local max = (level * 5.3) + (maglevel * 2) + 42
	
	if min < 300 then
		min = 300
	end

	return min, max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(cid, var)
doCreatureSay(cid,"ULTRA UH!",TALKTYPE_MONSTER_SAY)
	return doCombat(cid, combat, var)
end

