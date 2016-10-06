.PHONY: all install reset clean

TEX=~/.games/dont_starve/mods/mod_tools/png
ANIM=~/.games/dont_starve/mods/mod_tools/scml


# TODO anim/dream_tentacle.zip anim/dream_hand.zip
all: images/modicon.tex images/dreamsnatcher.tex images/minimap.tex anim/dreamsnatcher.zip anim/dreams.zip

anim/dreams.zip: $(wildcard art/dreams/*.png)
anim/dreamsnatcher.zip: $(wildcard art/dreamsnatcher/*.png)

anim/%.zip: art/%.scml
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
