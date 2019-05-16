-- Hot Key TP to WP
function vRP.TpToWaypoint()
	local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
	local tptowaypoint = vRP.getUsersByPermission({"player.tptowaypoint"})
		if vRP.hasPermission({user_id,"player.tptowaypoint"}) then
		TriggerClientEvent("TpToWaypoint", player)
	end
end

function tvRP.TpToWaypoint()
  vRP.TpToWaypoint(source)
end