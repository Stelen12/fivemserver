
local cfg = {}

-- size of the sms history
cfg.sms_history = 15

-- maximum size of an sms
cfg.sms_size = 500

-- duration of a sms position marker (in seconds)
cfg.smspos_duration = 300

-- define phone services
-- blipid, blipcolor (customize alert blip)
-- alert_time (alert blip display duration in seconds)
-- alert_permission (permission required to receive the alert)
-- alert_notify (notification received when an alert is sent)
-- notify (notification when sending an alert)
cfg.services = {
  ["police"] = {
    blipid = 304,
    blipcolor = 38,
    alert_time = 30, -- 5 minutes
    alert_permission = "police.service",
    alert_notify = "~r~Alerta policial:~n~~s~",
    notify = "~b~Llamaste a la policia.",
    answer_notify = "~b~La policia esta en camino."
  },
  ["emergency"] = {
    blipid = 153,
    blipcolor = 1,
    alert_time = 30, -- 5 minutes
    alert_permission = "emergency.service",
    alert_notify = "~r~Alerta SAME:~n~~s~",
    notify = "~b~Llamaste al SAME.",
    answer_notify = "~b~El SAME esta en camino."
  },
  ["uber"] = {
    blipid = 198,
    blipcolor = 5,
    alert_time = 300,
    alert_permission = "uber.service",
    alert_notify = "~y~Alerta UBER:~n~~s~",
    notify = "~y~Llamaste un UBER.",
    answer_notify = "~y~El UBER esta camino."
  },
  ["repair"] = {
    blipid = 446,
    blipcolor = 5,
    alert_time = 300,
    alert_permission = "repair.service",
    alert_notify = "~y~Alerta mecanico:~n~~s~",
    notify = "~y~Llamaste a un mecanico.",
    answer_notify = "~y~El mecanico esta camino."
  }
}

-- define phone announces
-- image: background image for the announce (800x150 px)
-- price: amount to pay to post the announce
-- description (optional)
-- permission (optional): permission required to post the announce
cfg.announces = {
  ["admin"] = {
    --image = "nui://vrp_mod/announce_admin.png",
    image = "http://i.imgur.com/kjDVoI6.png",
    price = 0,
    description = "Admin only.",
    permission = "admin.announce"
  },
  ["police"] = {
    --image = "nui://vrp_mod/announce_police.png",
    image = "http://i.imgur.com/DY6DEeV.png",
    price = 0,
    description = "Only for police, ex: wanted advert.",
    permission = "police.announce"
  },
  ["commercial"] = {
    --image = "nui://vrp_mod/announce_commercial.png",
    image = "http://i.imgur.com/b2O9WMa.png",
    description = "Commercial stuff (buy, sell, work).",
    price = 5000
  },
  ["party"] = {
    --image = "nui://vrp_mod/announce_party.png",
    image = "http://i.imgur.com/OaEnk64.png",
    description = "Organizing a party ? Let everyone know the rendez-vous.",
    price = 5000
  }
}

return cfg
