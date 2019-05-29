
local cfg = {}

-- define each group with a set of permissions
-- _config property:
--- gtype (optional): used to have only one group with the same gtype per player (example: a job gtype to only have one job)
--- onspawn (optional): function(player) (called when the player spawn with the group)
--- onjoin (optional): function(player) (called when the player join the group)
--- onleave (optional): function(player) (called when the player leave the group)
--- (you have direct access to vRP and vRPclient, the tunnel to client, in the config callbacks)

cfg.groups = {
  ["superadmin"] = {
    _config = {onspawn = function(player) vRPclient.notify(player,{"You are superadmin."}) end},
    "player.group.add",
    "player.group.add.superadmin",
    "player.group.add.admin",  --- this is just a example which can be added to admin/mod group if being made
    "player.group.remove",
    "player.givemoney",
    "player.giveitem"
  },
  ["admin"] = {
    "admin.tickets",
    "admin.announce",
	"admin.menu",
	"admin.easy_unjail",
	"admin.spikes",
	-- "admin.godmode",
	"admin.spawnveh",
	"admin.deleteveh",
	"player.blips",
	"player.tptowaypoint",
    "player.list",
    "player.whitelist",
    "player.unwhitelist",
    "player.kick",
    "player.ban",
    "player.unban",
    "player.noclip",
    "player.custom_emote",
    "player.custom_sound",
    "player.display_custom",
    "player.coords",
    "player.tptome",
	"emergency.revive",
	"emergency.shop",
    "player.tpto"
  },
     -- ["god"] = {
    -- "admin.god" -- reset survivals/health periodically
  -- },
  ["recruiter"] = {
    "player.list",
	  "player.group.add",
    "player.group.remove"
    },
  ["mod"] = {
	"admin.tickets",
    "admin.announce",
    "player.list",
    "player.kick",
    "player.ban",
    "player.unban",
    "player.coords",
    "player.tptome",
	"emergency.revive",
	"emergency.shop",
    "player.tpto"
  },
  -- the group user is auto added to all logged players
  ["user"] = {
    "player.phone",
    "player.calladmin",
	"player.fix_haircut",
	"player.check",
	--"mugger.mug",
    "police.askid",
    "police.store_weapons",
	"player.skip_coma",
	"player.store_money",
	"player.check",
	"player.loot",
	"player.player_menu",
	"player.userlist",
  "police.seizable",	-- can be seized
	"user.paycheck"
  },
  ["Pescador"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"Sos pescador, Salario: $2500."}) end
	},
	  "mission.delivery.fish",
    "fisher.service",
	  "fisher.vehicle"
    },
  ["Piloto de carga"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"Sos un piloto de carga. Salario: $2500."}) end
	},
	"mission.pilot.cargo",
	"pilot.vehicle",
	"pilot.paycheck"
    },
  ["Airline Pilot"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"Sos un piloto, salario : $2000."}) end
	},
    "airlines.service",
	"air.vehicle",
	"air.paycheck"
  },
  ["Mafia"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"Sos un participante de una mafia."}) end
	},
    "police.menu",		-- Acces to the police menu to use all of the things below.
    "police.easy_cuff", -- Acces to cuff someone
    "police.drag",		-- Acces to drag a a cuffed person
    "police.putinveh", -- Acces to put a handcuff player in a vehicle.
    "police.getoutveh", -- Acces to take out a handcuff player from a vehicle
    "mafia.loadshop", -- Gunshop for the mafia.
    "police.store_weapons", -- Acces to store weapons
    "mafia.vehicle", -- Acces to the garage.
    "mafia.whitelisted", -- Whitelisted group
    "mafia.paycheck" -- Paycheck ( if you want)
  },
  ["Transporte Medicinal"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"You now transport Medical weed."}) end
	},
	  "mission.delivery.medical",
    "medical.service",
	  "medical.vehicle"
    },
  ["Weapons Smuggler"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"You are a Weapons Smuggler."}) end
	},
	  "mission.weapons.smuggler",
    "smuggler.service"
    },
  ["SAME - Aspirante"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"Sos Aspirante, salario : $7500."}) end
	},
    "emergency.revive",
	--"police.wanted",
    "emergency.shop",
    "emergency.service",
    "emergency.cloakroom",
    "emscheck.revive",
    "emergency.vehicle",
    "emergency.market",
    "ems.whitelisted",
    "ems.loadshop",
    --"player.list",
    "police.menu_interaction",
    "emsChief.paycheck",
    "player.blips"
  },
  ["SAME - Doctor"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"Sos Doctor, salario : $9000."}) end
	},
    "emergency.revive",
	--"police.wanted",
    "emergency.shop",
    "emergency.service",
    "emscheck.revive",
    "emergency.cloakroom",
    "emergency.doctor",
    "emergency.market",
    "ems.whitelisted",
    "ems.loadshop",
    --"player.list",
    "police.menu_interaction",
    "emsMedic.paycheck",
    "player.blips"
  },
  ["SAME - Cirujano"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"Sos Cirujano, salario : $10000."}) end
	},
    "emergency.revive",
	"police.pc",
	--"police.wanted",
    "emergency.shop",
    "emergency.service",
	"emergency.cloakroom",
	"emergency.cirujano",
	"emergency.market",
	"emscheck.revive",
	"ems.whitelisted",
	"ems.loadshop",
	--"player.list",
	"police.menu_interaction",
	"emsLieutenant.paycheck",
	"player.blips"
  },
  ["SAME - Coordinador"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"Sos Coordinador, salario : $12000."}) end
	},
    "emergency.revive",
	--"police.wanted",
    "emergency.shop",
    "emergency.service",
	"emergency.cloakroom",
	"emscheck.revive",
	"emergency.coordinador",
	"emergency.market",
	"ems.whitelisted",
	"ems.loadshop",
	--"player.list",
	"police.menu_interaction",
	"emsSearchRescue.paycheck",
	"player.blips"
  },
  ["SAME - Jefe de zona"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"Sos Jefe de zona, salario : $14000."}) end
	},
    "emergency.revive",
	--"police.wanted",
    "emergency.shop",
    "emergency.service",
	"emergency.cloakroom",
	"emscheck.revive",
	"emergency.jefe",
	"emergency.market",
	"ems.whitelisted",
	"ems.loadshop",
	--"player.list",
	"police.menu_interaction",
	"jefe.paycheck",
	"player.blips"
  },
  ["Mecanico - Novato"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"Sos un mecanico, salario : $6500."}) end
	},
    "vehicle.repair",
    "vehicle.replace",
    "repair.service",
    "repair.vehicle",
    "repair.market",
    "repair.paycheck",
    "meca.cloakroom"
  },
  ["Mecanico - Experimentado"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"Sos un mecanico, salario : $8000."}) end
	},
    "vehicle.repair",
    "vehicle.replace",
    "repair.service",
    "repair.experimentado",
    "repair.market",
    "repair.paycheck.experimentado",
    "meca.cloakroom"
  },
  ["Mecanico - Subjefe"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"Sos un mecanico, salario : $10000."}) end
	},
    "vehicle.repair",
    "vehicle.replace",
    "repair.service",
    "repair.jefe",
    "repair.market",
    "repair.paycheck.subjefe",
    "meca.cloakroom"
  },
  ["Mecanico - Jefe"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"Sos un mecanico, salario : $13000."}) end
	},
    "vehicle.repair",
    "vehicle.replace",
    "repair.service",
    "repair.jefe",
    "repair.market",
    "repair.paycheck.jefe",
    "meca.cloakroom"
  },
  ["Forger"] = {
    _config = { gtype = "job",
  	onspawn = function(player) vRPclient.notify(player,{"You are Forger, go get some credit cards from hackers."}) end
	},
    "fraud.credit_cards",
	  "forger.mission"
  },
  ["UBER"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"Eres UBER, espera a ser llamado. Salary : $5000."}) end
	},
    "uber.service",
    "uber.vehicle",
    "uber.mission",
    "uber.paycheck"
  },
  ["Correo"] = {
    _config = { gtype = "job",
	  onspawn = function(player) vRPclient.notify(player,{"Sos un empleado del correo, Salario: $2500."}) end
	},
    "ups.cloakroom",
    "harvest.parcels",
    "ups.vehicle",
    "mission.delivery.parcels",
    "ups.paycheck"
  },
 -- ["Gunrunning"] = {
   -- _config = { gtype = "job",
	--onspawn = function(player) vRPclient.notify(player,{"Coming soon, Please wait!"}) end
  --}
--},
  ["Desempleado"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"Estas desempleado, busca un trabajo pronto."}) end
	},
	"citizen.paycheck"
  },
  ["Delivery"] = {
    _config = { gtype = "job",
	  onspawn = function(player) vRPclient.notify(player,{"Sos un delivery, Salario : $2500."}) end
	},
	"mission.delivery.food",
	"delivery.vehicle",
	"delivery.paycheck"
  },
  ["Recolector de basura"] = {
    _config = { gtype = "job",
	  onspawn = function(player) vRPclient.notify(player,{"Sos un recolector de basura, Salario : $2300."}) end
	},
	"mission.collect.trash", -- mission permission
	"trash.vehicle", -- garage permission
	"trash.paycheck" -- paycheck permission
  },
  ["Lawyer"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"Sos un abogado, Salario : $2000."}) end
	},
	"Lawyer.vehicle",
	"Lawyer.whitelisted",
	"Lawyer.cloakroom",
	"Lawyer.paycheck"
  },
  ["Drug Dealer"] = {
    _config = { gtype = "job",
	    onspawn = function(player) vRPclient.notify(player,{"Sos un vendedor de drogas."}) end
	  },
    "mission.drugseller.weed",
    "drugseller.market",
    "harvest.weed"
  },
  -- ["Santa"] = {
    -- _config = { gtype = "job",
	    -- onspawn = function(player) vRPclient.notify(player,{"You are Santa, ho ho ho."}) end
	  -- },
    -- "mission.santa", -- What mission Santa has
    -- "santa.vehicle", -- Access to his garage
	-- "santa.paycheck", -- How much santa gets paid per 15 mins
	-- "santa.cloakroom", -- Santa's cloakroom
    -- "harvest.presents" -- What he gathers (item transformers.lua)
  -- },
  ["Hacker"] = {
    _config = { gtype = "job",
  	onspawn = function(player) vRPclient.notify(player,{"Sos un Hacker."}) end
	},
    "mission.hacker.information",
    "hacker.hack",
    "hacker.credit_cards"
  },
  ["Transportista de dinero"] = {
    _config = { gtype = "job",
	  onspawn = function(player) vRPclient.notify(player,{"Sos un Transportista de dinero. Salary: $2500."}) end
	},
	"mission.bankdriver.moneybank",
	"mission.bankdriver.moneybank2",
	"bankdriver.vehicle",
	"bankdriver.paycheck",
	"bankdriver.money"
  },
  ["Judge"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"Sos un Juez. Salary : $5000"}) end
	},
	"judge.paycheck",
	"Judge.whitelisted"
  },
  ["Policia - Agente"] = {
    _config = { gtype = "job",
	  onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{false}) end
	},
	 "Commander.cloakroom",
    "police.pc",
    --"police.handcuff",
    "police.putinveh",
    "police.getoutveh",
    "police.service",
    "police.wanted",
    "police.seize.weapons",
	"police.drag",
	"police.easy_cuff",
	"police.easy_fine",
	"police.easy_jail",
	"police.easy_unjail",
	"police.spikes",
	"police.menu",
  "police.check",
  "police.paycheck",
	"toggle.service",
	"police.freeze",
    "police.seize.items",
    --"police.jail",
    --"police.fine",
    "police.announce",
    --"-police.store_weapons",
    "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
	"police.vehicle",
	"police.loadshop",
	"cop.whitelisted",
	"Commander.paycheck",
	"police.menu_interaction",
  },
  ["Policia - Cabo"] = {
    _config = { gtype = "job",
	  onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{false}) end
	},
	"Lieutenant.cloakroom",
    "police.pc",
    --"police.handcuff",
    "police.putinveh",
    "police.getoutveh",
    "police.service",
	"police.drag",
	"police.easy_cuff",
	"police.easy_fine",
	"police.easy_jail",
	"police.easy_unjail",
	"police.spikes",
	"police.menu",
    "police.check",
    "police.paycheck.cabo",
	"toggle.service",
	"police.freeze",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    --"police.jail",
    --"police.fine",
    "police.announce",
   -- "-police.store_weapons",
    "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
  "police.vehicle.cabo",
  "Cabo.loadshop",
	"cop.whitelisted",
	"Lieutenant.paycheck",
	"police.menu_interaction"
	},
	["Policia - Cabo Primero"] = {
    _config = { gtype = "job",
	  onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{false}) end
	},
	"Lieutenant.cloakroom",
    "police.pc",
    --"police.handcuff",
    "police.putinveh",
    "police.getoutveh",
    "police.service",
	"police.drag",
	"police.easy_cuff",
	"police.easy_fine",
	"police.easy_jail",
	"police.easy_unjail",
	"police.spikes",
	"police.menu",
    "police.check",
    "police.paycheck.cabo1",
	"toggle.service",
	"police.freeze",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    --"police.jail",
    --"police.fine",
    "police.announce",
   -- "-police.store_weapons",
    "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
  "police.vehicle.cabo",
  "Cabo1.loadshop",
  "SWAT.loadshop",
	"cop.whitelisted",
	"Lieutenant.paycheck",
	"police.menu_interaction"
  },
  ["Policia - Sargento"] = {
    _config = { gtype = "job",
	  onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{false}) end
	},
	"Sergeant.cloakroom",
    "police.pc",
    --"police.handcuff",
    "police.putinveh",
    "police.getoutveh",
    "police.service",
    "police.wanted",
	"police.drag",
	"police.easy_cuff",
	"police.easy_fine",
	"police.easy_jail",
	"police.easy_unjail",
	"police.spikes",
	"police.menu",
    "police.check",
    "police.paycheck.sargento",
	"toggle.service",
	"police.freeze",
    "police.seize.weapons",
    "police.seize.items",
    --"police.jail",
    --"police.fine",
    "police.announce",
   -- "-police.store_weapons",
    "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
  "police.vehicle.sargento",
  "Sargento.loadshop",
  "Sargento.loadshop",
	"cop.whitelisted",
	"Sergeant.paycheck",
	"police.menu_interaction"
  },
  ["Policia - Sargento Primero"] = {
    _config = { gtype = "job",
	  onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{false}) end
	},
	"Sergeant.cloakroom",
    "police.pc",
    --"police.handcuff",
    "police.putinveh",
    "police.getoutveh",
    "police.service",
    "police.wanted",
	"police.drag",
	"police.easy_cuff",
	"police.easy_fine",
	"police.easy_jail",
	"police.easy_unjail",
	"police.spikes",
	"police.menu",
    "police.check",
    "police.paycheck.sargento1",
	"toggle.service",
	"police.freeze",
    "police.seize.weapons",
    "police.seize.items",
    --"police.jail",
    --"police.fine",
    "police.announce",
   -- "-police.store_weapons",
    "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
  "police.vehicle.sargento",
  "police.helicopter",
  "Sargento1.loadshop",
	"cop.whitelisted",
	"Sergeant.paycheck",
	"police.menu_interaction"
  },
  ["Policia - Comisario"] = {
    _config = { gtype = "job",
	  onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{false}) end
	},
	"sheriff.cloakroom",
    "police.pc",
    "boss_lspd.pc",
    --"police.handcuff",
    "police.putinveh",
    "police.getoutveh",
    "police.service",
	"police.drag",
	"police.easy_cuff",
	"police.easy_fine",
	"police.easy_jail",
	"police.easy_unjail",
	"police.spikes",
	"police.menu",
    "police.check",
    "police.paycheck.comisario",
	"toggle.service",
	"police.freeze",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    --"police.jail",
    --"police.fine",
    "police.announce",
   -- "-police.store_weapons",
    "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
  "police.vehicle.comisario",
  "police.helicopter",
  "Comisario.loadshop",
	"cop.whitelisted",
	"sheriff.paycheck",
	"police.menu_interaction",
  },
  -- whitelist group for police, emergency and president jobs / add player to this group and user can view the job selection / search in the map
  -- moderator=president / president is guy from the server give a player group cop ems moderator when admin is offline / sallary : $10.000
  ["cop"] = {
    "cop.whitelisted"
  },
  ["Exotic Car Dealer"] = {
   	_config = { gtype = "job",
	  onspawn = function(player) vRPclient.notify(player,{"You are an Exotic Car Dealer"}) end
	},
	  "exotic.whitelisted",
    "exotic.vehicle",
    --"player.list"
  },
  ["buyer"] = {  
    "exotic.vehicle"
  },
  ["mafia"] = {
	"mafia.whitelisted"
  },
  ["ems"] = {  
    "ems.whitelisted"
  },
  ["moderator"] = {
    "president.whitelisted"
  }
}

-- groups are added dynamically using the API or the menu, but you can add group when an user join here
cfg.users = {
  [1] = { -- give superadmin and admin group to the first created user on the database
    "superadmin",
    "admin",
	  "recruiter"
  }
}

-- group selectors
-- _config
--- x,y,z, blipid, blipcolor, permissions (optional)

cfg.selectors = {
  ["Job Selector"] = {
    _config = {x = -261.40533447266, y = -965.15747070313, z = 31.22411537170, blipid = 351, blipcolor = 47},
    "UBER",
    "Delivery",
    "Transportista de dinero",
    "Correo",
    "Pescador",
    "Transporte medicinal",
    "Recolector de basura",
    "Piloto de carga",
    "Desempleado"
  }
}

return cfg
