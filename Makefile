.PHONY: all install reset clean

TEX=~/.games/dont_starve/mods/mod_tools/png
ANIM=~/.games/dont_starve/mods/mod_tools/scml


all: images/modicon.tex images/dreamsnatcher.tex anim/dreamsnatcher.zip
	mv -f images/modicon.tex $(CURDIR)
	mv -f images/modicon.xml $(CURDIR)

anim/%.zip: art/%.scml
	$(ANIM) $^ $(CURDIR)

images/%.tex: images/%.png
	$(TEX) $^ $(CURDIR)/images/

reset:
	-@killall dontstarve_steam 2> /dev/null

install: all
	rsync -camOJWi --exclude=.git --exclude=art --exclude=old-art --exclude=art-src --exclude=Makefile --exclude='*~' --exclude='*.png' --exclude='*.kra' --exclude='*.swp' ./ ~/.games/dont_starve/mods/DreamSnatcher

clean:
	find $(CURDIR) -name '*.tex' -print0 | xargs -r0 rm
	find $(CURDIR) -name '*.zip' -print0 | xargs -r0 rm
