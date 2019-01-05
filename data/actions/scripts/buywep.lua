local potions = {
-- Config
    titleMsg = "Choose your Item",
    mainMsg = "Please select how many item you would like to buy.",
    moneyMsg = "You do not have enough money!", -- This is the message the player will recieve when he does not have enough money.
    capacityMsg = "I need more cap", -- This is the message the player will recieve when he does not have enough capactiy.
    buyMsg = "You have bought ", -- This is the message the player will recieve when he succesfully buys.
-- End Config
 
    -- Change prices in this table here price10 = price for 10 potions etc.
    [1] = {potion = "Underworld Rod", itemID = 8910, price1 = 3000000, price10 = 30000000, note = "This Weapon needs level 1000, you can buy it for 3 scarab coins."},
    [2] = {potion = "Muck Rod", itemID = 18411, price1 = 5000000, price10 = 50000000, note = "This Weapon needs level 5000, you can buy it for 5 scarab coins."},
    [3] = {potion = "Glacial Rod", itemID = 18412, price1 = 7000000, price10 = 70000000, note = "This Weapon needs level 15000, you can buy it for 7 scarab coins."},
    [4] = {potion = "Shiver Arrow", itemID = 7839, price1 = 7000000, price10 = 70000000, note = "This Weapon needs level 15000, you can buy it for 7 scarab coins."},
    [5] = {potion = "Flaming Arrow", itemID = 7840, price1 = 5000000, price10 = 50000000, note = "This Weapon needs level 5000, you can buy it for 5 scarab coins."},
    [6] = {potion = "Royal Spear", itemID = 7378, price1 = 3000000, price10 = 30000000, note = "This Weapon needs level 1000, you can buy it for 3 scarab coins."},
    [7] = {potion = "Jester Staff", itemID = 7958, price1 = 7000000, price10 = 70000000, note = "This Weapon needs level 15000, you can buy it for 7 scarab coins."},
    [8] = {potion = "Star Wand", itemID = 7735, price1 = 5000000, price10 = 50000000, note = "This Weapon needs level 5000, you can buy it for 5 scarab coins."},
    [9] = {potion = "Crystal Wand", itemID = 2184, price1 = 3000000, price10 = 30000000, note = "This Weapon needs level 1000, you can buy it for 3 scarab coins."},
    [10] = {potion = "Icy Mystic Blade", itemID = 7765, price1 = 3000000, price10 = 30000000, note = "This Weapon needs level 1000, you can buy it for 3 scarab coins."},
    [11] = {potion = "Icy Blacksteel Sword", itemID = 7766, price1 = 5000000, price10 = 50000000, note = "This Weapon needs level 5000, you can buy it for 5 scarab coins."},
    [12] = {potion = "Icy Dragon Slayer", itemID = 7767, price1 = 10000000, price10 = 100000000, note = "This Weapon needs level 15000, you can buy it for 7 scarab coins."},
    [13] = {potion = "Depth Lorica", itemID = 15407, price1 = 10000000, price10 = 100000000, note = "you can buy it for 10 scarab coins."},
    [14] = {potion = "Rainbow Shield", itemID = 8905, price1 = 10000000, price10 = 100000000, note = "you can buy it for 10 scarab coins."},
    [15] = {potion = "Bunnyslippers", itemID = 2644, price1 = 10000000, price10 = 100000000, note = "you can buy it for 10 scarab coins."},
    [16] = {potion = "Golden Armor", itemID = 2466, price1 = 10000000, price10 = 100000000, note = "you can buy it for 10 scarab coins."},
    [17] = {potion = "Golden Helmet", itemID = 2471, price1 = 10000000, price10 = 100000000, note = "you can buy it for 10 scarab coins."},
    [18] = {potion = "Golden Legs", itemID = 2470, price1 = 10000000, price10 = 100000000, note = "you can buy it for 10 scarab coins."},
    [19] = {potion = "Velvet Mantle", itemID = 8868, price1 = 10000000, price10 = 100000000, note = "you can buy it for 10 scarab coins."},
    [20] = {potion = "Robe Of The Underworld", itemID = 8890, price1 = 10000000, price10 = 100000000, note = "you can buy it for 10 scarab coins."},
    [21] = {potion = "The Robe Of The Ice Queen", itemID = 8866, price1 = 10000000, price10 = 100000000, note = "you can buy it for 10 scarab coins."},
    [22] = {potion = "Molten Plate", itemID = 8886, price1 = 10000000, price10 = 100000000, note = "you can buy it for 10 scarab coins."},
    [23] = {potion = "Master Archer's Armor", itemID = 8888, price1 = 10000000, price10 = 100000000, note = "you can buy it for 10 scarab coins."},
    [24] = {potion = "Magic Plate Armor", itemID = 2472, price1 = 10000000, price10 = 100000000, note = "you can buy it for 10 scarab coins."},
    [25] = {potion = "Lavos Armor", itemID = 8877, price1 = 10000000, price10 = 100000000, note = "you can buy it for 10 scarab coins."},
    [26] = {potion = "Frozen Plate", itemID = 8887, price1 = 10000000, price10 = 100000000, note = "you can buy it for 10 scarab coins."},
    [27] = {potion = "Divine Plate", itemID = 8885, price1 = 10000000, price10 = 100000000, note = "you can buy it for 10 scarab coins."},
    [28] = {potion = "Crystalline Armor", itemID = 8878, price1 = 10000000, price10 = 100000000, note = "you can buy it for 10 scarab coins."},
    [29] = {potion = "Blue Armor", itemID = 2656, price1 = 10000000, price10 = 100000000, note = "you can buy it for 10 scarab coins."},
    [30] = {potion = "Amazon Armor", itemID = 2500, price1 = 10000000, price10 = 100000000, note = "you can buy it for 10 scarab coins."},
}
 
function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
    player:sendShopWindow(potions)
    return true
end