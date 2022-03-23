fx_version 'adamant'

game 'gta5'

lua54 'yes'

author 'CreztY'

version '1.0.0'

client_scripts {
	'@es_extended/locale.lua',
	'locales/*.lua',
	'config.lua',
	'client/main.lua'
}

server_scripts {
	'@async/async.lua',
	'@oxmysql/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/*.lua',
	'config.lua',
	'server/main.lua'
}

ui_page 'html/index.html'

files {
	'html/index.css',
	'html/index.html',
	'html/script.js'
}

dependency 'es_extended'