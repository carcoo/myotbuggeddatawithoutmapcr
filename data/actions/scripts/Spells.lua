local Cancelwords = "You need to have a vocation and be over level 150000 to read this book."
local Sorcererwords = "You've learned the Extreme Energy Spell say \"Extreme Vis\" to cast it."
local Druidwords = "You've learned the Extreme Ice Spell say \"Extreme Frigo\" to cast it."
local Paladinwords = "You've learned the Extreme Holy Spell say \"Extreme Holy\" to cast it."
local Knightwords = "You've learned the Extreme Physical Spell say \"Extreme Anni\" to cast it."

 
function onUse(cid, item, frompos, item2, topos)
        if (getPlayerVocation(cid) == 1 or getPlayerVocation(cid) == 5) then
                playerLearnInstantSpell(cid, "Extreme Vis")
                doCreatureSay(cid, Sorcererwords, 19)
                doRemoveItem(cid, item.uid, 1)
        elseif (getPlayerVocation(cid) == 2 or getPlayerVocation(cid) == 6) then
                playerLearnInstantSpell(cid, "Extreme Frigo")
                doCreatureSay(cid, Druidwords, 19)
                doRemoveItem(cid, item.uid, 1)
        elseif (getPlayerVocation(cid) == 3 or getPlayerVocation(cid) == 7) then
                playerLearnInstantSpell(cid, "Extreme Holy")
                doCreatureSay(cid, Paladinwords, 19)
                doRemoveItem(cid, item.uid, 1)
        elseif (getPlayerVocation(cid) == 4 or getPlayerVocation(cid) == 8) then
                playerLearnInstantSpell(cid, "Extreme Anni")
                doCreatureSay(cid, Knightwords, 19)
                doRemoveItem(cid, item.uid, 1)
        else
                doPlayerSendCancel(cid, Cancelwords)
        end
        return 1
end