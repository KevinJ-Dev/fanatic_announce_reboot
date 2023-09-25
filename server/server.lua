ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function checkreboot()
	local date_local = os.date('%H:%M:%S', os.time())
	if date_local == '11:25:00' then
		TriggerClientEvent('reboot:startRain', -1)
	elseif date_local == '11:36:00' then
		TriggerClientEvent('reboot:startThunder', -1)
	elseif date_local == '11:40:00' then
		TriggerClientEvent('reboot:startThunder', -1)
	elseif date_local == '11:45:00' then
		TriggerClientEvent('esx:showNotification', -1, "Le serveur reboot automatiquement dans 15 minutes !")
	elseif date_local == '11:50:00'  then
		TriggerClientEvent('esx:showNotification', -1, "Le serveur reboot automatiquement dans 10 minutes !")
	elseif date_local == '11:55:00' then
		TriggerClientEvent('esx:showNotification', -1, "Le serveur reboot automatiquement dans 5 minutes !")
		TriggerClientEvent('reboot:startAlarm', -1)
	elseif date_local == '11:57:00' then
		ESX.SavePlayers()
	end
end

function restart_server()
	SetTimeout(1000, function()
		checkreboot()
		restart_server()
	end)
end
restart_server()