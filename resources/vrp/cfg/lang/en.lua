
-- define all language properties

local lang = {
  common = {
    welcome = "Welcome to the server. Press K to use the menu.~n~",
    no_player_near = "~r~No player near you.",
    invalid_value = "~r~Invalid value.",
    invalid_name = "~r~Invalid name.",
    not_found = "~r~Not found.",
    request_refused = "~r~Request refused.",
    wearing_uniform = "~r~Be careful, you are wearing a uniform.",
    not_allowed = "~r~Not allowed."
  },
  weapon = {
    pistol = "Pistola"
  },  
  survival = {
    starving = "Hambriento",
    thirsty = "Sediento"
  },
  money = {
    display = "<span class=\"symbol\">$</span> {1}",
    bdisplay = "<span class=\"symbol\">$</span> {1}",
    given = "Diste ~r~{1}$.",
    received = "Recibiste ~g~{1}$.",
    not_enough = "~r~No tienes dinero suficiente.",
    paid = "Pagaste ~r~{1}$.",
    give = {
      title = "Dar dinero",
      description = "Dar dinero al jugador mas cercano.",
      prompt = "Monto a entrgar:"
    }
  },
  inventory = {
    title = "Inventario",
    description = "Abrir inventario.",
    iteminfo = "({1})<br /><br />{2}<br /><em>{3} kg</em>",
    info_weight = "Peso {1}/{2} kg",
    give = {
      title = "Dar",
      description = "Dar objetos al jugador mas cercano.",
      prompt = "Monto a entrgar (max {1}):",
      given = "Diste ~r~{1} ~s~{2}.",
      received = "Recidibiste ~g~{1} ~s~{2}.",
    },
    trash = {
      title = "Basura",
      description = "Destruir objetos.",
      prompt = "Amount to trash (max {1}):",
      done = "Trashed ~r~{1} ~s~{2}."
    },
    missing = "~r~Missing {2} {1}.",
    full = "~r~Inventario lleno.",
    chest = {
      title = "Cofre",
      already_opened = "~r~Este cofre ya esta abierto por alguna persona.",
      full = "~r~Cofre lleno.",
      take = {
        title = "Agarrar",
        prompt = "Cantidad a agarrar (max {1}):"
      },
      put = {
        title = "Poner",
        prompt = "Cantidad a poner (max {1}):"
      }
    }
  },
  atm = {
    title = "ATM",
    info = {
      title = "Info",
      bank = "Banco: {1} $"
    },
    deposit = {
      title = "Depositar",
      description = "Mercado al banco",
      prompt = "Ingresar el monto del deposito:",
      deposited = "~r~{1}$~s~ depositado."
    },
    withdraw = {
      title = "Retirar",
      description = "Banco al mercado",
      prompt = "Enter amount of money to withdraw:",
      withdrawn = "~g~{1}$ ~s~retirado.",
      not_enough = "~r~No tienes dinero suficiente en el banco."
    }
  },
  business = {
    title = "Chamber of Commerce",
    directory = {
      title = "Directory",
      description = "Business directory.",
      dprev = "> Prev",
      dnext = "> Next",
      info = "<em>capital: </em>{1} $<br /><em>owner: </em>{2} {3}<br /><em>registration n°: </em>{4}<br /><em>phone: </em>{5}"
    },
    info = {
      title = "Business info",
      info = "<em>name: </em>{1}<br /><em>capital: </em>{2} $<br /><em>capital transfer: </em>{3} $<br /><br/>Capital transfer is the amount of money transfered for a business economic period, the maximum is the business capital."
    },
    addcapital = {
      title = "Add capital",
      description = "Add capital to your business.",
      prompt = "Amount to add to the business capital:",
      added = "~r~{1}$ ~s~added to the business capital."
    },
    launder = {
      title = "Money laundering",
      description = "Use your business to launder dirty money.",
      prompt = "Amount of dirty money to launder (max {1} $): ",
      laundered = "~g~{1}$ ~s~laundered.",
      not_enough = "~r~Not enough dirty money."
    },
    open = {
      title = "Open business",
      description = "Open your business, minimum capital is {1} $.",
      prompt_name = "Business name (can't change after, max {1} chars):",
      prompt_capital = "Initial capital (min {1})",
      created = "~g~Business created."
      
    }
  },
  cityhall = {
    title = "City Hall",
    identity = {
      title = "Nueva identidad",
      description = "Crear nueva identidad, costo = {1} $.",
      prompt_firstname = "Ingresa tu primer nombre:",
      prompt_name = "Ingresa tu apellido:",
      prompt_age = "Ingresa tu edad:",
    },
    menu = {
      title = "Identidad",
      info = "<em>Primer nombre: </em>{2}<br /><em>Apellido: </em>{1}<br /><em>Edad: </em>{3}<br /><em>n° de registro: </em>{4}<br /><em>Celular: </em>{5}<br /><em>Direccion: </em>{7}, {6}"
    }
  },
  police = {
    title = "Polica",
    wanted = "Nivel de busqueda {1}",
    not_handcuffed = "~r~No esposado",
    cloakroom = {
      title = "Vestidor",
      uniform = {
        title = "Uniforme",
        description = "Poner uniforme."
      }
    },
    pc = {
      title = "PC",
      searchreg = {
        title = "Busqueda de indentidad",
        description = "Buscar indentidad.",
        prompt = "Ingresar el numero de registro:"
      },
      closebusiness = {
        title = "Close business",
        description = "Close business of the nearest player.",
        request = "Are you sure to close the business {3} owned by {1} {2} ?",
        closed = "~g~Business closed."
      },
      trackveh = {
        title = "Buscar vehiculo",
        description = "Track a vehicle by its registration number.",
        prompt_reg = "Enter registration number:",
        prompt_note = "Enter a tracking note/reason:",
        tracking = "~b~Tracking started.",
        track_failed = "~b~Tracking of {1}~s~ ({2}) ~n~~r~Failed.",
        tracked = "Tracked {1} ({2})"
      },
      records = {
        show = {
          title = "Show records",
          description = "Show police records by registration number."
        },
        delete = {
          title = "Clear records",
          description = "Clear police records by registration number.",
          deleted = "~b~Police records deleted"
        }
      }
    },
    menu = {
      handcuff = {
        title = "Espocar",
        description = "Esposar/Desesposar jugador cercano."
      },
      putinveh = {
        title = "Meter al auto",
        description = "Meter al jugador esposado mas cercano al vehiculo, como pasajero."
      },
      getoutveh = {
        title = "Sacar del auto",
        description = "Sacar al jugador mas cercano al vehiculo."
      },
      askid = {
        title = "Pedir Identificacion",
        description = "Pedir Identificacion al jugador mas cercano.",
        request = "Quieres dar tu identificacion ?",
        request_hide = "Esconder identificacion.",
        asked = "Asking ID..."
      },
      check = {
        title = "Cachear jugador",
        description = "Check money, inventory and weapons of the nearest player.",
        request_hide = "Hide the check report.",
        info = "<em>money: </em>{1} $<br /><br /><em>inventory: </em>{2}<br /><br /><em>weapons: </em>{3}",
        checked = "You have being checked."
      },
      seize = {
        seized = "Seized {2} ~r~{1}",
        weapons = {
          title = "Seize weapons",
          description = "Seize nearest player weapons",
          seized = "~b~Your weapons have been seized."
        },
        items = {
          title = "Seize illegals",
          description = "Seize illegal items",
          seized = "~b~Your illegal stuff has been seized."
        }
      },
      jail = {
        title = "Encarcelar",
        description = "Encarcelar/Desencarcelar al jugador mas cercadno.",
        not_found = "~r~No se encontro carcel.",
        jailed = "~b~Encarcelado.",
        unjailed = "~b~Desencarcelado.",
        notify_jailed = "~b~Has sido encarcelado.",
        notify_unjailed = "~b~Has sido desencarcelado."
      },
      fine = {
        title = "Multar",
        description = "Multar al jugador mas cercano.",
        fined = "~b~Multado ~s~{2} $ por ~b~{1}.",
        notify_fined = "~b~Has sido multado ~s~ {2} $ por ~b~{1}.",
        record = "[Fine] {2} $ por {1}"
      },
      store_weapons = {
        title = "Store weapons",
        description = "Store your weapons in your inventory."
      }
    },
    identity = {
      info = "<em>Nombre: </em>{1}<br /><em>Primer nombre: </em>{2}<br /><em>Edad: </em>{3}<br /><em>n° de registro: </em>{4}<br /><em>Celular: </em>{5}<br /><em>Empresa: </em>{6}<br /><em>Capital Empresa: </em>{7} $<br /><em>Direccion: </em>{9}, {8}"
    }
  },
  emergency = {
    menu = {
      revive = {
        title = "Revive",
        description = "Reanimate the nearest player.",
        not_in_coma = "~r~Not in coma."
      }
    }
  },
  phone = {
    title = "Phone",
    directory = {
      title = "Directory",
      description = "Open the phone directory.",
      add = {
        title = "➕ Add",
        prompt_number = "Enter the phone number to add:",
        prompt_name = "Enter the entry name:",
        added = "~g~Entry added."
      },
      sendsms = {
        title = "Send SMS",
        prompt = "Enter the message (max {1} chars):",
        sent = "~g~ Sent to n°{1}.",
        not_sent = "~r~ n°{1} unavailable."
      },
      sendpos = {
        title = "Send position",
      },
      remove = {
        title = "Remove"
      }
    },
    sms = {
      title = "SMS History",
      description = "Received SMS history.",
      info = "<em>{1}</em><br /><br />{2}",
      notify = "SMS~b~ {1}:~s~ ~n~{2}"
    },
    smspos = {
      notify = "SMS-Position ~b~ {1}"
    },
    service = {
      title = "Service",
      description = "Call a service or an emergency number.",
      prompt = "If needed, enter a message for the service:",
      ask_call = "Received {1} call, do you take it ? <em>{2}</em>",
      taken = "~r~This call is already taken."
    },
    announce = {
      title = "Announce",
      description = "Post an announce visible to everyone for a few seconds.",
      item_desc = "{1} $<br /><br/>{2}",
      prompt = "Announce content (10-1000 chars): "
    }
  },
  emotes = {
    title = "Emotes",
    clear = {
      title = "> Clear",
      description = "Clear all running emotes."
    }
  },
  home = {
    buy = {
      title = "Buy",
      description = "Buy a home here, price is {1} $.",
      bought = "~g~Bought.",
      full = "~r~The place is full.",
      have_home = "~r~You already have a home."
    },
    sell = {
      title = "Sell",
      description = "Sell your home for {1} $",
      sold = "~g~Sold.",
      no_home = "~r~You don't have a home here."
    },
    intercom = {
      title = "Intercom",
      description = "Use the intercom to enter in a home.",
      prompt = "Number:",
      not_available = "~r~Not available.",
      refused = "~r~Refused to enter.",
      prompt_who = "Say who you are:",
      asked = "Asking...",
      request = "Someone wants to open your home door: <em>{1}</em>"
    },
    slot = {
      leave = {
        title = "Leave"
      },
      ejectall = {
        title = "Eject all",
        description = "Eject all home visitors, including you, and close the home."
      }
    },
    wardrobe = {
      title = "Wardrobe",
      save = {
        title = "> Save",
        prompt = "Save name:"
      }
    },
    gametable = {
      title = "Game table",
      bet = {
        title = "Start bet",
        description = "Start a bet with players near you, the winner will be randomly selected.",
        prompt = "Bet amount:",
        request = "[BET] Do you want to bet {1} $ ?",
        started = "~g~Bet started."
      }
    }
  },
  garage = {
    title = "Garage ({1})",
    owned = {
      title = "Owned",
      description = "Owned vehicles."
    },
    buy = {
      title = "Buy",
      description = "Buy vehicles.",
      info = "{1} $<br /><br />{2}"
    },
    sell = {
      title = "Sell",
      description = "Sell vehicles."
    },
    rent = {
      title = "Rent",
      description = "Rent a vehicle for the session (until you disconnect)."
    },
    store = {
      title = "Store",
      description = "Put your current vehicle in the garage."
    }
  },
  vehicle = {
    title = "Vehicle",
    no_owned_near = "~r~No owned vehicle near.",
    trunk = {
      title = "Trunk",
      description = "Open the vehicle trunk."
    },
    detach_trailer = {
      title = "Detach trailer",
      description = "Detach trailer."
    },
    detach_towtruck = {
      title = "Detach tow truck",
      description = "Detach tow truck."
    },
    detach_cargobob = {
      title = "Detach cargobob",
      description = "Detach cargobob."
    },
    lock = {
      title = "Lock/unlock",
      description = "Lock or unlock the vehicle."
    },
    engine = {
      title = "Engine on/off",
      description = "Start or stop the engine."
    },
    asktrunk = {
      title = "Ask open trunk",
      asked = "~g~Asking...",
      request = "Do you want to open the trunk ?"
    },
    replace = {
      title = "Replace vehicle",
      description = "Replace on ground the nearest vehicle."
    },
    repair = {
      title = "Repair vehicle",
      description = "Repair the nearest vehicle."
    },
    sellTP = {
  title = "Sell To Player",
  description = "Sell the nearest vehicle to a player."
    }
  }, 
  gunshop = {
    title = "Gunshop ({1})",
    prompt_ammo = "Amount of ammo to buy for the {1}:",
    info = "<em>body: </em> {1} $<br /><em>ammo: </em> {2} $/u<br /><br />{3}"
  },
  market = {
    title = "Market ({1})",
    prompt = "Amount of {1} to buy:",
    info = "{1} $<br /><br />{2}"
  },
  skinshop = {
    title = "Skinshop"
  },
  cloakroom = {
    title = "Cloakroom ({1})",
    undress = {
      title = "> Undress"
    }
  },
  itemtr = {
    informer = {
      title = "Illegal Informer",
      description = "{1} $",
      bought = "~g~Position sent to your GPS."
    }
  },
  mission = {
    blip = "Mission ({1}) {2}/{3}",
    display = "<span class=\"name\">{1}</span> <span class=\"step\">{2}/{3}</span><br /><br />{4}",
    cancel = {
      title = "Cancel mission"
    }
  },
  aptitude = {
    title = "Aptitudes",
    description = "Show aptitudes.",
    lose_exp = "Aptitude ~b~{1}/{2} ~r~-{3} ~s~exp.",
    earn_exp = "Aptitude ~b~{1}/{2} ~g~+{3} ~s~exp.",
    level_down = "Aptitude ~b~{1}/{2} ~r~lose level ({3}).",
    level_up = "Aptitude ~b~{1}/{2} ~g~level up ({3}).",
    display = {
      group = "{1}: ",
      aptitude = "--- {1} | exp {2} | lvl {3} | progress {4}%"
    }
  }
}

return lang
