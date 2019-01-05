twdConfig = {
    loseHealth = 10, -- How much % should player lose, when the monster walk inside your base
    eventStartTime = 30, -- How long until the event starts, when player step in the teleport [seconds]
    startingCoins = 300, -- How much coins should the player start with!
    startNextWaveTime = 20, -- How long until next wave starts [seconds]
    resetEventTime = 30 -- How long until next player can enter, if someone already was in there [30 seconds] is recommended.
}
 
-- Write unused storage
playingGameStorage = 5151
coinStorage = 5152
 
-- Write unused global storage
waveLevelGlobalStorage = 5153 -- Here write
totalMonsterCountGlobalStorage = 5154
totalMonsterKillCountGlobalStorage = 5155
 
-- Positions
eventRoomPosition = Position(1067, 793, 7) -- Where should player get teleported in the event room?
eventCenterPosition = Position(1067,792, 7) -- Center of the event room
summonMonsterPosition = Position(1057, 784, 7) -- Where should the monster be created?
 
turrets = {
    -- AttackTypes = target, aoe and targetAoe
    -- When you create new turret, make sure to write it's looktype in the [allTurretsId]
 
    allTurretsId = {129, 130, 143},
    [129] = { -- This Example of a target/aoe and targetAoe Turrent [Define by lookType]
        combat = {
            [1] = {attackType = "target", combatType = COMBAT_PHYSICALDAMAGE, combatArea = 0, dmgValues = {10, 25}, magicEffect = CONST_ME_NONE, shootEffect = CONST_ANI_ARROW},
            [2] = {attackType = "targetAoe", combatType = COMBAT_PHYSICALDAMAGE, combatArea = burstArrowArea, dmgValues = {25, 40}, magicEffect = CONST_ME_FIREAREA, shootEffect = CONST_ANI_BURSTARROW},
            [3] = {attackType = "aoe", combatType = COMBAT_PHYSICALDAMAGE, combatArea = AREA_CIRCLE2X2, dmgValues = {40, 55}, magicEffect = CONST_ME_GROUNDSHAKER, shootEffect = CONST_ANI_NONE}
        },
        cfg = {
            turretName = "Archer Tower",
            [1] = {buildPrice = 60, sellPrice = 30, upgradePrice = 200, rangeX = 3, rangeY = 3, colorId = 64, attackSpeed = 1400},
            [2] = {sellPrice = 140, upgradePrice = 300, rangeX = 4, rangeY = 4, colorId = 64, attackSpeed = 1200},
            [3] = {sellPrice = 200, upgradePrice = 0, rangeX = 6, rangeY = 6, colorId = 64, attackSpeed = 1000}
        }
    },
    [143] = { -- This Example of a target/aoe and targetAoe Turrent [Define by lookType]
        combat = {
            [1] = {attackType = "target", combatType = COMBAT_PHYSICALDAMAGE, combatArea = 0, dmgValues = {60, 90}, magicEffect = CONST_ME_NONE, shootEffect = CONST_ANI_ENERGY},
            [2] = {attackType = "targetAoe", combatType = COMBAT_PHYSICALDAMAGE, combatArea = burstArrowArea, dmgValues = {90, 120}, magicEffect = CONST_ME_EXPLOSIONAREA, shootEffect = CONST_ANI_ENERGY},
            [3] = {attackType = "aoe", combatType = COMBAT_PHYSICALDAMAGE, combatArea = AREA_CIRCLE2X2, dmgValues = {120, 150}, magicEffect = CONST_ME_EXPLOSIONAREA, shootEffect = CONST_ANI_ENERGYBALL}
        },
        cfg = {
            turretName = "Berserker Tower",
            [1] = {buildPrice = 300, sellPrice = 150, upgradePrice = 500, rangeX = 4, rangeY = 4, colorId = 114, attackSpeed = 1400},
            [2] = {sellPrice = 250, upgradePrice = 700, rangeX = 5, rangeY = 5, colorId = 114, attackSpeed = 1200},
            [3] = {sellPrice = 500, upgradePrice = 0, rangeX = 6, rangeY = 6, colorId = 114, attackSpeed = 1000}
        }
    },
    [130] = { -- This Example of a target/aoe and targetAoe Turrent [Define by lookType]
        combat = {
            [1] = {attackType = "target", combatType = COMBAT_PHYSICALDAMAGE, combatArea = 0, dmgValues = {30, 60}, magicEffect = CONST_ME_FIREAREA, shootEffect = CONST_ANI_FIRE},
            [2] = {attackType = "targetAoe", combatType = COMBAT_PHYSICALDAMAGE, combatArea = burstArrowArea, dmgValues = {60, 80}, magicEffect = CONST_ME_HOLYAREA, shootEffect = CONST_ANI_ENERGY},
            [3] = {attackType = "aoe", combatType = COMBAT_PHYSICALDAMAGE, combatArea = AREA_CIRCLE2X2, dmgValues = {80, 90}, magicEffect = CONST_ME_MORTAREA, shootEffect = CONST_ANI_SUDDENDEATH}
        },
        cfg = {
            turretName = "Mage Tower",
            [1] = {buildPrice = 120, sellPrice = 60, upgradePrice = 400, rangeX = 6, rangeY = 6, colorId = 65, attackSpeed = 1400},
            [2] = {sellPrice = 280, upgradePrice = 600, rangeX = 6, rangeY = 6, colorId = 65, attackSpeed = 1200},
            [3] = {sellPrice = 400, upgradePrice = 0, rangeX = 6, rangeY = 6, colorId = 65, attackSpeed = 1000}
        }
    }
}
 
monsters = {-- monsterName, "drop" coins, current Health + extraHealth, speed
    ["Rat [Level 1]"] = {
        coins = 5,
        extraHealth = 10,
        speed = 100
    },
    ["Cave Rat [Level 1]"] = {
        coins = 5,
        extraHealth = 10,
        speed = 200
    },
    ["Rat [Level 2]"] = {
        coins = 10,
        extraHealth = 50,
        speed = 300
    },
    ["Cave Rat [Level 2]"] = {
        coins = 10,
        extraHealth = 50,
        speed = 400
    },
    ["Rat [Level 3]"] = {
        coins = 15,
        extraHealth = 100,
        speed = 450
    },
    ["Cave Rat [Level 3]"] = {
        coins = 15,
        extraHealth = 100,
        speed = 450
    }
}
 
waves = {
    maxWaveLevel = 10,
    [1] = {
            interval = 1000,
        goldBonus = 100,
        expBonus = 18600000,
        monsters = {
                        {name = "Rat [Level 1]", count = 10, interval = 500}
            }
    },
    [2] = {
            interval = 1000,
        goldBonus = 150,
        expBonus = 21600000,
        monsters = {
                        {name = "Cave Rat [Level 1]", count = 10, interval = 500}
            }
    },
    [3] = {
            interval = 1000,
        goldBonus = 300,
        expBonus = 25600000,
        monsters = {
                        {name = "Rat [Level 1]", count = 10, interval = 500},
            {name = "Cave Rat [Level 1]", count = 10, interval = 500}
            }
    },
    [4] = {
            interval = 1000,
        goldBonus = 500,
        expBonus = 276000000,
        monsters = {
                        {name = "Rat [Level 1]", count = 10, interval = 500},
			{name = "Rat [Level 2]", count = 10, interval = 500}
            }
    },
    [5] = {
            interval = 1000,
        goldBonus = 700,
        expBonus = 296000000,
        monsters = {
                        {name = "Cave Rat [Level 1]", count = 10, interval = 500},
			{name = "Cave Rat [Level 2]", count = 10, interval = 500}
            }
    },
    [6] = {
            interval = 1000,
        goldBonus = 900,
        expBonus = 316000000,
        monsters = {
                        {name = "Rat [Level 1]", count = 10, interval = 500},
			{name = "Rat [Level 2]", count = 10, interval = 500},
			{name = "Rat [Level 3]", count = 10, interval = 500}
            }
    },
    [7] = {
            interval = 1000,
        goldBonus = 900,
        expBonus = 336000000,
        monsters = {
                        {name = "Cave Rat [Level 1]", count = 10, interval = 500},
			{name = "Cave Rat [Level 2]", count = 10, interval = 500},
			{name = "Cave Rat [Level 3]", count = 10, interval = 500}
            }
    },
    [8] = {
            interval = 1000,
        goldBonus = 900,
        expBonus = 356000000,
        monsters = {
			{name = "Rat [Level 3]", count = 10, interval = 500},
			{name = "Cave Rat [Level 3]", count = 10, interval = 500}
            }
    },
    [9] = {
            interval = 1000,
        goldBonus = 900,
        expBonus = 356000000,
        monsters = {
                        {name = "Rat [Level 2]", count = 10, interval = 500},
			{name = "Rat [Level 3]", count = 10, interval = 500},
			{name = "Cave Rat [Level 2]", count = 10, interval = 500},
			{name = "Cave Rat [Level 3]", count = 10, interval = 500}
            }
    },
    [10] = {
            interval = 1000,
        goldBonus = 2000,
        expBonus = 356000000,
        monsters = {
                        {name = "Rat [Level 1]", count = 10, interval = 500},
			{name = "Rat [Level 2]", count = 10, interval = 500},
			{name = "Rat [Level 3]", count = 10, interval = 500},
			{name = "Cave Rat [Level 1]", count = 10, interval = 500},
			{name = "Cave Rat [Level 2]", count = 10, interval = 500},
			{name = "Cave Rat [Level 3]", count = 10, interval = 500}
            }
    }
}