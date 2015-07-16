.PHONY: all clean install

all:

clean:

install:
	rsync -caOJWi ./ ~/.games/dont_starve/mods/DreamSnatcher
