fx_version 'cerulean'
games { 'gta5' }

author 'Neco with 💖 for the FiveM community.'
description 'ChaosMod gamemode for FiveM servers.'
version '1.0.0'

server_scripts {
  "server/*.lua",
}

client_scripts {
  "client/*.lua",
}

shared_scripts {
  "init.lua",
  "shared/*.lua",
  "modules/**/*.lua"
}
