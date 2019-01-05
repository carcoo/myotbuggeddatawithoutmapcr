local config = {
-- Window Config
    mainTitleMsg = "Crafting System", -- Main window title
    mainMsg = "Welcome to the crafting system. Please choose a vocation to begin.", -- Main window message
 
    craftTitle = "Crafting System: ", -- Title of the crafting screen after player picks of vocation
    craftMsg = "Here is a list of all items that can be crafted for the ", -- Message on the crafting screen after player picks of vocation
-- End Window Config
 
-- Player Notifications Config
    needItems = "You do not have all the required items to make ", -- This is the message the player recieves if he does not have all required items
 
-- Crafting Config
    system = {
    [1] = {vocation = "Master Sorcerer", -- This is the category can be anything.
            items = {
                [1] = {item = "Helmet Of Domination", -- item name (THIS MUST BE EXACT OR IT WILL NOT WORK!)
                        itemID = 15408, -- item to be made
                        reqItems = { -- items and the amounts in order to craft.
                                [1] = {item = 25378, count = 50}, -- b Tokens
                                [2] = {item = 8204, count = 30}, -- magic sulphur
                                [3] = {item = 22727, count = 1}, -- elfs horn
                                [4] = {item = 22607, count = 1}, -- golden prison key
                                [5] = {item = 23474, count = 1}, -- glooth tube
                            },
                        },
                   
                [2] = {item = "Armor Of Domination",
                        itemID = 15489,    
                        reqItems = {
                                [1] = {item = 25380, count = 50}, -- wg Tokens
                                [2] = {item = 21699, count = 30}, -- trapped lightining
                                [3] = {item = 10529, count = 1}, -- serpent trophy
                                [4] = {item = 22606, count = 1}, -- bronze key
                                [5] = {item = 24809, count = 1}, -- forgotten helmet
                            },
                        },                 
               
                [3] = {item = "Legs Of Domination",
                        itemID = 15490,        
                        reqItems = {
                                    [1] = {item = 25379, count = 50}, -- t Tokens
                                [2] = {item = 23588, count = 30}, -- greenlight 
                                [3] = {item = 18527, count = 1}, -- dragon eye
                                [4] = {item = 22604, count = 1}, -- silver key
                                [5] = {item = 18559, count = 1}, -- aventurer stone
                        },
                    },
                   
                [4] = {item = "Boots Of Domination",
                        itemID = 15410,            
                        reqItems = {
                                    [1] = {item = 25377, count = 50}, -- g Tokens
                                [2] = {item = 23876, count = 30}, -- green sulphur
                                [3] = {item = 22474, count = 1}, -- vampirebook
                                [4] = {item = 22605, count = 1}, -- copper key
                                [5] = {item = 25385, count = 1}, -- horns
                        },
                    },
                   
                [5] = {item = "Shield Of Domination",
                        itemID = 15411,            
                        reqItems = {
                                    [1] = {item = 25376, count = 50}, -- s Tokens
                                [2] = {item = 12614, count = 30}, -- draken sulphur
                                [3] = {item = 22728, count = 2}, -- stolen belt
                                [4] = {item = 23542, count = 2}, -- metal bat
                                [5] = {item = 21245, count = 2}, -- blood vial
                        },
                    },
                   
                [6] = {item = "vampire's signet ring",
                        itemID = 25254,        
                        reqItems = {
                                    [1] = {item = 25377, count = 100}, -- g Tokens
                                [2] = {item = 25385, count = 2}, -- horns
                                [3] = {item = 18559, count = 2}, -- adventurer stone
                                [4] = {item = 24809, count = 2}, -- the forgotten knight helmet
                                [5] = {item = 23474, count = 2}, -- glooth injection tube
                        },
                    },
                },
            },
       
    [2] = {vocation= "Elder Druid",
            items = {
                [1] = {item = "Helmet Of Domination", -- item name (THIS MUST BE EXACT OR IT WILL NOT WORK!)
                        itemID = 15408, -- item to be made
                        reqItems = { -- items and the amounts in order to craft.
                                [1] = {item = 25378, count = 50}, -- b Tokens
                                [2] = {item = 8204, count = 30}, -- magic sulphur
                                [3] = {item = 22727, count = 1}, -- elfs horn
                                [4] = {item = 22607, count = 1}, -- golden prison key
                                [5] = {item = 23474, count = 1}, -- glooth tube
                            },
                        },
                   
                [2] = {item = "Armor Of Domination",
                        itemID = 15489,    
                        reqItems = {
                                [1] = {item = 25380, count = 50}, -- wg Tokens
                                [2] = {item = 21699, count = 30}, -- trapped lightining
                                [3] = {item = 10529, count = 1}, -- serpent trophy
                                [4] = {item = 22606, count = 1}, -- bronze key
                                [5] = {item = 24809, count = 1}, -- forgotten helmet
                            },
                        },                 
               
                [3] = {item = "Legs Of Domination",
                        itemID = 15490,        
                        reqItems = {
                                    [1] = {item = 25379, count = 50}, -- t Tokens
                                [2] = {item = 23588, count = 30}, -- greenlight 
                                [3] = {item = 18527, count = 1}, -- dragon eye
                                [4] = {item = 22604, count = 1}, -- silver key
                                [5] = {item = 18559, count = 1}, -- aventurer stone
                        },
                    },
                   
                [4] = {item = "Boots Of Domination",
                        itemID = 15410,            
                        reqItems = {
                                    [1] = {item = 25377, count = 50}, -- g Tokens
                                [2] = {item = 23876, count = 30}, -- green sulphur
                                [3] = {item = 22474, count = 1}, -- vampirebook
                                [4] = {item = 22605, count = 1}, -- copper key
                                [5] = {item = 25385, count = 1}, -- horns
                        },
                    },
                   
                [5] = {item = "Shield Of Domination",
                        itemID = 15411,            
                        reqItems = {
                                    [1] = {item = 25376, count = 50}, -- s Tokens
                                [2] = {item = 12614, count = 30}, -- draken sulphur
                                [3] = {item = 22728, count = 2}, -- stolen belt
                                [4] = {item = 23542, count = 2}, -- metal bat
                                [5] = {item = 21245, count = 2}, -- blood vial
                        },
                    },
                   
                [6] = {item = "vampire's signet ring",
                        itemID = 25254,        
                        reqItems = {
                                    [1] = {item = 25377, count = 100}, -- g Tokens
                                [2] = {item = 25385, count = 2}, -- horns
                                [3] = {item = 18559, count = 2}, -- adventurer stone
                                [4] = {item = 24809, count = 2}, -- the forgotten knight helmet
                                [5] = {item = 23474, count = 2}, -- glooth injection tube
                        },
                    },
                },
            },
           
        [3] = {vocation = "Royal Paladin",
            items = {
                [1] = {item = "Helmet Of Domination", -- item name (THIS MUST BE EXACT OR IT WILL NOT WORK!)
                        itemID = 15408, -- item to be made
                        reqItems = { -- items and the amounts in order to craft.
                                [1] = {item = 25378, count = 50}, -- b Tokens
                                [2] = {item = 8204, count = 30}, -- magic sulphur
                                [3] = {item = 22727, count = 1}, -- elfs horn
                                [4] = {item = 22607, count = 1}, -- golden prison key
                                [5] = {item = 23474, count = 1}, -- glooth tube
                            },
                        },
                   
                [2] = {item = "Armor Of Domination",
                        itemID = 15489,    
                        reqItems = {
                                [1] = {item = 25380, count = 50}, -- wg Tokens
                                [2] = {item = 21699, count = 30}, -- trapped lightining
                                [3] = {item = 10529, count = 1}, -- serpent trophy
                                [4] = {item = 22606, count = 1}, -- bronze key
                                [5] = {item = 24809, count = 1}, -- forgotten helmet
                            },
                        },                 
               
                [3] = {item = "Legs Of Domination",
                        itemID = 15490,        
                        reqItems = {
                                    [1] = {item = 25379, count = 50}, -- t Tokens
                                [2] = {item = 23588, count = 30}, -- greenlight 
                                [3] = {item = 18527, count = 1}, -- dragon eye
                                [4] = {item = 22604, count = 1}, -- silver key
                                [5] = {item = 18559, count = 1}, -- aventurer stone
                        },
                    },
                   
                [4] = {item = "Boots Of Domination",
                        itemID = 15410,            
                        reqItems = {
                                    [1] = {item = 25377, count = 50}, -- g Tokens
                                [2] = {item = 23876, count = 30}, -- green sulphur
                                [3] = {item = 22474, count = 1}, -- vampirebook
                                [4] = {item = 22605, count = 1}, -- copper key
                                [5] = {item = 25385, count = 1}, -- horns
                        },
                    },
                   
                [5] = {item = "Shield Of Domination",
                        itemID = 15411,            
                        reqItems = {
                                    [1] = {item = 25376, count = 50}, -- s Tokens
                                [2] = {item = 12614, count = 30}, -- draken sulphur
                                [3] = {item = 22728, count = 2}, -- stolen belt
                                [4] = {item = 23542, count = 2}, -- metal bat
                                [5] = {item = 21245, count = 2}, -- blood vial
                        },
                    },
                   
                [6] = {item = "vampire's signet ring",
                        itemID = 25254,        
                        reqItems = {
                                    [1] = {item = 25377, count = 100}, -- g Tokens
                                [2] = {item = 25385, count = 2}, -- horns
                                [3] = {item = 18559, count = 2}, -- adventurer stone
                                [4] = {item = 24809, count = 2}, -- the forgotten knight helmet
                                [5] = {item = 23474, count = 2}, -- glooth injection tube
                        },
                    },
                },
            },
       
        [4] = {vocation = "Elite Knight",
                items = {
                [1] = {item = "Helmet Of Domination", -- item name (THIS MUST BE EXACT OR IT WILL NOT WORK!)
                        itemID = 15408, -- item to be made
                        reqItems = { -- items and the amounts in order to craft.
                                [1] = {item = 25378, count = 50}, -- b Tokens
                                [2] = {item = 8204, count = 30}, -- magic sulphur
                                [3] = {item = 22727, count = 1}, -- elfs horn
                                [4] = {item = 22607, count = 1}, -- golden prison key
                                [5] = {item = 23474, count = 1}, -- glooth tube
                            },
                        },
                   
                [2] = {item = "Armor Of Domination",
                        itemID = 15489,    
                        reqItems = {
                                [1] = {item = 25380, count = 50}, -- wg Tokens
                                [2] = {item = 21699, count = 30}, -- trapped lightining
                                [3] = {item = 10529, count = 1}, -- serpent trophy
                                [4] = {item = 22606, count = 1}, -- bronze key
                                [5] = {item = 24809, count = 1}, -- forgotten helmet
                            },
                        },                 
               
                [3] = {item = "Legs Of Domination",
                        itemID = 15490,        
                        reqItems = {
                                    [1] = {item = 25379, count = 50}, -- t Tokens
                                [2] = {item = 23588, count = 30}, -- greenlight 
                                [3] = {item = 18527, count = 1}, -- dragon eye
                                [4] = {item = 22604, count = 1}, -- silver key
                                [5] = {item = 18559, count = 1}, -- aventurer stone
                        },
                    },
                   
                [4] = {item = "Boots Of Domination",
                        itemID = 15410,            
                        reqItems = {
                                    [1] = {item = 25377, count = 50}, -- g Tokens
                                [2] = {item = 23876, count = 30}, -- green sulphur
                                [3] = {item = 22474, count = 1}, -- vampirebook
                                [4] = {item = 22605, count = 1}, -- copper key
                                [5] = {item = 25385, count = 1}, -- horns
                        },
                    },
                   
                [5] = {item = "Shield Of Domination",
                        itemID = 15411,            
                        reqItems = {
                                    [1] = {item = 25376, count = 50}, -- s Tokens
                                [2] = {item = 12614, count = 30}, -- draken sulphur
                                [3] = {item = 22728, count = 2}, -- stolen belt
                                [4] = {item = 23542, count = 2}, -- metal bat
                                [5] = {item = 21245, count = 2}, -- blood vial
                        },
                    },
                   
                [6] = {item = "vampire's signet ring",
                        itemID = 25254,        
                        reqItems = {
                                    [1] = {item = 25377, count = 100}, -- g Tokens
                                [2] = {item = 25385, count = 2}, -- horns
                                [3] = {item = 18559, count = 2}, -- adventurer stone
                                [4] = {item = 24809, count = 2}, -- the forgotten knight helmet
                                [5] = {item = 23474, count = 2}, -- glooth injection tube
                            },
                        },
                    },
                },
            },
        }
 
function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
    player:sendMainCraftWindow(config)
    return true
end