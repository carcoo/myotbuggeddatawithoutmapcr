local config = {
     storage = 93739,
     exstorage = 92739,
     days = {
         ["Monday"] = {
             {itemid = 6527, count = {1, 1}},
             {itemid = 11259, count = {1, 1}},
             {itemid = 21401, count = {1, 1}},
             {itemid = 24115, count = {1, 1}},
             {itemid = 9971, count = {1, 50}}
         },
         ["Tuesday"] = {
             {itemid = 6527, count = {1, 1}},
             {itemid = 11259, count = {1, 1}},
             {itemid = 21401, count = {1, 1}},
             {itemid = 24115, count = {1, 1}},
             {itemid = 9971, count = {1, 50}}
         },
         ["Wednesday"] = {
             {itemid = 6527, count = {1, 1}},
             {itemid = 11259, count = {1, 1}},
             {itemid = 21401, count = {1, 1}},
             {itemid = 24115, count = {1, 1}},
             {itemid = 9971, count = {1, 50}}
         },
         ["Thursday"] = {
             {itemid = 6527, count = {1, 1}},
             {itemid = 11259, count = {1, 1}},
             {itemid = 21401, count = {1, 1}},
             {itemid = 24115, count = {1, 1}},
             {itemid = 9971, count = {1, 50}}
         },
         ["Friday"] = {
             {itemid = 6527, count = {1, 1}},
             {itemid = 11259, count = {1, 1}},
             {itemid = 21401, count = {1, 1}},
             {itemid = 24115, count = {1, 1}},
             {itemid = 9971, count = {1, 50}}
         },
         ["Saturday"] = {
             {itemid = 6527, count = {1, 1}},
             {itemid = 11259, count = {1, 1}},
             {itemid = 21401, count = {1, 1}},
             {itemid = 24115, count = {1, 1}},
             {itemid = 9971, count = {1, 50}}
         },
         ["Sunday"] = {
             {itemid = 6527, count = {1, 1}},
             {itemid = 11259, count = {1, 1}},
             {itemid = 21401, count = {1, 1}},
             {itemid = 24115, count = {1, 1}},
             {itemid = 9971, count = {1, 50}}
         }
     }
}
 
function onUse(cid, item, fromPosition, itemEx, toPosition, isHotkey)
    if Game.getStorageValue(29294) == 1 then
     local player = Player(cid)
     local x = config.days[os.date("%A")]
     if player:getStorageValue(config.storage) == tonumber(os.date("%w")) and player:getStorageValue(config.exstorage) > os.time() then
         return player:sendCancelMessage("The chest is empty, come back tomorrow for a new reward.")
     end
     local c = math.random(#x)
     local info, count = ItemType(x[c].itemid), x[c].count[2] and math.random(x[c].count[1], x[c].count[2]) or x[c].count[1]
     if count > 1 then
         text = count .. " " .. info:getPluralName()
     else
         text = info:getArticle() .. " " .. info:getName()
     end
     local itemx = Game.createItem(x[c].itemid, count)
     if player:addItemEx(itemx) ~= RETURNVALUE_NOERROR then
         player:getPosition():sendMagicEffect(CONST_ME_POFF)
         text = "You have found a reward weighing " .. itemx:getWeight() .. " oz. It is too heavy or you have not enough space."
     else
         text = "You have received " .. text .. "."
         player:setStorageValue(config.storage, tonumber(os.date("%w")))
         player:setStorageValue(config.exstorage, os.time() + 24*60*60)
     end
     player:sendTextMessage(MESSAGE_INFO_DESCR, text)
	 else
     local player = Player(cid)
	 player:sendTextMessage(MESSAGE_INFO_DESCR, "We are not celebrating anything these days, you will notice when we do.")
	 end
	 return true
end
 