dofile('data/libs/TWD/towerDefenseLib.lua')
 
function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if player:getStorageValue(playingGameStorage) ~= 1 then
        return false
    end
 function Position.getTile(self)
    return Tile(self)
end

    local tile = Position:getTile()
    if tile then
        if not tile:hasFlag(TILESTATE_PROTECTIONZONE) or tile:hasProperty(CONST_PROP_IMMOVABLEBLOCKSOLID) then
            player:sendCancelMessage("You cannot place the turret here.")
            return true
        end
    end
 
    if target:isItem() then
        local modalWindow = ModalWindow(100, "Build Turret", "Here you can select variations of turrets to build.")
        local turret, cfgTable = turrets.allTurretsId
        for i = 1, #turret do
            turret = turrets.allTurretsId[i]
            cfgTable = turrets[turret].cfg
            modalWindow:addChoice(turret, string.format("%s [%s coins]", cfgTable.turretName, cfgTable[1].buildPrice))
        end
 
        modalWindow:addButton(0, "Build")
        modalWindow:setDefaultEnterButton(0)
        modalWindow:addButton(1, "Cancel")
        modalWindow:setDefaultEscapeButton(1)
        modalWindow:sendToPlayer(player)
        turretPosition = toPosition
    elseif target:isNpc() and target:getName() == "Turret" then
        local table = turrets[target:getOutfit().lookType]
        local lvl = target:getTurretLevel()
        local cfg, cfgCombat = table.cfg[lvl], table.combat[lvl]
 
        local turrentInfo = string.format("Turret Information\n----------------------------\nTurret Level: %s\nAttack Type: %s\nRange SQM: %sx%s\nTurret Damage: [%s - %s]\nAttack Speed: %s\nSell/Upgrade Price: [%s / %s]", lvl, string.upper(cfgCombat.attackType), cfg.rangeX, cfg.rangeY, cfgCombat.dmgValues[1], cfgCombat.dmgValues[2], cfg.attackSpeed, cfg.sellPrice, cfg.upgradePrice)
        local playerInfo = string.format("Player Information\n----------------------------\nWave Level: %s\nYour Coins: %s", getWaveLevel(), player:getCoins())
        local modalWindow = ModalWindow(101, "Information", string.format("%s\n\n%s", turrentInfo, playerInfo))
 
        if lvl < 3 then
            modalWindow:addChoice(0, "Upgrade")
        end
        modalWindow:addChoice(1, "Sell")
 
        modalWindow:addButton(0, "Yes")
        modalWindow:setDefaultEnterButton(0)
        modalWindow:addButton(0x01, "Cancel")
        modalWindow:setDefaultEscapeButton(1)
        modalWindow:sendToPlayer(player)
        targetTurret = target
    end
    return true
end