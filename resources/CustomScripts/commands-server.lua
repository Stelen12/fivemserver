local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")

AddEventHandler('chatMessage', function(source, name, msg)
    if msg:sub(1,4) == "/ooc" then
        CancelEvent()
        TriggerClientEvent('chatMessage', -1, "OOC | " .. name, { 128, 128, 128 }, string.sub(msg,5))
    elseif msg:sub(1,3) == "/me" or msg:sub(1,3) == "/do" then
        CancelEvent()
        local user_id = vRP.getUserId({source})
        if user_id ~= nil then
            vRP.getUserIdentity({user_id, function(identity)
                if identity ~= nil then
                    TriggerClientEvent('chatMessage', -1, "ME | " ..identity.firstname.. " "..identity.name, { 255, 0, 0 }, msg:sub(4))
                end
            end})
        end
    elseif msg:sub(1,4) == "/do" then
        CancelEvent()
        local user_id = vRP.getUserId({source})
        if user_id ~= nil then
            vRP.getUserIdentity({user_id, function(identity)
                if identity ~= nil then
                    TriggerClientEvent('chatMessage', -1, "^6do | "..identity.firstname.. " "..identity.name, { 10, 205, 245 }, msg:sub(5))
                end
            end})
        end
    elseif msg:sub(1,4) == "/twt" then
        CancelEvent()
        local user_id = vRP.getUserId({source})
        if user_id ~= nil then
            vRP.getUserIdentity({user_id, function(identity)
                if identity ~= nil then
                    TriggerClientEvent('chatMessage', -1, "^4TWITTER | ^5@"..identity.firstname.. " "..identity.name, { 10, 205, 245 }, msg:sub(5))
                end
            end})
        end
    end
end)

RegisterNetEvent('message:inDistanceZone')
AddEventHandler('message:inDistanceZone', function(target, message)
    local _source = source
	TriggerClientEvent('chatMessage', target, "ME | " .. GetPlayerName(_source), {255, 0, 0}, message)
end)

         
