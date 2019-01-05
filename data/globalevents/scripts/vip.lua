    local effectDefault = 32

    function onThink(interval)

        local players = Game.getPlayers()
        if #players == 0 then
            return true
        end

        for _, player in pairs(players) do
            if player:getIsVip() then
             player:getPosition():sendMagicEffect(effectDefault)
                player:say('VIP', TALKTYPE_MONSTER_SAY)
            end
        end

        return true
    end