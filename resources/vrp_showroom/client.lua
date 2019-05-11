
vRP = Proxy.getInterface("vRP")
vRPg = Proxy.getInterface("vRP_garages")
heading = 0

function deleteVehiclePedIsIn()
  local v = GetVehiclePedIsIn(GetPlayerPed(-1),false)
  SetVehicleHasBeenOwnedByPlayer(v,false)
  Citizen.InvokeNative(0xAD738C3085FE7E11, v, false, true) -- set not as mission entity
  SetVehicleAsNoLongerNeeded(Citizen.PointerValueIntInitialized(v))
  Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(v))
end

RegisterNetEvent( 'wk:deleteVehicle2' )
AddEventHandler( 'wk:deleteVehicle2', function()
    local ped = GetPlayerPed( -1 )

    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
        local pos = GetEntityCoords( ped )

        if ( IsPedSittingInAnyVehicle( ped ) ) then 
            local vehicle = GetVehiclePedIsIn( ped, false )

            if ( GetPedInVehicleSeat( vehicle, -1 ) == ped ) then 
                SetEntityAsMissionEntity( vehicle, true, true )
                deleteCar( vehicle )

                if ( DoesEntityExist( vehicle ) ) then 
                	ShowNotification( "~r~No es posible borrar el vehiculo, intenta nuevamente." )
                else 
                	ShowNotification( "Vehiculo eliminado." )
                end 
            else 
                ShowNotification( "Debes estar en el asiento del conductor!" )
            end 
        else
            local playerPos = GetEntityCoords( ped, 1 )
            local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords( ped, 0.0, distanceToCheck, 0.0 )
            local vehicle = GetVehicleInDirection( playerPos, inFrontOfPlayer )

            if ( DoesEntityExist( vehicle ) ) then 
                SetEntityAsMissionEntity( vehicle, true, true )
                deleteCar( vehicle )

                if ( DoesEntityExist( vehicle ) ) then 
                	ShowNotification( "~r~No es posible borrar el vehiculo, intenta nuevamente." )
                else 
                	ShowNotification( "Vehiculo eliminado." )
                end 
            else 
                ShowNotification( "Debes estar en o cerca del vehiculo para borrarlo" )
            end 
        end 
    end 
end )

function deleteCar( entity )
    Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( entity ) )
end

-- Gets a vehicle in a certain direction
-- Credit to Konijima
function GetVehicleInDirection( coordFrom, coordTo )
    local rayHandle = CastRayPointToPoint( coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, GetPlayerPed( -1 ), 0 )
    local _, _, _, _, vehicle = GetRaycastResult( rayHandle )
    return vehicle
end

-- Shows a notification on the player's screen 
function ShowNotification( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end

local vehshop = {
	opened = false,
	title = "Concesionario",
	currentmenu = "main",
	lastmenu = nil,
	currentpos = nil,
	selectedbutton = 0,
	marker = { r = 0, g = 155, b = 255, a = 200, type = 1 },
	menu = {
		x = 0.1,
		y = 0.08,
		width = 0.2,
		height = 0.04,
		buttons = 10,
		from = 1,
		to = 10,
		scale = 0.4,
		font = 0,
		["main"] = {
			title = "Concesionario",
			name = "main",
			buttons = {
				{name = "Autos", description = ""},
				{name = "Motos", description = ""},
			}
		},
		["Autos"] = {
			title = "Autos",
			name = "Autos",
			buttons = {
				{name = "audi", description = ''},
				{name = "bmw", description = ''},
				{name = "Volkswagen", description = ''},
			}
		},
		["Audi"] = {
			title = "Audi",
			name = "Audi",
			buttons = {
				{name = "Audi A4", costs = 500000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "aaq4"},
			}
		},
		["BMW"] = {
			title = "BMW",
			name = "BMW",
			buttons = {
				{name = "I8", costs = 5000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "i8"},
			}
		},
		["Volkswagen"] = {
			title = "Volkswagen",
			name = "Volkswagen",
			buttons = {
				{name = "Bora", costs = 5000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "elegy"},
			}
		},
		-------------------Motos----------------------
		["Motos"] = {
			title = "Motos",
			name = "Motos",
			buttons = {
				{name = "ducati", description = ''},
			}
		},
		["Ducati"] = {
			title = "Ducati",
			name = "Ducati",
			buttons = {
				{name = "ducati", costs = 5000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "bati"},
			}
		},

	}
}

local fakecar = {model = '', car = nil}
local vehshop_locations = {
{entering = {-30.026309967042,-1105.0656738282,26.422369003296}, inside = {-75.28823852539,-819.08709716796,326.17541503906}, outside = {-29.130708694458,-1081.6518554688,26.638877868652}},
}

local vehshop_blips ={}
local inrangeofvehshop = false
local currentlocation = nil
local boughtcar = false


function vehPrs_drawTxt(text)
	SetTextComponentFormat("STRING")
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function vehSR_drawTxt(text,font,centre,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x , y)
end

function vehSR_IsPlayerInRangeOfVehshop()
	return inrangeofvehshop
end

local firstspawn = 0
AddEventHandler('playerSpawned', function(spawn)
if firstspawn == 0 then
	--326 car blip 227 225
	vehSR_ShowVehshopBlips(true)
	firstspawn = 1
end
end)

function vehSR_ShowVehshopBlips(bool)
	if bool and #vehshop_blips == 0 then
		for station,pos in pairs(vehshop_locations) do
			local loc = pos
			pos = pos.entering
			local blip = AddBlipForCoord(pos[1],pos[2],pos[3])
			-- 60 58 137
			SetBlipSprite(blip,326)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString("Showroom")
			EndTextCommandSetBlipName(blip)
			SetBlipAsShortRange(blip,true)
			SetBlipAsMissionCreatorBlip(blip,true)
			table.insert(vehshop_blips, {blip = blip, pos = loc})
		end
		Citizen.CreateThread(function()
			while #vehshop_blips > 0 do
				Citizen.Wait(0)
				local inrange = false
				for i,b in ipairs(vehshop_blips) do
					if IsPlayerWantedLevelGreater(GetPlayerIndex(),0) == false and vehshop.opened == false and IsPedInAnyVehicle(vehSR_LocalPed(), true) == false and  GetDistanceBetweenCoords(b.pos.entering[1],b.pos.entering[2],b.pos.entering[3],GetEntityCoords(vehSR_LocalPed())) < 2.5 then
						--DrawMarker(36,b.pos.entering[1],b.pos.entering[2],b.pos.entering[3]-0.2,0,0,0,0,0,0,0.5,0.3,0.5,0,155,255,150,0,true,0,true)
						vehPrs_drawTxt("Presiona ~INPUT_CELLPHONE_SELECT~ para hablar con el ~r~Agente de ventas")
						currentlocation = b
						inrange = true
					end
				end
				inrangeofvehshop = inrange
			end
		end)
	elseif bool == false and #vehshop_blips > 0 then
		for i,b in ipairs(vehshop_blips) do
			if DoesBlipExist(b.blip) then
				SetBlipAsMissionCreatorBlip(b.blip,false)
				Citizen.InvokeNative(0x86A652570E5F25DD, Citizen.PointerValueIntInitialized(b.blip))
			end
		end
		vehshop_blips = {}
	end
end

vehSR_ShowVehshopBlips(true)

function vehSR_f(n)
	return n + 0.0001
end

function vehSR_LocalPed()
	return GetPlayerPed(-1)
end

function vehSR_try(f, catch_f)
	local status, exception = pcall(f)
	if not status then
		catch_f(exception)
	end
end
function vehSR_firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end
--local veh = nil
function vehSR_OpenCreator()
	boughtcar = false
	local ped = vehSR_LocalPed()
	local pos = currentlocation.pos.inside
	FreezeEntityPosition(ped,true)
	local g = Citizen.InvokeNative(0xC906A7DAB05C8D2B,pos[1],pos[2],pos[3],Citizen.PointerValueFloat(),0)
	SetEntityCoords(ped,pos[1],pos[2],g)
	SetEntityHeading(ped,pos[4])
	SetEntityVisible(ped,false)
	vehshop.currentmenu = "main"
	vehshop.opened = true
	vehshop.selectedbutton = 0
end

local vehicle_price = 0
function vehSR_CloseCreator(vehicle,veh_type)
	Citizen.CreateThread(function()
		local ped = vehSR_LocalPed()
		if not boughtcar then
			local pos = currentlocation.pos.entering
			SetEntityCoords(ped,pos[1],pos[2],pos[3])
			FreezeEntityPosition(ped,false)
			SetEntityVisible(ped,true)
			vRP.teleport({-39.77363204956,-1110.4862060546,26.438457489014})
			SetEntityHeading(ped, 180.0)
			scaleform = nil
		else
			deleteVehiclePedIsIn()
			vRP.teleport({-39.77363204956,-1110.4862060546,26.438457489014})
			SetEntityHeading(ped, 180.0)
			--vRPg.spawnBoughtVehicle({veh_type, vehicle})
			SetEntityVisible(ped,true)
			FreezeEntityPosition(ped,false)
		end
		vehshop.opened = false
		vehshop.menu.from = 1
		vehshop.menu.to = 10
	end)
end

function vehSR_drawMenuButton(button,x,y,selected)
	local menu = vehshop.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(button.name)
	if selected then
		DrawRect(x,y,menu.width,menu.height,255,255,255,255)
	else
		DrawRect(x,y,menu.width,menu.height,0,0,0,150)
	end
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end

function vehSR_drawMenuTitle(txt,x,y)
local menu = vehshop.menu
	SetTextFont(2)
	SetTextProportional(0)
	SetTextScale(0.5, 0.5)
	SetTextColour(255, 255, 255, 255)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawRect(x,y,menu.width,menu.height,0,0,0,150)
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end

simeonX, simeonY, simeonZ = -30.41927909851, -1106.771118164, 26.25236328125

function DrawText3D(x,y,z, text, scl) 

    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*scl
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
        SetTextScale(0.0*scale, 1.1*scale)
        SetTextFont(1)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

Citizen.CreateThread(function()
	simeon = 1283141381
	RequestModel( simeon )
	while ( not HasModelLoaded( simeon ) ) do
		Citizen.Wait( 1 )
	end
	theSimeon = CreatePed(4, simeon, simeonX, simeonY, simeonZ, 90, false, false)
	SetModelAsNoLongerNeeded(simeon)
	SetEntityHeading(theSimeon, -15.0)
	FreezeEntityPosition(theSimeon, true)
	SetEntityInvincible(theSimeon, true)
	SetBlockingOfNonTemporaryEvents(theSimeon, true)
	TaskStartScenarioAtPosition(theSimeon, "PROP_HUMAN_SEAT_BENCH", simeonX, simeonY, simeonZ-0.35, GetEntityHeading(theSimeon), 0, 0, false)
end)

Citizen.CreateThread(function()
	while true do
		local pos = GetEntityCoords(GetPlayerPed(-1), true)
		if(GetDistanceBetweenCoords(pos.x, pos.y, pos.z, simeonX, simeonY, simeonZ) < 5.5)then
			DrawText3D(simeonX, simeonY, simeonZ+0.8, "~r~Agente de ventas", 1.2)
		end
		Citizen.Wait(0)
	end
end)


function vehSR_tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end
function vehSR_Notify(text)
SetNotificationTextEntry('STRING')
AddTextComponentString(text)
DrawNotification(false, false)
end

function vehSR_drawMenuRight(txt,x,y,selected)
	local menu = vehshop.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawText(x + menu.width/2 - 0.06, y - menu.height/2 + 0.0028)
end
scaleform = nil
function Initialize(scaleform, price, vehName, speed, acce, brake, trac)
	scaleform = RequestScaleformMovie(scaleform)
	while not HasScaleformMovieLoaded(scaleform) do
		Citizen.Wait(0)
	end
	PushScaleformMovieFunction(scaleform, "SET_VEHICLE_INFOR_AND_STATS")
	PushScaleformMovieFunctionParameterString(vehName)
	PushScaleformMovieFunctionParameterString(price)
	PushScaleformMovieFunctionParameterString("MPCarHUD")
	PushScaleformMovieFunctionParameterString("Benefactor")
	PushScaleformMovieFunctionParameterString("Speed")
	PushScaleformMovieFunctionParameterString("Acceleration")
	PushScaleformMovieFunctionParameterString("Brakes")
	PushScaleformMovieFunctionParameterString("Traction")
	PushScaleformMovieFunctionParameterInt(speed or 100)
	PushScaleformMovieFunctionParameterInt(acce or 100)
	PushScaleformMovieFunctionParameterInt(brake or 100)
	PushScaleformMovieFunctionParameterInt(trac or 100)
	PopScaleformMovieFunctionVoid()
	return scaleform
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if(fakecar.model ~= nil) and (scaleform ~= nil)then
			local x = 0.67
			local y = 0.52
			local width = 0.65
			local height = width / 0.68
			DrawScaleformMovie(scaleform, x, y, width, height)
		end
	end
end)

function showroom_drawTxt(x,y ,width,height,scale, text, r,g,b,a, outline)
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

testDriveCar = nil
testDriveSeconds = 60
isInTestDrive = false
isInCar = false

function destroyTestDriveCar()
	if(testDriveCar ~= nil)then
		if(DoesEntityExist(testDriveCar))then
			Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(testDriveCar))
		end
		testDriveCar = nil
		isInTestDrive = false
	end
	testDriveSeconds = 60
	vRP.teleport({-39.77363204956,-1110.4862060546,26.438457489014})
	SetEntityHeading(GetPlayerPed(-1), 180.0)
	vRP.notify({"~r~La prueba de manejo finalizo!"})
end

AddEventHandler("playerDropped", function()
	if(testDriveCar ~= nil)then
		destroyTestDriveCar()
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1100)
		if(testDriveCar ~= nil) and (isInTestDrive == false) then
			isInTestDrive = true
		else
			isInTestDrive = false
		end
		if(testDriveCar ~= nil)then
			local IsInVehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
			if(IsInVehicle ~= nil)then
				if(testDriveCar == IsInVehicle)then
					if(testDriveSeconds > 0)then
						testDriveSeconds = testDriveSeconds - 1
					else
						destroyTestDriveCar()
					end
					isInCar = true
				else
					isInCar = false
				end
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if(testDriveSeconds < 60)then
			showroom_drawTxt(1.30, 1.40, 1.0,1.0,0.35, "~g~Tiempo restante: ~r~"..testDriveSeconds.." ~y~Segundos", 255, 255, 255, 255)
		end
		if(isInTestDrive) then
			if(isInCar == false)then
				destroyTestDriveCar()
			end
		end
	end
end)

carPrice = "$0"
local backlock = false
Citizen.CreateThread(function()
	local last_dir
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(1,201) and vehSR_IsPlayerInRangeOfVehshop() then
			if vehshop.opened then
				vehSR_CloseCreator("","")
			else
				vehSR_OpenCreator()
			end
		end
		if vehshop.opened then
			showroom_drawTxt(0.5, 1.073, 1.0,1.0,0.4, "~r~[ENTER] ~p~-> ~b~Comprar vehiculo", 255, 255, 255, 255)
			showroom_drawTxt(0.5, 1.1, 1.0,1.0,0.4, "~r~[E] ~p~-> ~g~Vista previa del vehiculo", 255, 255, 255, 255)
			showroom_drawTxt(0.5, 1.13, 1.0,1.0,0.4, "~r~[G] ~p~-> ~y~Probar el vehiculo por 1 minuto", 255, 255, 255, 255)
			local ped = vehSR_LocalPed()
			local menu = vehshop.menu[vehshop.currentmenu]
			vehSR_drawTxt(vehshop.title,1,1,vehshop.menu.x,vehshop.menu.y,1.0, 255,255,255,255)
			vehSR_drawMenuTitle(menu.title, vehshop.menu.x,vehshop.menu.y + 0.08)
			vehSR_drawTxt(vehshop.selectedbutton.."/"..vehSR_tablelength(menu.buttons),0,0,vehshop.menu.x + vehshop.menu.width/2 - 0.0385,vehshop.menu.y + 0.067,0.4, 255,255,255,255)
			local y = vehshop.menu.y + 0.12
			buttoncount = vehSR_tablelength(menu.buttons)
			local selected = false

			for i,button in pairs(menu.buttons) do
				if i >= vehshop.menu.from and i <= vehshop.menu.to then

					if i == vehshop.selectedbutton then
						selected = true
					else
						selected = false
					end
					vehSR_drawMenuButton(button,vehshop.menu.x,y,selected)
					if button.costs ~= nil then
						if vehshop.currentmenu == "Audi" or vehshop.currentmenu == "BMW" or vehshop.currentmenu == "Ducati" or vehshop.currentmenu == "Volkswagen"  then
							vehSR_drawMenuRight("$"..button.costs,vehshop.menu.x,y,selected)
							carPrice = "$"..button.costs
						else
							vehSR_drawMenuButton(button,vehshop.menu.x,y,selected)
						end
					end
					y = y + 0.04
					if vehshop.currentmenu == "Audi" or vehshop.currentmenu == "BMW" or vehshop.currentmenu == "Ducati" or vehshop.currentmenu == "Volkswagen"  then
						if selected then
							hash = GetHashKey(button.model)
							if IsControlJustPressed(1,47) then
								if(testDriveCar == nil)then
									if DoesEntityExist(fakecar.car) then
										Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(fakecar.car))
										scaleform = nil
									end
									fakecar = {model = '', car = nil}
									while not HasModelLoaded(hash) do
										RequestModel(hash)
										Citizen.Wait(10)
										showroom_drawTxt(0.935, 0.575, 1.0,1.0,0.4, "~r~Cargando vista previa del vehiculo", 255, 255, 255, 255)
									end
									if HasModelLoaded(hash) then
										testDriveCar = CreateVehicle(hash,-914.83026123046,-3287.1538085938,13.521618843078,60.962993621826,false,false)
										SetModelAsNoLongerNeeded(hash)
										TaskWarpPedIntoVehicle(GetPlayerPed(-1),testDriveCar,-1)
										vRP.notify({"~g~Tenes ~r~1 Minuto~g~ para probar este vehiculo!"})
										for i = 0,24 do
											SetVehicleModKit(testDriveCar,0)
											RemoveVehicleMod(testDriveCar,i)
										end
										if(testDriveCar)then
											vehshop.opened = false
											vehshop.menu.from = 1
											vehshop.menu.to = 10
											SetEntityVisible(GetPlayerPed(-1),true)
											FreezeEntityPosition(GetPlayerPed(-1),false)
											scaleform = nil
										end
									end
								end
							end
							if fakecar.model ~= button.model then
								if IsControlJustPressed(1,38) then
									if DoesEntityExist(fakecar.car) then
										Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(fakecar.car))
										scaleform = nil
									end
									local pos = currentlocation.pos.inside									
									local i = 0
									while not HasModelLoaded(hash) and i < 500 do
										RequestModel(hash)
										Citizen.Wait(10)
										i = i+1
										showroom_drawTxt(0.935, 0.575, 1.0,1.0,0.4, "~r~Cargando vista previa del vehiculo", 255, 255, 255, 255)
									end

									-- spawn car
									if HasModelLoaded(hash) then
									--if timer < 255 then
										veh = CreateVehicle(hash,pos[1],pos[2],pos[3],pos[4],false,false)
										FreezeEntityPosition(veh,true)
										SetEntityInvincible(veh,true)
										SetVehicleDoorsLocked(veh,4)
										SetModelAsNoLongerNeeded(hash)
										--SetEntityCollision(veh,false,false)
										TaskWarpPedIntoVehicle(vehSR_LocalPed(),veh,-1)
										for i = 0,24 do
											SetVehicleModKit(veh,0)
											RemoveVehicleMod(veh,i)
										end
										fakecar = { model = button.model, car = veh}
										Citizen.CreateThread(function()
											while DoesEntityExist(veh) do
												Citizen.Wait(25)
												SetEntityHeading(veh, GetEntityHeading(veh)+1 %360)
											end
										end)

										scaleform = Initialize("mp_car_stats_01", carPrice, button.name, button.speed, button.acce, button.brake, button.trac)
									else
										if last_dir then
											if vehshop.selectedbutton < buttoncount then
												vehshop.selectedbutton = vehshop.selectedbutton +1
												if buttoncount > 10 and vehshop.selectedbutton > vehshop.menu.to then
													vehshop.menu.to = vehshop.menu.to + 1
													vehshop.menu.from = vehshop.menu.from + 1
												end
											else
												last_dir = false
												vehshop.selectedbutton = vehshop.selectedbutton -1
												if buttoncount > 10 and vehshop.selectedbutton < vehshop.menu.from then
													vehshop.menu.from = vehshop.menu.from -1
													vehshop.menu.to = vehshop.menu.to - 1
												end
											end
										else
											if vehshop.selectedbutton > 1 then
												vehshop.selectedbutton = vehshop.selectedbutton -1
												if buttoncount > 10 and vehshop.selectedbutton < vehshop.menu.from then
													vehshop.menu.from = vehshop.menu.from -1
													vehshop.menu.to = vehshop.menu.to - 1
												end
											else
												last_dir = true
												vehshop.selectedbutton = vehshop.selectedbutton +1
												if buttoncount > 10 and vehshop.selectedbutton > vehshop.menu.to then
													vehshop.menu.to = vehshop.menu.to + 1
													vehshop.menu.from = vehshop.menu.from + 1
												end
											end
										end
									end
								end
							end
						end
					end
					if selected and IsControlJustPressed(1,201) then
						vehSR_ButtonSelected(button)
					end
				end
			end
			if IsControlJustPressed(1,202) then
				vehSR_Back()
			end
			if IsControlJustReleased(1,202) then
				backlock = false
			end
			if IsControlJustPressed(1,188) then
				last_dir = false
				if vehshop.selectedbutton > 1 then
					vehshop.selectedbutton = vehshop.selectedbutton -1
					if buttoncount > 10 and vehshop.selectedbutton < vehshop.menu.from then
						vehshop.menu.from = vehshop.menu.from -1
						vehshop.menu.to = vehshop.menu.to - 1
					end
				end
			end
			if IsControlJustPressed(1,187)then
				last_dir = true
				if vehshop.selectedbutton < buttoncount then
					vehshop.selectedbutton = vehshop.selectedbutton +1
					if buttoncount > 10 and vehshop.selectedbutton > vehshop.menu.to then
						vehshop.menu.to = vehshop.menu.to + 1
						vehshop.menu.from = vehshop.menu.from + 1
					end
				end
			end
		end

	end
end)


function vehSR_round(num, idp)
  if idp and idp>0 then
    local mult = 10^idp
    return math.floor(num * mult + 0.5) / mult
  end
  return math.floor(num + 0.5)
end
function vehSR_ButtonSelected(button)
	local ped = GetPlayerPed(-1)
	local this = vehshop.currentmenu
	local btn = button.name
	if this == "main" then
		if btn == "Autos" then
			vehSR_OpenMenu('Autos')
		elseif btn == "Motos" then
			vehSR_OpenMenu('Motos')
		end
	elseif this == "Autos" then
		if btn == "Audi" then
			vehSR_OpenMenu('Audi')
		elseif btn == "BMW" then
			vehSR_OpenMenu('BMW')
		elseif btn == "Volkswagen" then
			vehSR_OpenMenu('Volkswagen')
		end
	elseif this == "Motos" then
		if btn == "Ducati" then
			vehSR_OpenMenu('Ducati')
		elseif btn == "BMW" then
			vehSR_OpenMenu('BMW')
		end
	elseif this == "Audi" or this == "BMW" or this == "Ducati" or this == "Volkswagen" then
		TriggerServerEvent('veh_SR:CheckMoneyForVeh',this,button.model,button.costs,"car",false,false)
	end
end

RegisterNetEvent('veh_SR:CloseMenu')
AddEventHandler('veh_SR:CloseMenu', function(vehicle, veh_type)
	boughtcar = true
	vehSR_CloseCreator(vehicle,veh_type)
	scaleform = nil
end)

function vehSR_OpenMenu(menu)
	fakecar = {model = '', car = nil}
	vehshop.lastmenu = vehshop.currentmenu
	if menu == "Autos" then
		vehshop.lastmenu = "main"
	elseif menu == "Motos"  then
		vehshop.lastmenu = "Motos"
	end
	vehshop.menu.from = 1
	vehshop.menu.to = 10
	vehshop.selectedbutton = 0
	vehshop.currentmenu = menu
end


function vehSR_Back()
	if backlock then
		return
	end
	backlock = true
	if vehshop.currentmenu == "main" then
		vehSR_CloseCreator("","")
	elseif vehshop.currentmenu == "Audi" or vehshop.currentmenu == "BMW" or vehshop.currentmenu == "Ducati" or vehshop.currentmenu == "Volkswagen" then
		if DoesEntityExist(fakecar.car) then
			Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(fakecar.car))
			scaleform = nil
		end
		fakecar = {model = '', car = nil}
		vehSR_OpenMenu(vehshop.lastmenu)
	else
		vehSR_OpenMenu(vehshop.lastmenu)
	end

end

function vehSR_stringstarts(String,Start)
   return string.sub(String,1,string.len(Start))==Start
end