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
				{name = "BMW", description = ''},
				{name = "Volkswagen", description = ''},
				{name = "Lamborgini", description = ''},
				{name = "Peugeot", description = ''},
				{name = "Renault", description = ''},
				{name = "Chevrolet", description = ''},
				{name = "Ford", description = ''},
				{name = "Bugatti", description = ''},
				{name = "Nissan", description = ''},
				{name = "Porsche", description = ''},
				{name = "Jeep", description = ''},
				{name = "Hummer", description = ''},
				{name = "Mercedes Benz", description = ''},
				{name = "Pagani", description = ''},
				{name = "McClaren", description = ''},
				{name = "Fiat", description = ''},
				{name = "Range", description = ''},
			}
		},
		["Audi"] = {
			title = "Audi",
			name = "Audi",
			buttons = {
				{name = "A4", costs = 500000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "aaq4"},
				{name = "R8", costs = 1500000, speed = 60, acce = 60, brake = 60, trac = 30, description = {}, model = "r8ppi"},
			}
		},
		["BMW"] = {
			title = "BMW",
			name = "BMW",
			buttons = {
				{name = "I8", costs = 3000000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "i8"},
				{name = "M2", costs = 500000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "m2f22"},
				{name = "M5", costs = 750000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "bmci"},
			}
		},
		["Volkswagen"] = {
			title = "Volkswagen",
			name = "Volkswagen",
			buttons = {
				{name = "Bora", costs = 250000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "elegy"},
				{name = "Fox", costs = 80000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "blista"},
				{name = "Fusca", costs = 15000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "fusca"},
				{name = "Golf MK6", costs = 400000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "golf6"},
				{name = "Golf MK7", costs = 500000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "golf7"},
				{name = "Passat", costs = 800000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "passat"},
				{name = "Saveiro", costs = 60000 , speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "sadler"},
				{name = "Scirocco", costs = 1000000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "prairie"},
		
			}
		},
		["Lamborgini"] = {
			title = "Lamborgini",
			name = "Lamborgini",
			buttons = {
				{name = "Aventador", costs = 10000000, speed = 80, acce = 80, brake = 100, trac = 30, description = {}, model = "lp700r"},
				{name = "Centenario", costs = 15000000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "lp770"},
				{name = "Terzo Milennio", costs = 20000000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "lamtmc"},
				{name = "Sesto Elemento", costs = 8000000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "sesto"},
			}
		},
		["Peugeot"] = {
			title = "Peugeot",
			name = "Peugeot",
			buttons = {
				{name = "208", costs = 70000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "208"},
				{name = "RcZ", costs = 450000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "rcz16"},
			}
		},
		["Renault"] = {
			title = "Renault",
			name = "Renault",
			buttons = {
				{name = "Clio", costs = 500000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "clio"},
				{name = "Kangoo", costs = 5000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "kangoo"},
				{name = "9", costs = 5000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "asea"},
			}
		},
		["Chevrolet"] = {
			title = "Chevrolet",
			name = "Chevrolet",
			buttons = {
				{name = "Camaro", costs = 2000000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "ccss16"},
				{name = "Antigua", costs = 350000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "proc10"},
			}
		},
		["Ford"] = {
			title = "Ford",
			name = "Ford",
			buttons = {
				{name = "Focus", costs = 350000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "focusrs"},
				{name = "Mustang", costs = 500000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "dominator"},
			}
		},
		["Bugatti"] = {
			title = "Bugatti",
			name = "Bugatti",
			buttons = {
				{name = "Veyron", costs = 6000000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "bugatti"},
			}
		},
		["Nissan"] = {
			title = "Nissan",
			name = "Nissan",
			buttons = {
				{name = "GTR", costs = 250000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "gtr"},
			}
		},
		["Porsche"] = {
			title = "Porsche",
			name = "Porsche",
			buttons = {
				{name = "Cayenne", costs = 700000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "pct18"},
			}
		},
		["Jeep"] = {
			title = "Jeep",
			name = "Jeep",
			buttons = {
				{name = "Grand Cherokee", costs = 1000000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "demonhawk"},
			}
		},
		["Hummer"] = {
			title = "Hummer",
			name = "Hummer",
			buttons = {
				{name = "Hummer V1", costs = 280000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "patriot"},
			}
		},
		["Mercedes Benz"] = {
			title = "Mercedes Benz",
			name = "Mercedes Benz",
			buttons = {
				{name = "AMG GT", costs = 2000000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "amggt"},
			}
		},
		["Pagani"] = {
			title = "Pagani",
			name = "Pagani",
			buttons = {
				{name = "Huayra", costs = 6000000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "huayrar"},
			}
		},
		["McClaren"] = {
			title = "McClaren",
			name = "McClaren",
			buttons = {
				{name = "P1", costs = 10000000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "p1"},
			}
		},
		["Fiat"] = {
			title = "Fiat",
			name = "Fiat",
			buttons = {
				{name = "Punto", costs = 60000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "gresley"},
			}
		},
		["Range"] = {
			title = "Range",
			name = "Range",
			buttons = {
				{name = "Rover", costs = 600000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "rrstart"},
			}
		},

		-------------------Motos----------------------
		["Motos"] = {
			title = "Motos",
			name = "Motos",
			buttons = {
				{name = "Ducati", description = ''},
				{name = "KTM", description = ''},
				{name = "Harley Davidson", description = ''},
				{name = "Yamaha", description = ''},
				{name = "Honda", description = ''},
			}
		},
		["Ducati"] = {
			title = "Ducati",
			name = "Ducati",
			buttons = {
				{name = "Hypermotard", costs = 250000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "bati"},
				{name = "Panigale", costs = 200000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "panigale"},	
			}
		},
		["KTM"] = {
			title = "KTM",
			name = "KTM",
			buttons = {
				{name = "RC 390", costs = 100000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "rc"},
			}
		},
		["Harley Davidson"] = {
			title = "Harley Davidson",
			name = "Harley Davidson",
			buttons = {
				{name = "Harley", costs = 8000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "daemon"},
			}
		},
		["Yamaha"] = {
			title = "Yamaha",
			name = "Yamaha",
			buttons = {
				{name = "ZX 10", costs = 150000, speed = 70, acce = 80, brake = 60, trac = 30, description = {}, model = "zx10r"},
			}
		},
		["Honda"] = {
			title = "Honda",
			name = "Honda",
			buttons = {
				{name = "Gilera", costs = 15000, speed = 40, acce = 50, brake = 60, trac = 30, description = {}, model = "biz25"},
			}
		},

	}
}

return vehshop