--[[-----------------
 	Doors Control By XanderWP from Ukraine with <3
 ------------------------]]--

local doors = {}
local LockHotkey = {0,38}

RegisterNetEvent('vrpdoorsystem:load')
AddEventHandler('vrpdoorsystem:load', function(list)
  doors = list
end)

Citizen.CreateThread(function()
  Wait(5000)
  TriggerServerEvent("vrpdoorsystem:checkGroup", id)
  while true do
      Citizen.Wait(0)
      for _, door in pairs(doors) do
        local near, dist = isNearJail(door)
        if(near) then
          DrawMarker(1, door.x, door.y, door.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.0, 4.0, 1.0,     90, 255, 90, 0      , 0, 0, 1, 0, 0, 0, 0)
          if(dist<7) then
              local x = door.x
              local y = door.y
              local z = door.z
              if(door.locked == false) then
                DrawText3D(x,y,z+0.8, "~g~ Puerta Abierta")
                DrawText3D(x,y,z+0.7, "~w~ [E] para cerrar")
              else
                DrawText3D(x,y,z+0.8, "~r~ Puerta Cerrada")
                DrawText3D(x,y,z+0.7, "~w~ [E] para abir")
              end
              
          end
        end
      end
  end
end)


function isNearJail(items)
  local ped = GetPlayerPed(-1)
  local plyCoords = GetEntityCoords(GetPlayerPed(-1), 0)

  if(GetDistanceBetweenCoords(items.x, items.y, items.z, plyCoords["x"], plyCoords["y"], plyCoords["z"], true) < 20) then
      return true, GetDistanceBetweenCoords(items.x, items.y, items.z, plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
  end

  return false
end

function DrawText3D(x,y,z, text) 



  local onScreen,_x,_y=World3dToScreen2d(x,y,z)
  local px,py,pz=table.unpack(GetGameplayCamCoords())
  local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

  local scale = (1/dist)*1.3
  local fov = (1/GetGameplayCamFov())*50
  local scale = scale*fov
 
  if onScreen then
      SetTextScale(0.0*scale, 1.1*scale)
      SetTextFont(0)
      SetTextProportional(1)
      -- SetTextScale(0.0, 0.55)
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


RegisterNetEvent('vrpdoorsystem:statusSend')
AddEventHandler('vrpdoorsystem:statusSend', function(i, status)
  doors[i].locked = status
end)


function searchIdDoor()
  local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
  for k,v in pairs(doors) do
    if GetDistanceBetweenCoords(x,y,z,v.x,v.y,v.z,true) <= 1.5 then
      return k
    end
  end
  return 0
end





Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1)
    if IsControlJustPressed(table.unpack(LockHotkey)) then
      local id = searchIdDoor()
      if id ~= 0 then
        TriggerServerEvent("vrpdoorsystem:open", id)
      end
    end
  end
end)


Citizen.CreateThread(function()
  while true do
    Citizen.Wait(100)
    local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
    for k,v in pairs(doors) do
      if GetDistanceBetweenCoords(x,y,z,v.x,v.y,v.z,true) <= 10 then
          local door = GetClosestObjectOfType(v.x,v.y,v.z, 1.0, v.hash, false, false, false)
          if door ~= 0 then
            SetEntityCanBeDamaged(door, false)
            if v.locked == false then
              NetworkRequestControlOfEntity(door)
              FreezeEntityPosition(door, false)
            else
              local locked, heading = GetStateOfClosestDoorOfType(v.hash, v.x,v.y,v.z, locked, heading)
              if heading > -0.02 and heading < 0.02 then
                NetworkRequestControlOfEntity(door)
                FreezeEntityPosition(door, true)
              end
            end
          end
      end
    end
  end
end)
