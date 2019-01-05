function onSay(cid, words, param)
    local p = Player(cid)
    local cost = 10000000
    if(not(isPlayerPzLocked(cid))) then
        if(p:hasBlessing(1) and p:hasBlessing(2) and p:hasBlessing(3) and p:hasBlessing(4) and p:hasBlessing(5) and p:hasBlessing(6)) then
            p:sendCancelMessage("You have already been blessed by the gods.")
            return false
        end
        if(p:removeMoney(cost)) then
            for b = 1,6 do
                p:addBlessing(b)
            end
            p:getPosition():sendMagicEffect(39)
            p:sendTextMessage(19, "You have been blessed by the gods!")
        else
            p:sendCancelMessage("You need "..cost.." gold coins to buy all blessings.")
        end
    else
        p:sendCancelMessage("You can't buy bless, when you are in a battle.")
    end
return false
end