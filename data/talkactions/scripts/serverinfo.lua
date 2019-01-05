function onSay(player, words, param)
local config = {
	rateExperience = Game.getExperienceStage(player:getLevel()),
	rateSkill = configManager.getNumber(configKeys.RATE_SKILL),
	rateLoot = configManager.getNumber(configKeys.RATE_LOOT),
	rateMagic = configManager.getNumber(configKeys.RATE_MAGIC),
	protectionLevel = getConfigInfo('protectionLevel'),
}
	player:popupFYI("Server Information:\n\nExperience rate: x" .. config.rateExperience .. "\nSkills rate: x" .. config.rateSkill .. "\nLoot rate: x" .. config.rateLoot .. "\nMagic rate: x" .. config.rateMagic .. "\nProtection level: " .. config.protectionLevel)
	return false
end
