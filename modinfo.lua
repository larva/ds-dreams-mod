-- http://dont-starve-modding.wikia.com/wiki/Modinfo.lua 
version = "0.76"
name = "Dream Snatcher"
description = "Harnessing the stuff of nightmares. Haunt the dreams of your friends for fun and profit!"
author = "larva"
forumthread = ""

api_version = 6

dont_starve_compatible = true
reign_of_giants_compatible = true
shipwrecked_compatible = true

--- DST compat:
--- http://forums.kleientertainment.com/topic/47353-guide-getting-started-with-modding-dst-and-some-general-tips-for-ds-as-well/
api_version_dst = 10
dst_compatible = true
server_filter_tags = {}

--- This lets clients know if they need to get the mod from the Steam Workshop
--- to join the game
all_clients_require_mod = true

--- This determines whether it causes a server to be marked as modded (and shows
--- in the mod list)
clients_only_mod = false

--- END DST compat

icon_atlas = "modicon.xml"
icon = "modicon.tex"

configuration_options = {
	{
		name = "configHackPlayer",
		label = "Player dreams",
		hover = "... and nightmares!",
		options = {
			{ description = "Yes", hover = "Chasing Dreams", data = true },
			{ description = "No",  hover = "Hopeless", data = false },
		},
		-- NOTE: DST bug prevents changing configs on Linux!
		default = true,
	},
}
