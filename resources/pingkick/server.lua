-- CONFIG --

-- Ping Limit
pingLimit = 2000

-- CODE --

RegisterServerEvent("checkMyPingBro")
AddEventHandler("checkMyPingBro", function()
	ping = GetPlayerPing(source)
	if ping >= pingLimit then
		DropPlayer(source, "Tu ping es demasiado alto (Limite: " .. pingLimit .. " Tu ping: " .. ping .. ")")
	end
end)