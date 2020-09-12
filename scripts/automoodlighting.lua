-- 
-- Please see the LICENSE.md file included with this distribution for attribution and copyright information.
--

function onInit()
	if User.isHost() then
		DB.addHandler('calendar.current.hour', 'onUpdate', onTimeChanged)
	end
end

function onTimeChanged(node)
	local nodeCurrentTime = node.getParent()
	local nHour = DB.getValue(nodeCurrentTime, 'hour')
	if nHour < 6 or nHour >= 20 then Interface.setLighting('FFFFFFFF', 'FFFFB8A4', 'FFFFFFFF', 'FFFFFFFF') -- night
	elseif nHour >= 6 and nHour < 20 then Interface.setLighting('FFFFFFFF', 'FFFFFFFF', 'FFFFFFFF', 'FFFFFFFF') end -- day
end