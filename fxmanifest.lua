fx_version 'cerulean'
game 'gta5'

author 'Fugas'
description 'Ped menu'

dependency 'es_extended'
dependency 'fgs-notify'

shared_scripts {
    '@es_extended/imports.lua'
}

client_scripts {
    'config.lua',
    'client/*.lua'
}

server_scripts {
    'config.lua',
    'users.lua',
    'server/*.lua'
}
