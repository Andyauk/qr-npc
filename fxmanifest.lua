fx_version 'cerulean'
game "rdr3"
rdr3_warning "I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships."

description 'qr-npc'

client_scripts {
	'client/npc.lua'
}

shared_scripts {
	'config.lua'
}

dependencies {
	'qr-core'
}