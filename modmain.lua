---
--- http://dontstarve.wikia.com/wiki/Console/Commands
---
GLOBAL.CHEATS_ENABLED = true
GLOBAL.require( 'debugkeys' )

local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local STRINGS = GLOBAL.STRINGS
local TECH = GLOBAL.TECH

STRINGS.NAMES.DREAMSNATCHER_ITEM = "Dreamsnatcher"
STRINGS.RECIPE_DESC.DREAMSNATCHER_ITEM = "Snatch your nightmares."

STRINGS.NAMES.DREAMSNATCHER = "Dreamsnatcher"

STRINGS.CHARACTERS.GENERIC.DESCRIBE.DREAMSNATCHER = "Doubting, dreaming dreams no mortal ever dared to dream before"

STRINGS.CHARACTERS.GENERIC.DESCRIBE.DREAMSNATCHER_ITEM = "And his eyes have all the seeming of a demon's that is dreaming"

STRINGS.NAMES.DREAM_ITEM = "Dream"
STRINGS.NAMES.DREAM = "Dream"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.DREAM = "What an odd dream!"

PrefabFiles =  { "dreamsnatcher", "dream", }

Assets = {
	Asset("ATLAS", "images/minimap.xml"),
	Asset("MINIMAP_IMAGE", "images/minimap.tex"),
}
AddMinimapAtlas("images/minimap.xml")

local dreamsnatcher = GLOBAL.Recipe("dreamsnatcher",
	{Ingredient("goldnugget", 3),
	 Ingredient("silk",  3),
	 Ingredient("twigs", 6),
	 Ingredient("feathers", 2)},
	RECIPETABS.MAGIC, TECH.MAGIC_TWO) --, "dreamsnatcher_placer")
dreamsnatcher.atlas = "images/dreamsnatcher.xml"

local function MakeDreamer(sleepercmp, inst)
	-- disable structural dreamers (dreamsnatcher, birdcage..)
	if inst:HasTag("structure") then
		return
	end
	inst:AddComponent("dreamer")
end

AddComponentPostInit("sleeper", MakeDreamer)
