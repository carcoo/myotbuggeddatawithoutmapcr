local foodCondition = Condition(CONDITION_REGENERATION, CONDITIONID_DEFAULT)

function Player.feed(self, food)
	local condition = self:getCondition(CONDITION_REGENERATION, CONDITIONID_DEFAULT)
	if condition then
		condition:setTicks(condition:getTicks() + (food * 1000))
	else
		local vocation = self:getVocation()
		if not vocation then
			return nil
		end

		foodCondition:setTicks(food * 1000)
		foodCondition:setParameter(CONDITION_PARAM_HEALTHGAIN, vocation:getHealthGainAmount())
		foodCondition:setParameter(CONDITION_PARAM_HEALTHTICKS, vocation:getHealthGainTicks() * 1000)
		foodCondition:setParameter(CONDITION_PARAM_MANAGAIN, vocation:getManaGainAmount())
		foodCondition:setParameter(CONDITION_PARAM_MANATICKS, vocation:getManaGainTicks() * 1000)

		self:addCondition(foodCondition)
	end
	return true
end

function Player.getClosestFreePosition(self, position, extended)
	if self:getGroup():getAccess() and self:getAccountType() >= ACCOUNT_TYPE_GOD then
		return position
	end
	return Creature.getClosestFreePosition(self, position, extended)
end

function Player.getDepotItems(self, depotId)
	return self:getDepotChest(depotId, true):getItemHoldingCount()
end

function Player.hasFlag(self, flag)
	return self:getGroup():hasFlag(flag)
end

function Player.getLossPercent(self)
	local blessings = 0
	local lossPercent = {
		[0] = 100,
		[1] = 70,
		[2] = 45,
		[3] = 25,
		[4] = 10,
		[5] = 0
	}

	for i = 1, 5 do
		if self:hasBlessing(i) then
			blessings = blessings + 1
		end
	end
	return lossPercent[blessings]
end
-- Vip x4 System
SVIPSYSTEM = {
        storage = 50001,
                  expRate = 4,
    }
	---Class Player
	--Return integer value
	function Player.getSVipTime(self)
		return self:getStorageValue(SVIPSYSTEM.storage)
	end

	---Class Player
	--Return boolean value
	function Player.setSVipTime(self, value)
		return self:setStorageValue(SVIPSYSTEM.storage, value)
	end

	---Class Player
	--Return boolean value
	function Player.addSVipTime(self, value)
		local currSVipTime = self:getStorageValue(SVIPSYSTEM.storage)
		if currSVipTime > os.time() then
			currSVipTime = (currSVipTime + value)
		else
			currSVipTime = (os.time() + value)
		end
		return self:setStorageValue(SVIPSYSTEM.storage, currSVipTime)
	end

	---Class Player
	--Return boolean value is Vip or not
	function Player.getIsSVip(self)
		return (self:getStorageValue(SVIPSYSTEM.storage) >= os.time())
	end
	
	--[[SevuEntertainment(c)]]--
	--[[Configuration-Default]]--
VIPSYSTEM = {
        storage = 50000,
                  expRate = 2
    }
	---Class Player
	--Return integer value
	function Player.getVipTime(self)
		return self:getStorageValue(VIPSYSTEM.storage)
	end

	---Class Player
	--Return boolean value
	function Player.setVipTime(self, value)
		return self:setStorageValue(VIPSYSTEM.storage, value)
	end

	---Class Player
	--Return boolean value
	function Player.addVipTime(self, value)
		local currVipTime = self:getStorageValue(VIPSYSTEM.storage)
		if currVipTime > os.time() then
			currVipTime = (currVipTime + value)
		else
			currVipTime = (os.time() + value)
		end
		return self:setStorageValue(VIPSYSTEM.storage, currVipTime)
	end

	---Class Player
	--Return boolean value is Vip or not
	function Player.getIsVip(self)
		return (self:getStorageValue(VIPSYSTEM.storage) >= os.time())
	end
	
	--Looter System By Carcoo
	LOOTSYSTEM = {
        storage = 51000,
    }
	---Class Player
	--Return integer value
	function Player.getLootTime(self)
		return self:getStorageValue(LOOTSYSTEM.storage)
	end

	---Class Player
	--Return boolean value
	function Player.setLootTime(self, value)
		return self:setStorageValue(LOOTSYSTEM.storage, value)
	end

	---Class Player
	--Return boolean value
	function Player.addLootTime(self, value)
		local currLootTime = self:getStorageValue(LOOTSYSTEM.storage)
		if currLootTime > os.time() then
			currLootTime = (currLootTime + value)
		else
			currLootTime = (os.time() + value)
		end
		return self:setStorageValue(LOOTSYSTEM.storage, currLootTime)
	end

	---Class Player
	--Return boolean value is Looter or not
	function Player.getIsLoot(self)
		return (self:getStorageValue(LOOTSYSTEM.storage) >= os.time())
	end
	
function Player.isPremium(self)
	return self:getPremiumDays() > 0 or configManager.getBoolean(configKeys.FREE_PREMIUM)
end

function Player.sendCancelMessage(self, message)
	if type(message) == "number" then
		message = Game.getReturnMessage(message)
	end
	return self:sendTextMessage(MESSAGE_STATUS_SMALL, message)
end

function Player.isUsingOtClient(self)
	return self:getClient().os >= CLIENTOS_OTCLIENT_LINUX
end

function Player.sendExtendedOpcode(self, opcode, buffer)
	if not self:isUsingOtClient() then
		return false
	end

	local networkMessage = NetworkMessage()
	networkMessage:addByte(0x32)
	networkMessage:addByte(opcode)
	networkMessage:addString(buffer)
	networkMessage:sendToPlayer(self, false)
	networkMessage:delete()
	return true
end

APPLY_SKILL_MULTIPLIER = true
local addSkillTriesFunc = Player.addSkillTries
function Player.addSkillTries(...)
	APPLY_SKILL_MULTIPLIER = false
	local ret = addSkillTriesFunc(...)
	APPLY_SKILL_MULTIPLIER = true
	return ret
end

local addManaSpentFunc = Player.addManaSpent
function Player.addManaSpent(...)
	APPLY_SKILL_MULTIPLIER = false
	local ret = addManaSpentFunc(...)
	APPLY_SKILL_MULTIPLIER = true
	return ret
end
