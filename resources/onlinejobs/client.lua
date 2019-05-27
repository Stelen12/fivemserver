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



local sameOnline = 0
local copsOnline = 0
local mecaOnline = 0
RegisterNetEvent('HG:updateOnlineAdmins')
AddEventHandler('HG:updateOnlineAdmins', function(stfOnl)

    if stfOnl.type == 'cop' then
        if(stfOnl.cant > 0) then
            copsOnline = stfOnl.cant
        else
            copsOnline = 0
        end
    end
    if stfOnl.type == 'same' then
        if(stfOnl.cant > 0) then
            sameOnline = stfOnl.cant
        else
            sameOnline = 0
        end
    end
    if stfOnl.type == 'meca' then
        if(stfOnl.cant > 0) then
            mecaOnline = stfOnl.cant
        else
            mecaOnline = 0
        end
    end

end)

local function RGBRainbow( frequency )
	local result = {}
	local curtime = GetGameTimer() / 1000

	result.r = math.floor( math.sin( curtime * frequency + 0 ) * 127 + 128 )
	result.g = math.floor( math.sin( curtime * frequency + 2 ) * 127 + 128 )
	result.b = math.floor( math.sin( curtime * frequency + 4 ) * 127 + 128 )
	
	return result
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local rainbow = RGBRainbow( 1 )
        OAstatus(0.17, 0.94 - 0.03, 1.0,1.0,0.35, "Mecanicos conectados: "..mecaOnline, rainbow.r, rainbow.g, rainbow.b, 255)
        OAstatus(0.17, 0.94 - 0.05, 1.0,1.0,0.35, "Policias conectados: "..copsOnline, rainbow.r, rainbow.g, rainbow.b, 255)
        OAstatus(0.17, 0.94 - 0.07, 1.0,1.0,0.35, "Medicos conectados: "..sameOnline, rainbow.r, rainbow.g, rainbow.b, 255)
    end
end)

function OAstatus(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(7)
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
    DrawText(x, y)
end