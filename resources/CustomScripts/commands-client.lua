RegisterCommand("me", function(source, args, rawCommand)
    sendMessageInDistance(args[1], 20.0) -- Send with distance radius of 20.0
end, false)

function sendMessageInDistance(message, distance)
	local coords = GetEntityCoords(GetPlayerPed(-1))
	for i = 0, 64 do
		if NetworkIsPlayerActive(i) then
			local ped = GetPlayerPed(id)
		    local playerCoords = GetEntityCoords(GetPlayerPed(i))
			if(Vdist(playerCoords.x, playerCoords.y, playerCoords.z, coords.x, coords.y, coords.z) < distance)then
				TriggerServerEvent('message:inDistanceZone', GetPlayerServerId(id), message)
			end
		end
	end
end