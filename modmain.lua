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

STRINGS.NAMES.DREAM_TENTACLE_ITEM = "Dream feeding filament"
STRINGS.NAMES.DREAM_TENTACLE = "Dream feeding filament"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.DREAM_TENTACLE = "It pulses and beats like a grotesque ethereal heart!"

STRINGS.NAMES.DREAM_HAND_ITEM = "Dream feeding sucker"
STRINGS.NAMES.DREAM_HAND = "Dream feeding sucker"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.DREAM_HAND = "It makes a hideous sucking sound as it reaps its stygian harvest!"

PrefabFiles =  { "dreamsnatcher", "dream", }

Assets = {
	Asset("ATLAS", "images/minimap.xml"),
	Asset("MINIMAP_IMAGE", "images/minimap.tex"),
}
AddMinimapAtlas("images/minimap.xml")

local WrapAddRecipe = nil
if AddRecipe ~= nil then
	WrapAddRecipe = AddRecipe
else
	-- Wrap Recipe constructor. Match AddRecipe() from DST (api version 10)
	WrapAddRecipe = function(name, ingredients, tab, level, placer, min_spacing, nounlock, numtogive, builder_tag, atlas, image, testfn, ...)
		if testfn and not placer then
			return ElChupacabra -- TODO shim is incomplete
		end
		-- Important: mods should not use Recipe() directly in DST
		local result = GLOBAL.Recipe(name, ingredients, tab, level,
						placer, min_spacing, nounlock,
						numtogive, builder_tag, atlas,
						image, testfn, ...)
		if not result then
			return result
		end
		if atlas then
			result.atlas = atlas
		end
		if builder_tag then
			result.builder_tag = builder_tag
		end
		if image then
			result.image = image
		end
		if testfn and placer then
			placer.testfn = testfn
		end
		return result
	end
end

WrapAddRecipe("dreamsnatcher", {
		Ingredient("goldnugget", 3),
		Ingredient("silk",  6),
		Ingredient("twigs", 6),
		Ingredient("feather_crow", 2)
	},
	RECIPETABS.MAGIC, TECH.MAGIC_TWO,
	nil,
	nil,
	false,
	1,
	nil,
	"images/dreamsnatcher.xml", "images/dreamsnatcher.tex",
	nil)

local function MakeDreamer(sleepercmp, inst)
	inst:AddTag("sleeper") -- DST compat

	-- disable structural sleeper/dreamers (dreamsnatcher, birdcage..)
	if inst:HasTag("structure") then
		return
	end
	inst:AddComponent("dreamer")
end

AddComponentPostInit("sleeper", MakeDreamer)
