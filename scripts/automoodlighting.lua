-- 
-- Please see the LICENSE.md file included with this distribution for attribution and copyright information.
--

function onInit()
	OptionsManager.registerOption2('AUTONIGHTMODE', false, 'option_header_game', 'opt_lab_automood_nightcolor', 'option_entry_cycler', 
		{ labels = 'opt_val_automood_nightcolor_fire', values = 'fire', baselabel = 'opt_val_automood_nightcolor_night'})
	
	if User.isHost() then
		DB.addHandler('calendar.current.hour', 'onUpdate', onTimeChanged)
		onTimeChanged()
	end
end

function onTimeChanged()
	local nHour = DB.getValue(DB.findNode('calendar.current'), 'hour')
	
	if nHour and ((nHour < 6) or (nHour >= 20)) then
		if OptionsManager.isOption('AUTONIGHTMODE', 'fire') then
			Interface.setLighting('FFFFFFFF', 'FFB1C6F4', 'FFFFFFFF', 'FFFFFFFF') -- campfire
		else
			Interface.setLighting('FFFFFFFF', 'FFFFB8A4', 'FFFFFFFF', 'FFFFFFFF') -- night
		end
	elseif nHour and ((nHour >= 6) and (nHour < 20)) then
		Interface.setLighting('FFFFFFFF', 'FFFFFFFF', 'FFFFFFFF', 'FFFFFFFF') -- day
	end
end