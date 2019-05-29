--[[
    FiveM Scripts
	The Official HackerGeo Script 
	Credits - HackerGeo
	Website - www.HackerGeo.com
	GitHub - GITHUB.com/HackerGeo-sp1ne
	Steam - SteamCommunity.com/id/HackerGeo1
	Copyright 2019 ©HackerGeo. All rights served
]]

------------------------------------------------------WARNING-----------------------------------------------------
---------------------Do not reupload/re release any part of this script without my permission---------------------
------------------------------------------------------------------------------------------------------------------


local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","HG_OnlineAdmins")

local onlineSames = 0
local onlineCops = 0
local onlineMeca = 0
local cop_grades = {
    "cop"
}
local same_grades = {
    "SAME - Aspirante",
    "SAME - Doctor",
    "SAME - Cirujano",
    "SAME - Coordinador",
    "SAME - Jefe de zona"
}
local meca_grades = {
    "Mecanico - Novato",
    "Mecanico - Experimentado",
    "Mecanico - Subjefe",
    "Mecanico - Jefe"
}

AddEventHandler("vRP:playerSpawn",function(user_id,source,first_spawn)
    local user_id = vRP.getUserId({source})
    if first_spawn then
        for _, v in pairs(same_grades) do --Sames
            if vRP.hasGroup({user_id, v}) then
                onlineSames = onlineSames + 1
                local response = {
                    type = 'same',
                    cant = onlineSames
                }
                TriggerClientEvent("HG:updateOnlineAdmins", -1, response)
                break
            end
        end
        for _, v in pairs(cop_grades) do --Cops
            if vRP.hasGroup({user_id, v}) then
                onlineCops = onlineCops + 1
                local response = {
                    type = 'cop',
                    cant = onlineCops
                }
                TriggerClientEvent("HG:updateOnlineAdmins", -1, response)
                break
            end
        end
        for _, v in pairs(meca_grades) do --Meca
            if vRP.hasGroup({user_id, v}) then
                onlineMeca = onlineMeca + 1
                local response = {
                    type = 'meca',
                    cant = onlineMeca
                }
                TriggerClientEvent("HG:updateOnlineAdmins", -1, response)
                break
            end
        end
    end
end)

AddEventHandler("vRP:playerLeave",function(user_id, source) -- asta cred ca mere
--AddEventHandler("playerLeave", function() -- asta nu mergex
    local user_id = vRP.getUserId({source})
    for _, v in pairs(same_grades) do 
        if vRP.hasGroup({user_id, v}) then
            onlineSames = onlineSames - 1
            local response = {
                type = 'same',
                cant = onlineSames
            }
            TriggerClientEvent("HG:updateOnlineAdmins", -1, response )
            break
        end
    end
    for _, v in pairs(cop_grades) do --Cops
        if vRP.hasGroup({user_id, v}) then
            onlineCops = onlineCops - 1
            local response = {
                type = 'cop',
                cant = onlineCops
            }
            TriggerClientEvent("HG:updateOnlineAdmins", -1, response )
            break
        end
    end
    for _, v in pairs(meca_grades) do --Meca
        if vRP.hasGroup({user_id, v}) then
            onlineMeca = onlineMeca - 1
            local response = {
                type = 'meca',
                cant = onlineMeca
            }
            TriggerClientEvent("HG:updateOnlineAdmins", -1, response)
            break
        end
    end
end)
