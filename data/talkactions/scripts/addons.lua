local text = '--Addon List--\n!addon citizen\n!addon hunter\n!addon mage\n!addon knight\n!addon summoner\n!addon warrior\n!addon barbarian\n!addon druid\n!addon wizard\n!addon oriental\n!addon pirate\n!addon assassin\n!addon beggar\n!addon demonhunter\n!addon shaman\n!addon norseman\n!addon nightmare\n!addon jester\n!addon brotherhood\n!addon warmaster\n--Addon List End--'
 
function onSay(cid, words, param)
local player = Player(cid)
    local cfg = {
        ["citizen"] = {
            outfit = {
                male = 128,
                female = 136,
                addon = 3,
                storage = 10031
            },
            items = {
                {2160, 1}
            }
        },
        ["hunter"] = {
            outfit = {
                male = 129,
                female = 137,
                addon = 3,
                storage = 10032
            },
            items = {
                {2160, 1}
            }
        },
        ["mage"] = {
            outfit = {
                male = 130,
                female = 138,
                addon = 3,
                storage = 10033
            },
            items = {
                {2160, 1}
            }
        },
        ["knight"] = {
            outfit = {
                male = 131,
                female = 139,
                addon = 3,
                storage = 10034
            },
            items = {
                {2160, 1}
            }
        },
        ["summoner"] = {
            outfit = {
                male = 133,
                female = 141,
                addon = 3,
                storage = 10035
            },
            items = {
                {2160, 1}
            }
        },
        ["warrior"] = {
            outfit = {
                male = 134,
                female = 142,
                addon = 3,
                storage = 10029
            },
            items = {
                {2160, 1}
            }
        },
        ["barbarian"] = {
            outfit = {
                male = 143,
                female = 147,
                addon = 3,
                storage = 10037
            },
            items = {
                {2160, 1}
            }
        },
        ["druid"] = {
            outfit = {
                male = 148,
                female = 144,
                addon = 3,
                storage = 10038
            },
            items = {
                {2160, 1}
            }
        },
        ["wizard"] = {
            outfit = {
                male = 145,
                female = 149,
                addon = 3,
                storage = 10049
            },
            items = {
                {2160, 1}
            }
        },
        ["oriental"] = {
            outfit = {
                male = 146,
                female = 150,
                addon = 3,
                storage = 10052
            },
            items = {
                {2160, 1}
            }
        },
        ["pirate"] = {
            outfit = {
                male = 151,
                female = 155,
                addon = 3,
                storage = 10041
            },
            items = {
                {2160, 1}
            }
        },
        ["assassin"] = {
            outfit = {
                male = 152,
                female = 156,
                addon = 3,
                storage = 10042
            },
            items = {
                {2160, 1}
            }
        },
        ["beggar"] = {
            outfit = {
                male = 153,
                female = 157,
                addon = 3,
                storage = 10043
            },
            items = {
                {2160, 1}
            }
        },
        ["shaman"] = {
            outfit = {
                male = 154,
                female = 158,
                addon = 3,
                storage = 10044
            },
            items = {
                {2160, 1}
            }
        },
        ["norseman"] = {
            outfit = {
                male = 251,
                female = 252,
                addon = 3,
                storage = 10045
            },
            items = {
                {2160, 1}
            }
        },
        ["nightmare"] = {
            outfit = {
                male = 268,
                female = 269,
                addon = 3,
                storage = 10046
            },
            items = {
                {2160, 1}
            }
        },
        ["jester"] = {
            outfit = {
                male = 273,
                female = 270,
                addon = 3,
                storage = 10047
            },
            items = {
                {2160, 1}
            }
        },
        ["brotherhood"] = {
            outfit = {
                male = 278,
                female = 279,
                addon = 3,
                storage = 10048
            },
            items = {
                {2160, 1}
            }
        },
        ["demonhunter"] = {
            outfit = {
                male = 289,
                female = 288,
                addon = 3,
                storage = 10051
            },
            items = {
                {2160, 1}
            }
        },
    }
    local v, removeItems = cfg[param], 0, 0
          if(param == "") then
              player:sendTextMessage(MESSAGE_INFO_DESCR, 'Please type !addon outfit')
        player:showTextDialog( 5914, text)
    return false
    end
    if (v == nil) then
          player:sendTextMessage(MESSAGE_INFO_DESCR, "There is no such as outfit named "..param..", here is the list of available outfit.")
        player:showTextDialog(5914, text)
    return false
    end
    if(player:getStorageValue(v.outfit.storage) < 1) then
        for i = 1, #v.items do
            if(player:getItemCount(v.items[i][1]) >= v.items[i][2]) then
                removeItems = removeItems+1
            end
        end
        if(removeItems == #v.items) then
            if(player:getSex(cid) == 1) then
                player:addOutfitAddon(v.outfit.male, v.outfit.addon)
            elseif(player:getSex(cid) == 0) then
                player:addOutfitAddon( v.outfit.female, v.outfit.addon)
            end
            for i = 1, #v.items do
                player:removeItem( v.items[i][1], v.items[i][2])
            end
              player:sendTextMessage(MESSAGE_INFO_DESCR, "Enjoy your new addons to your "..param.." outfit!")
                    player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_YELLOW)
            player:setStorageValue( v.outfit.storage, 1)
        else
            for i = 1, #v.items do
                  player:sendTextMessage(MESSAGE_INFO_DESCR, "you need " .. v.items[i][2] .. "x " .. ItemType(v.items[i][1]):getName() .. " to get the "..param.." addon.")
            end
        end
    else
          player:sendTextMessage(MESSAGE_INFO_DESCR, "you already got the "..param.." addon.")
    end
    return false
end