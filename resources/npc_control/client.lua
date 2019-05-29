Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1) 
		
        for ped in EnumeratePeds() do
            if DoesEntityExist(ped) then
				for i,model in pairs(cfg.peds) do
					if (GetEntityModel(ped) == GetHashKey(model)) then
						veh = GetVehiclePedIsIn(ped, false)
						SetEntityAsNoLongerNeeded(ped)
						SetEntityCoords(ped,10000,10000,10000,1,0,0,1)
						if veh ~= nil then
							SetEntityAsNoLongerNeeded(veh)
							SetEntityCoords(veh,10000,10000,10000,1,0,0,1)
						end
					end
				end
				for i,model in pairs(cfg.noguns) do
					if (GetEntityModel(ped) == GetHashKey(model)) then
						RemoveAllPedWeapons(ped, true)
					end
				end
				for i,model in pairs(cfg.nodrops) do
					if (GetEntityModel(ped) == GetHashKey(model)) then
						SetPedDropsWeaponsWhenDead(ped,false) 
					end
				end
			end
		end
		--[[ WORK IN PROGESS // DOES NOT WORK
        for veh in EnumerateVehicles() do
            if DoesEntityExist(veh) then
				for i,model in pairs(cfg.vehs) do
					if (GetEntityModel(veh) == GetHashKey(model)) then
						SetEntityAsNoLongerNeeded(veh)
						SetEntityCoords(veh,10000,10000,10000,1,0,0,1)
					end
				end
			end
		end
		]]
    end
end)

Citizen.CreateThread(function()
    while true 
        do
         -- These natives has to be called every frame.
        SetPedDensityMultiplierThisFrame(cfg.density.peds)
        SetScenarioPedDensityMultiplierThisFrame(cfg.density.peds, cfg.density.peds)
        SetVehicleDensityMultiplierThisFrame(cfg.density.vehicles)
        SetRandomVehicleDensityMultiplierThisFrame(cfg.density.vehicles)
        SetParkedVehicleDensityMultiplierThisFrame(cfg.density.vehicles)
        Citizen.Wait(0)
    end
end)

-- NPCS no dropean armas------------------------------------------

Citizen.CreateThread(function()
	while true do
	  Citizen.Wait(1)
	  -- List of pickup hashes (https://pastebin.com/8EuSv2r1)
	  RemoveAllPickupsOfType(0xDF711959) -- carbina 
	  RemoveAllPickupsOfType(0xF9AFB48F) -- pistola
	  RemoveAllPickupsOfType(0xA9355DCD) -- escopeta
	  RemoveAllPickupsOfType(0x2E4C762D) -- balas
	  RemoveAllPickupsOfType(0x7E51DB8F) -- launcher
	  RemoveAllPickupsOfType(0x5D95B557) -- balas minigun
	  RemoveAllPickupsOfType(0x43AAEAE6) -- balas pistola
	  RemoveAllPickupsOfType(0xE5EB8146) -- balas rifle
	  RemoveAllPickupsOfType(0x6F38E9FB) -- RPG
	end
  end)

Citizen.CreateThread(function()
	while true do Citizen.Wait(100)
		if IsPedInAnyPoliceVehicle(GetPlayerPed(-1), -1) or IsPedInAnyHeli(GetPlayerPed(-1)) then
			DisablePlayerVehicleRewards(GetPlayerPed(-1))
		end
	end
end)
