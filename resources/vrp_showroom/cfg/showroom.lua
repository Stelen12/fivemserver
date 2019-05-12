vehshop = {
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
				{name = "Audi", description = ''},
				{name = "Bmw", description = ''},
				{name = "Volkswagen", description = ''},
				{name = "Lamborgini", description = ''},
				{name = "Peugeot", description = ''},
				{name = "Renault", description = ''},
				{name = "Chevrolet", description = ''},
				{name = "Ford", description = ''},
			}
		},
		["Audi"] = {
			title = "Audi",
			name = "Audi",
			buttons = {
				{name = "A4", costs = 500000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "aaq4"},
				{name = "R8", costs = 5000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "r8ppi"},
			}
		},
		["BMW"] = {
			title = "BMW",
			name = "BMW",
			buttons = {
				{name = "I8", costs = 5000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "i8"},
				{name = "M2", costs = 5000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "m2f22"},
				{name = "M5", costs = 5000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "bmci"},
			}
		},
		["Volkswagen"] = {
			title = "Volkswagen",
			name = "Volkswagen",
			buttons = {
				{name = "Bora", costs = 5000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "elegy"},
				{name = "Fox", costs = 5000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "blista"},
				{name = "Fusca", costs = 5000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "fusca"},
				{name = "Golf MK6", costs = 5000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "golf6"},
				{name = "Golf MK7", costs = 5000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "golf7"},
				{name = "Passat", costs = 5000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "passat"},
				{name = "Saveiro", costs = 5000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "sadler"},
				{name = "Scirocco", costs = 5000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "prairie"},
		
			}
		},
		["Lamborgini"] = {
			title = "Lamborgini",
			name = "Lamborgini",
			buttons = {
				{name = "Aventador", costs = 5000, speed = 80, acce = 80, brake = 100, trac = 30, description = {}, model = "lp700r"},
				{name = "Centenario", costs = 5000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "lp770"},
				{name = "Terzo Milennio", costs = 5000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "lamtmc"},
				{name = "Sesto Elemento", costs = 5000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "sesto"},
			}
		},
		["Peugeot"] = {
			title = "Peugeot",
			name = "Peugeot",
			buttons = {
				{name = "208", costs = 500000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "208"},
				{name = "RcZ", costs = 5000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "rcz16"},
			}
		},
		["Renault"] = {
			title = "Renault",
			name = "Renault",
			buttons = {
				{name = "Clio", costs = 500000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "clio"},
				{name = "Kangoo", costs = 5000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "kangoo"},
				{name = "Clio Rs", costs = 5000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "cliors"},
				{name = "9", costs = 5000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "asea"},
			}
		},
		["Chevrolet"] = {
			title = "Chevrolet",
			name = "Chevrolet",
			buttons = {
				{name = "Camaro", costs = 500000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "ccss16"},
				{name = "Antigua", costs = 500000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "proc10"},
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
				{name = "Hypermotard", costs = 5000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "bati"},
				{name = "Panigale", costs = 5000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "panigale"},
				
			}
		},

	}
}

return vehshop