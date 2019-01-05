  local minRequireGuildLevel = 2 -- 3 is leader
    local sendEffectToChange = CONST_ME_BLACKSMOKE

    function onSay(player, words, param)

    local guild = player:getGuild()
    if not guild then
        player:sendCancelMessage('Sorry, you no have guild.')
        return false
    end

    local guildLvl = player:getGuildLevel()
    if guildLvl < minRequireGuildLevel then
        player:sendCancelMessage('Sorry, you no have guild level required.')
        return false
    end

    local outfit = player:getOutfit()
    local members = guild:getMembersOnline()
    if #members > 0 then
        for _, member in pairs(members) do
            local mOutfit = member:getOutfit()
            mOutfit.lookHead = outfit.lookHead
            mOutfit.lookBody = outfit.lookBody
            mOutfit.lookLegs = outfit.lookLegs
            mOutfit.lookFeet = outfit.lookFeet
            member:setOutfit(mOutfit)
            member:getPosition():sendMagicEffect(sendEffectToChange)
        end
    end

    return false
    end