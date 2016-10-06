.PHONY: all install reset clean

TEX=~/.games/dont_starve/mods/mod_tools/png
ANIM=~/.games/dont_starve/mods/mod_tools/scml

# TODO Add animations for dream_tentacle and dream_hand
ANIMATIONS := dreams dreamsnatcher
IMAGES := modicon dreamsnatcher minimap

all: $(patsubst %,images/%.tex,$(IMAGES)) $(patsubst %,anim/%.zip,$(ANIMATIONS))

.SECONDEXPANSION:
anim/%.zip: art/%.scml $$(wildcard art/%/*.png)
	$(ANIM) $< $(CURDIR)

images/%.tex: images/%.png
	$(TEX) $^ $(CURDIR)/images/

reset:
	-@killall dontstarve_steam 2> /dev/null

install: all
	rsync -camOJWi --exclude=.git --exclude=art --exclude=old-art --exclude=old-src --exclude=art-src --exclude=.gitignore --exclude=Makefile --exclude='*~' --exclude='*.png' --exclude='*.kra' --exclude='*.swp' ./ ~/.games/dont_starve/mods/DreamSnatcher
	rsync -camOJWi --exclude=.git --exclude=art --exclude=old-art --exclude=old-src --exclude=art-src --exclude=.gitignore --exclude=Makefile --exclude='*~' --exclude='*.png' --exclude='*.kra' --exclude='*.swp' ./ "${HOME}/.games/Don't Starve Together/mods/DreamSnatcher"

clean:
	find $(CURDIR) -name '*.tex' -print0 | xargs -r0 rm
	find $(CURDIR) -name '*.zip' -print0 | xargs -r0 rm
	find $(CURDIR) -name '*.xml' -print0 | xargs -r0 rm
