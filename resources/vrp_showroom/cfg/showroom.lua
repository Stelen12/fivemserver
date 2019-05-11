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

return vehshop