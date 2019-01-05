local transformItems = {
	[3743] = 4404, [4404] = 3743, [22817] = 22816, [22816] = 22817, [22826] = 22827, [22827] = 22826
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local transformIds = transformItems[item:getId()]
	if not transformIds then
		return false
	end

	item:transform(transformIds)
	return true
end
