function onSay(player, words, param)

      local condition = Condition(CONDITION_ATTRIBUTES)
      condition:setParameter(CONDITION_PARAM_TICKS, 99999)
      condition:setParameter(CONDITION_PARAM_SUBID, 999)
      condition:setParameter(CONDITION_PARAM_SKILL_LIFE_LEECH_CHANCE, 50)
      player:addCondition(condition)

        return false
    end