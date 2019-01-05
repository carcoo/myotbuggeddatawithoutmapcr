local potions = {
-- Config
    titleMsg = "Choose your Potion",
    mainMsg = "Please select how many potions you would like to buy.",
    moneyMsg = "You do not have enough money!", -- This is the message the player will recieve when he does not have enough money.
    capacityMsg = "I need more cap", -- This is the message the player will recieve when he does not have enough capactiy.
    buyMsg = "You have bought ", -- This is the message the player will recieve when he succesfully buys.
-- End Config
 
    -- Change prices in this table here price10 = price for 10 potions etc.
    [1] = {potion = "Crystal Pedestal", itemID = 9976, price1 = 2000000000, price10 = 20000000000, note = "you can buy it for 20 golden ingots."},
    [2] = {potion = "Golden Falcon", itemID = 8976, price1 = 5000000000, price10 = 50000000000, note = "you can buy it for 50 golden ingots."},
    [3] = {potion = "Spider Silk", itemID = 5879, price1 = 1000000000, price10 = 10000000000, note = "you can buy it for 10 golden ingots."},
    [4] = {potion = "Phoenix Egg", itemID = 11400, price1 = 1000000000, price10 = 10000000000, note = "you can buy it for 10 golden ingots."},
    [5] = {potion = "Forzen Starlight", itemID = 2361, price1 = 10000000000, price10 = 100000000000, note = "you can buy it for a gold bar."},
    [6] = {potion = "Jester Doll", itemID = 9693, price1 = 50000000000, price10 = 500000000000, note = "you can buy it for 5 gold bars."},
    [7] = {potion = "Nightmare Doll", itemID = 11144, price1 = 30000000000, price10 = 300000000000, note = "you can buy it for 3 gold bars."},
    [8] = {potion = "Bookworm Doll", itemID = 20624, price1 = 30000000000, price10 = 300000000000, note = "you can buy it for 3 gold bars."},
    [9] = {potion = "Vampire Doll", itemID = 9019, price1 = 10000000000, price10 = 100000000000, note = "you can buy it for a gold bar."},
    [10] = {potion = "Teddys Bear", itemID = 2112, price1 = 10000000000, price10 = 100000000000, note = "you can buy it for a gold bar."},
    [11] = {potion = "Stuffed Dragon", itemID = 5791, price1 = 20000000000, price10 = 200000000000, note = "you can buy it for 2 gold bars."},
    [12] = {potion = "Santa Teddy", itemID = 11255, price1 = 10000000000, price10 = 100000000000, note = "you can buy it for a gold bar."},
    [13] = {potion = "Panda Teddy", itemID = 5080, price1 = 10000000000, price10 = 100000000000, note = "you can buy it for a gold bar."},
    [14] = {potion = "Ice Cube", itemID = 7441, price1 = 1000000000, price10 = 10000000000, note = "you can buy it for 10 golden ingots."},

}
 
function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
    player:sendShopWindow(potions)
    return true
end