

function onAdvance(player, skill, oldLevel, newLevel)
	local requiredLevel = 75000 -- Required level that the referred player must reach
	local bonusPoints = 500 -- The number of points (in Znote) that the referrer will get

	if skill == SKILL_LEVEL and newLevel >= requiredLevel then
		local accountId = player:getAccountId()
		-- Fetch the ref_key where account_id = accountId and blocked = 0
		local resultId = db.storeQuery("SELECT `ref_key` FROM `__cornex_referral_actions` WHERE `registered_by` = " .. accountId .. " AND `blocked` = 0")
		-- If result is found
		if resultId ~= false then

			-- Fetch the referrer's account_id based on ref_key from previous query result
			local resultId2 = db.storeQuery("SELECT `belongs_to` FROM `__cornex_referral` WHERE `referral_key` = '" .. result.getDataString(resultId, "ref_key") .. "'")
				-- If result is found
			if resultId2 ~= false then     
				-- Update accountId's row blocked value to 1
				db.query("UPDATE `__cornex_referral_actions` SET `blocked` = 1 WHERE `registered_by` = " .. accountId)
				-- Update points to referrer
				db.query("UPDATE `znote_accounts` SET `points` = (points + " .. bonusPoints .. ") WHERE `account_id` = '" .. result.getDataInt(resultId2, "belongs_to") .. "'")
				result.free(resultId2)
			else
				print("Missing ref_key in `__cornex_referral` where ref_key = " .. result.getDataString(resultId, "ref_key"))
			end
			result.free(resultId)

		end
	end
	return true
end