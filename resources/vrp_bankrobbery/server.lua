-- Remember to use the cop group or this won't work
-- K > Admin > Add Group > User ID > cop

local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_bank")

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
	--["fleeca3"] = {
		--position = { ['x'] = -1212.2568359375, ['y'] = -336.128295898438, ['z'] = 36.7907638549805 },
		--reward = 30000 + math.random(100000,200000),
		--nameofbank = "Fleeca Bank (Vinewood Hills)",
		--lastrobbed = 0
	--},
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
	--["pacific"] = {
		--position = { ['x'] = 255.001098632813, ['y'] = 225.855895996094, ['z'] = 101.005694274902 },
		--reward = 60000 + math.random(100000,200000),
		--nameofbank = "Pacific Standard PDB (Downtown Vinewood)",
		--lastrobbed = 0
	--}
}

local robbers = {}

function get3DDistance(x1, y1, z1, x2, y2, z2)
	return math.sqrt(math.pow(x1 - x2, 2) + math.pow(y1 - y2, 2) + math.pow(z1 - z2, 2))
end

AddEventHandler("playerDropped", function()
	if(robbers[source])then
		local wtf = robbers[source]
		local wtf2 = banks[wtf].nameofbank
		robbers[source] = nil
		TriggerClientEvent('chatMessage', -1, 'NEWS', {255, 0, 0}, "El robo fue cancelado: ^2" ..wtf2.."Razon: [Desconectado]")
	end
end)

RegisterServerEvent('es_bank:toofar')
AddEventHandler('es_bank:toofar', function(robb)
	if(robbers[source])then
		TriggerClientEvent('es_bank:toofarlocal', source)
		robbers[source] = nil
		TriggerClientEvent('chatMessage', -1, 'NEWS', {255, 0, 0}, "El robo fue cancelado en: ^2" .. banks[robb].nameofbank)
	end
end)

RegisterServerEvent('es_bank:playerdied')
AddEventHandler('es_bank:playerdied', function(robb)
	if(robbers[source])then
		TriggerClientEvent('es_bank:playerdiedlocal', source)
		robbers[source] = nil
		TriggerClientEvent('chatMessage', -1, 'NEWS', {255, 0, 0}, "El robo fue cancelado: ^2" .. banks[robb].nameofbank)
	end
end)

RegisterServerEvent('es_bank:rob')
AddEventHandler('es_bank:rob', function(robb)
  local user_id = vRP.getUserId({source})
  local player = vRP.getUserSource({user_id})
	local cops = vRP.getUsersByGroup({"cop"}) -- remember to use the cop group or this won't work - K > Admin > Add Group > User ID > cop
  if vRP.hasGroup({user_id,"cop"}) then
    vRPclient.notify(player,{"~r~Los policias no roban bancos."})
  else
    if #cops >= banks[robb].copsToRob then -- Policias necesarios
	  if banks[robb] then
		  local bank = banks[robb]

		  if (os.time() - bank.lastrobbed) < 600 and bank.lastrobbed ~= 0 then
			  TriggerClientEvent('chatMessage', player, 'ROBBERY', {255, 0, 0}, "Este fue robado hace poco. Espera o busca otro: ^2" .. (1200 - (os.time() - bank.lastrobbed)) .. "^0 segundos.")
			  return
		  end
		  TriggerClientEvent('chatMessage', -1, 'NEWS', {255, 0, 0}, "Robo en progreso en: ^2" .. bank.nameofbank)
		  TriggerClientEvent('chatMessage', player, 'SYSTEM', {255, 0, 0}, "Empezaste el robo: ^2" .. bank.nameofbank .. "^0, no te alejes demasiado de esta zona!")
		  TriggerClientEvent('chatMessage', player, 'SYSTEM', {255, 0, 0}, "Manten la negociacion ^1 12 ^0minutos y la guita sera tuya!")
		  TriggerClientEvent('es_bank:currentlyrobbing', player, robb)
		  banks[robb].lastrobbed = os.time()
		  robbers[player] = robb
		  local savedSource = player
		  SetTimeout(720000, function()
			  if(robbers[savedSource])then
				  if(user_id)then
					  vRP.giveInventoryItem({user_id,"dirty_money",bank.reward,true})
					  TriggerClientEvent('chatMessage', -1, 'NEWS', {255, 0, 0}, "El robo fue terminado: ^2" .. bank.nameofbank .. "^0!")
					  TriggerClientEvent('es_bank:robberycomplete', savedSource, bank.reward)
				  end
			  end
		  end)		
	  end
    else
      vRPclient.notify(player,{"~r~Se necesitan como minimo " .. banks[robb].copsToRob .. " policias"})
    end
	end
end)
