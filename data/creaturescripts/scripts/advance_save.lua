local config = {
    save = false,
    effect = true
}
 
function onAdvance(player, skill, oldLevel, newLevel)
    if skill ~= SKILL_LEVEL or newLevel <= oldLevel then
        return true
    end
 
    if config.effect then
        player:getPosition():sendMagicEffect(math.random(CONST_ME_FIREWORK_YELLOW, CONST_ME_FIREWORK_BLUE))
        player:say('LEVEL UP ['.. player:getLevel() ..']!', TALKTYPE_MONSTER_SAY)
    end
 
    if config.save then
        player:save()
    end
    return true
end