local potions = {
-- Config
    titleMsg = "Choose your Potion",
    mainMsg = "Please select how many potions you would like to buy.",
    moneyMsg = "You do not have enough money!", -- This is the message the player will recieve when he does not have enough money.
    capacityMsg = "I need more cap", -- This is the message the player will recieve when he does not have enough capactiy.
    buyMsg = "You have bought ", -- This is the message the player will recieve when he succesfully buys.
-- End Config
 
    -- Change prices in this table here price10 = price for 10 potions etc.
    [1] = {potion = "Mystic Buff", itemID = 24115, price1 = 100000000000, price10 = 1000000000000, note = "you can buy it for 10 gold bars."},
    [2] = {potion = "Mystic Buff Remover", itemID = 21401, price1 = 100000000000, price10 = 1000000000000, note = "you can buy it for 10 gold bars."},
    [3] = {potion = "Domination Curser", itemID = 24714, price1 = 80000000000, price10 = 800000000000, note = "you can buy it for 8 gold bars."},
    [4] = {potion = "Vip Token", itemID = 6527, price1 = 50000000000, price10 = 500000000000, note = "you can buy it for 5 gold bars."},
}
 
function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
    player:sendShopWindow(potions)
    return true
end