.PHONY: all install

all:
	~/.games/dont_starve/mods/mod_tools/autocompiler ./

install:
	rsync -camOJWi ./ ~/.games/dont_starve/mods/DreamSnatcher
