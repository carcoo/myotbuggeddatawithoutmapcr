    local effectDefault = 28

    function onThink(interval)

        local players = Game.getPlayers()
        if #players == 0 then
            return true
        end

        for _, player in pairs(players) do
            if player:getAccountType() == ACCOUNT_TYPE_TUTOR then
             player:getPosition():sendMagicEffect(effectDefault)
                player:say('Tutor', TALKTYPE_MONSTER_SAY)
            end
        end

        return true
    end