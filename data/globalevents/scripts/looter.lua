    local effectDefault = 30

    function onThink(interval)

        local players = Game.getPlayers()
        if #players == 0 then
            return true
        end

        for _, player in pairs(players) do
            if player:getIsLoot() then
             player:getPosition():sendMagicEffect(effectDefault)
                player:say('LOOTER', TALKTYPE_MONSTER_SAY)
            end
        end

        return true
    end