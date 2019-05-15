local robbing = false
local bank = ""
local secondsRemaining = 0

function bank_DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function bank_drawTxt(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
	    SetTextOutline()
	end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

local banks = {
	["fleeca"] = {
		position = { ['x'] = 147.04908752441, ['y'] = -1044.9448242188, ['z'] = 29.36802482605 },
		reward = 10000 + math.random(75000,150000),
		nameofbank = "Banco de plaza",
		lastrobbed = 0,
		copsToRob = 4
	},
	["fleeca2"] = {
		position = { ['x'] = -2957.6674804688, ['y'] = 481.45776367188, ['z'] = 15.697026252747 },
		reward = 10000 + math.random(20000,30000),
		nameofbank = "Banco camino a paleto",
		lastrobbed = 0,
		copsToRob = 3
	},
	["flecaa3"] = {
		
		position = { ['x'] = 311.59384155273, ['y'] = -283.60348510742, ['z'] = 54.164756774902 },
		reward = 10000 + math.random(20000,30000),
		nameofbank = "Blaine County Savings",
		lastrobbed = 0,
		copsToRob = 3
	},
	["tienda"] = {
		position = { ['x'] = 1126.7369384766, ['y'] = -980.61016845703, ['z'] = 45.415672302246 },
		reward = 5000 + math.random(15000,20000),
		nameofbank = "Tienda (Vespucci Boulevard)",
		lastrobbed = 0,
		copsToRob = 2
	},
	["tienda2"] = {
		position = { ['x'] = 1126.7369384766, ['y'] = -980.61016845703, ['z'] = 45.415672302246 },
		reward = 5000 + math.random(15000,20000),
		nameofbank = "Tienda (San Andreas Avenue)",
		lastrobbed = 0,
		copsToRob = 2
	},
	["pacific"] = {
		position = { ['x'] = 255.001098632813, ['y'] = 225.855895996094, ['z'] = 101.005694274902 },
		reward = 60000 + math.random(150000,250000),
		nameofbank = "Pacific Standard PDB (Downtown Vinewood)",
		lastrobbed = 0,
		copsToRob = 5
	}
	--["fleeca4"] = {
		--position = { ['x'] = -354.452575683594, ['y'] = -53.8204879760742, ['z'] = 48.0463104248047 },
		--reward = 30000 + math.random(100000,200000),
		--nameofbank = "Fleeca Bank (Burton)",
		--lastrobbed = 0
	--},
	--["fleeca5"] = {
		--position = { ['x'] = 309.967376708984, ['y'] = -283.033660888672, ['z'] = 53.1745223999023 },
		--reward = 30000 + math.random(100000,200000),
		--nameofbank = "Fleeca Bank (Alta)",
		--lastrobbed = 0
	--},
	--["fleeca6"] = {
		--position = { ['x'] = 1176.86865234375, ['y'] = 2711.91357421875, ['z'] = 38.097785949707 },
		--reward = 30000 + math.random(100000,200000),
		--nameofbank = "Fleeca Bank (Desert)",
		--lastrobbed = 0
	--},
}


RegisterNetEvent('es_bank:currentlyrobbing')
AddEventHandler('es_bank:currentlyrobbing', function(robb)
	robbing = true
	bank = robb
	secondsRemaining = 720
end)

RegisterNetEvent('es_bank:toofarlocal')
AddEventHandler('es_bank:toofarlocal', function(robb)
	robbing = false
	TriggerEvent('chatMessage', 'SYSTEM', {255, 0, 0}, "El robo fue cancelado, no recibiras recompensa.")
	robbingName = ""
	secondsRemaining = 0
	incircle = false
end)

RegisterNetEvent('es_bank:playerdiedlocal')
AddEventHandler('es_bank:playerdiedlocal', function(robb)
	robbing = false
	TriggerEvent('chatMessage', 'SYSTEM', {255, 0, 0}, "El robo fue cancelado, moriste!.")
	robbingName = ""
	secondsRemaining = 0
	incircle = false
end)


RegisterNetEvent('es_bank:robberycomplete')
AddEventHandler('es_bank:robberycomplete', function(reward)
	robbing = false
	TriggerEvent('chatMessage', 'SYSTEM', {255, 0, 0}, "Robo completado, recibiste:^2" .. reward)
	bank = ""
	secondsRemaining = 0
	incircle = false
end)

Citizen.CreateThread(function()
	while true do
		if robbing then
			Citizen.Wait(1000)
			if(secondsRemaining > 0)then
				secondsRemaining = secondsRemaining - 1
			end
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
	while true do
		local pos = GetEntityCoords(GetPlayerPed(-1), true)
		for k,v in pairs(banks)do
			local pos2 = v.position

			if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 15.0)then
				if IsPlayerWantedLevelGreater(PlayerId(),0) or ArePlayerFlashingStarsAboutToDrop(PlayerId()) then
					local wanted = GetPlayerWantedLevel(PlayerId())
					Citizen.Wait(5000)
				    SetPlayerWantedLevel(PlayerId(), wanted, 0)
					SetPlayerWantedLevelNow(PlayerId(), 0)
				end
			end
		end
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
	for k,v in pairs(banks)do
		local ve = v.position

		local blip = AddBlipForCoord(ve.x, ve.y, ve.z)
		SetBlipSprite(blip, 134)
		SetBlipScale(blip, 1.3)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Banco/tienda robable")
		EndTextCommandSetBlipName(blip)
	end
end)
incircle = false

Citizen.CreateThread(function()
	while true do
		local pos = GetEntityCoords(GetPlayerPed(-1), true)

		for k,v in pairs(banks)do
			local pos2 = v.position

			if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 15.0)then
				if not robbing then
					DrawMarker(1, v.position.x, v.position.y, v.position.z - 1, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 1.5001, 1555, 0, 0,255, 0, 0, 0,0)
					
					if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 2)then
						if (incircle == false) then
							bank_DisplayHelpText("Presionar ~INPUT_CONTEXT~ para robar ~b~" .. v.nameofbank .. "~w~ , la policia sera advertida!")
						end
						incircle = true
						if(IsControlJustReleased(1, 51))then
							TriggerServerEvent('es_bank:rob', k)
						end
					elseif(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) > 2)then
						incircle = false
					end
				end
			end
		end

		if robbing then
		    SetPlayerWantedLevel(PlayerId(), 0, 0)
            SetPlayerWantedLevelNow(PlayerId(), 0)
			
			bank_drawTxt(0.66, 1.44, 1.0,1.0,0.4, "Robando banco: ~r~" .. secondsRemaining .. "~w~ segundos restantes", 255, 255, 255, 255)
			
			local pos2 = banks[bank].position
			local ped = GetPlayerPed(-1)
			
            if IsEntityDead(ped) then
			TriggerServerEvent('es_bank:playerdied', bank)
			elseif (Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) > 15)then
				TriggerServerEvent('es_bank:toofar', bank)
			end
		end

		Citizen.Wait(0)
	end
end)