local Proxy = module("vrp", "lib/Proxy")

RegisterServerEvent('paycheck:salary')
AddEventHandler('paycheck:salary', function()
  	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"police.paycheck") then
		vRP.giveBankMoney(user_id,8000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"Policia de la Ciudad",false,"Pago: ~g~$8000"})
	end		
	-- EMS Paychecks	
	if vRP.hasPermission(user_id,"emsChief.paycheck") then
		vRP.giveBankMoney(user_id,7500)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"SAME BSAS",false,"Pago: ~g~$7500"})
	end
	if vRP.hasPermission(user_id,"emsMedic.paycheck") then
		vRP.giveBankMoney(user_id,9000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"SAME BSAS",false,"Pago: ~g~$9000"})
	end
	if vRP.hasPermission(user_id,"emsLieutenant.paycheck") then
		vRP.giveBankMoney(user_id,10000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"SAME BSAS",false,"Pago: ~g~$10000"})
	end
	if vRP.hasPermission(user_id,"emsSearchRescue.paycheck") then
		vRP.giveBankMoney(user_id,12000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"SAME BSAS",false,"Pago: ~g~$12000"})
	end
	if vRP.hasPermission(user_id,"jefe.paycheck") then
		vRP.giveBankMoney(user_id,14000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"SAME BSAS",false,"Pago: ~g~$14000"})
	end
	-- end EMS Paychecks
	if vRP.hasPermission(user_id,"repair.paycheck") then
		vRP.giveBankMoney(user_id,6500)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"Compania de reparaciones",false,"Pago: ~g~$6500"})
	end
	if vRP.hasPermission(user_id,"repair.paycheck.experimentado") then
		vRP.giveBankMoney(user_id,8000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"Compania de reparaciones",false,"Pago: ~g~$8000"})
	end
	if vRP.hasPermission(user_id,"repair.paycheck.subjefe") then
		vRP.giveBankMoney(user_id,10000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"Compania de reparaciones",false,"Pago: ~g~$10000"})
	end
	if vRP.hasPermission(user_id,"repair.paycheck.jefe") then
		vRP.giveBankMoney(user_id,13000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"Compania de reparaciones",false,"Pago: ~g~$13000"})
	end
	if vRP.hasPermission(user_id,"police.paycheck.cabo") then
		vRP.giveBankMoney(user_id,9000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"Policia de la Ciudad",false,"Pago: ~g~$9000"})
	end
	if vRP.hasPermission(user_id,"police.paycheck.cabo1") then
		vRP.giveBankMoney(user_id,10000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"Policia de la Ciudad",false,"Pago: ~g~$10000"})
	end
	if vRP.hasPermission(user_id,"mafia.paycheck") then
		vRP.giveMoney(user_id,10000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"Mafia",false,"Stolen money: ~g~$10000"})
	end	
	if vRP.hasPermission(user_id,"police.paycheck.sargento") then
		vRP.giveBankMoney(user_id,12000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"Policia de la Ciudad",false,"Pago: ~g~$12000"})
	end
	if vRP.hasPermission(user_id,"police.paycheck.sargento1") then
		vRP.giveBankMoney(user_id,13000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"Policia de la Ciudad",false,"Pago: ~g~$13000"})
	end
	if vRP.hasPermission(user_id,"police.paycheck.comisario") then
		vRP.giveBankMoney(user_id,15000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"Policia de la Ciudad",false,"Pago: ~g~$15000"})
	end
	if vRP.hasPermission(user_id,"uber.paycheck") then
		vRP.giveBankMoney(user_id,5000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"UBER",false,"Pago UBER: ~g~$5000"})
	end
	if vRP.hasPermission(user_id,"Lawyer.paycheck") then
		vRP.giveBankMoney(user_id,4000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"Lawyer",false,"Pago: ~g~$4000"})
	end
	if vRP.hasPermission(user_id,"delivery.paycheck") then
		vRP.giveBankMoney(user_id,2500)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"Compania de delivery:",false,"Pago: ~g~$2500"})
	end
	if vRP.hasPermission(user_id,"citizen.paycheck") then
		vRP.giveBankMoney(user_id,300)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"",false,"Pago del gobierno: ~g~$300"})
	end
	-- if vRP.hasPermission(user_id,"santa.paycheck") then
		-- vRP.giveBankMoney(user_id,2000)
		-- vRPclient.notify(source,{"Payday: $2000"})
	-- end
	if vRP.hasPermission(user_id,"bankdriver.paycheck") then
		vRP.giveBankMoney(user_id,2500)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"Agencia de transportistas",false,"Pago: ~g~$2500"})
	end
	if vRP.hasPermission(user_id,"pilot.paycheck") then
		vRP.giveBankMoney(user_id,2500)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"Compania aerea",false,"Pago: ~g~$2500"})
	end
	if vRP.hasPermission(user_id,"ups.paycheck") then
		vRP.giveBankMoney(user_id,2500)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"UPS Company",false,"Pago: ~g~$2500"})
	end
	if vRP.hasPermission(user_id,"air.paycheck") then
		vRP.giveBankMoney(user_id,2000)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"Compania aerea",false,"Pago: ~g~$2000"})
	end
	if vRP.hasPermission(user_id,"trash.paycheck") then
		vRP.giveBankMoney(user_id,2300)
		vRPclient.notifyPicture(source,{"CHAR_BANK_MAZE",1,"Recolectora de basura",false,"Pago: ~g~$2300"})
	end
end)

RegisterServerEvent('paycheck:bonus')
AddEventHandler('paycheck:bonus', function()
  	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"user.paycheck") then
		vRP.giveBankMoney(user_id,400)
		vRPclient.notify(source,{"Adicional por jugar: ~g~$400"})
	end
	if vRP.hasPermission(user_id,"user.paycheck") then
		vRP.getMoney(user_id,150)
		vRPclient.notify(source,{"Impuesto: R$-150"})
	end
end)
