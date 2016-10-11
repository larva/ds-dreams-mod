---
--- http://dontstarve.wikia.com/wiki/Console/Commands
---
GLOBAL.CHEATS_ENABLED = true
GLOBAL.require( 'debugkeys' )

local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local STRINGS = GLOBAL.STRINGS
local TECH = GLOBAL.TECH

-- Dreamsnatcher
STRINGS.NAMES.DREAMSNATCHER = "Dreamsnatcher"
STRINGS.NAMES.DREAMSNATCHER_ITEM = "Dreamsnatcher"
STRINGS.RECIPE_DESC.DREAMSNATCHER_ITEM = "Snatch your nightmares before they snatch you!"

STRINGS.CHARACTERS.GENERIC.DESCRIBE.DREAMSNATCHER = "Doubting, dreaming dreams no mortal ever dared to dream before"

STRINGS.CHARACTERS.GENERIC.DESCRIBE.DREAMSNATCHER_ITEM = "And his eyes have all the seeming of a demon's that is dreaming"

-- Dreams
STRINGS.NAMES.DREAM = "Dream"
STRINGS.NAMES.DREAM_ITEM = "Dream full of bugs and nasty squirmy things"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.DREAM = "What an odd dream!"

-- Dream tentacles
STRINGS.NAMES.DREAM_TENTACLE = "Dream feeding filament"
STRINGS.NAMES.DREAM_TENTACLE_ITEM = "Dream feeding filament clogged with bugs"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.DREAM_TENTACLE = "It pulses and beats like a grotesque ethereal heart!"

STRINGS.NAMES.DREAM_HAND = "Dream feeding sucker"
STRINGS.NAMES.DREAM_HAND_ITEM = "Dream feeding sucker big enough to capture bugs"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.DREAM_HAND = "It makes a hideous sucking sound as it reaps its stygian harvest!"

PrefabFiles =  { "dreamsnatcher", "dream", }

Assets = {
	Asset("ATLAS", "images/minimap.xml"),
	Asset("MINIMAP_IMAGE", "images/minimap.tex"),

	-- For recipe display in magic tab
	Asset("ATLAS", "images/dreamsnatcher.xml"),
	Asset("INV_IMAGE", "images/dreamsnatcher.tex"),
}
AddMinimapAtlas("images/minimap.xml")

IsDST =  GLOBAL.kleifileexists("scripts/networking.lua") and true or false
local IsDST = IsDST

IsSW = false
IsRoG = false
if GLOBAL.IsDLCEnabled ~= nil then
	if CAPY_DLC and CAPY_DLC ~= nil then
		IsSW = GLOBAL.IsDLCEnabled(CAPY_DLC) and true or false
	end
	if REIGN_OF_GIANTS and REIGN_OF_GIANTS ~= nil then
		IsRoG = GLOBAL.IsDLCEnabled(REIGN_OF_GIANTS) and true or false
	end
end
local IsSW = IsSW
local IsRoG = IsRoG

local __Recipe = GLOBAL.Recipe
if IsDST then
	-- Important: mods should not use Recipe() directly in DST
	__Recipe = AddRecipe
end

-- SWgametype = nil implies RECIPE_GAME_TYPE.COMMON
local SWgametype = nil

local _Recipe = __Recipe
if IsSW then
	-- Shipwrecked twisted Recipe() parameters in a very
	-- API-compat-unfriendly way.
	_Recipe = function(name, ingredients, tab, level, placer,
				min_spacing, nounlock, numtogive, builder_tag,
				atlas, image, testfn, ...)
		-- Sets aquatic to false and distance to 1 just like for non-SW
		-- Recipes.
		return __Recipe(name, ingredients, tab, level, SWgametype, placer, min_spacing, nounlock, numtogive, false, 1, ...)
	end
end

-- RoG and DST Recipe() parameters are compatible with the regular game. DST
-- extends the parameter list though. DST is more popular so we standardize
-- on that set of parameters...
local Recipe = _Recipe
if not IsDST then
	-- Provide as much of AddRecipe(), from DST api version 10, as possible.
	Recipe = function(name, ingredients, tab, level, placer, min_spacing, nounlock, numtogive, builder_tag, atlas, image, testfn, ...)
		if testfn and not placer then
			return ElChupacabra -- TODO shim is incomplete
		end
		local result = _Recipe(name, ingredients, tab, level,
					placer, min_spacing, nounlock,
					numtogive, builder_tag, atlas,
					image, testfn, ...)
		if not result then
			return result
		end
		if atlas then
			result.atlas = atlas -- TODO is this right? GLOBAL.resolvefilepath(atlas)
		end
		if builder_tag then
			-- TODO incomplete
			-- Need to patch builder to check recipe.builder_tag
			result.builder_tag = builder_tag
		end
		if image then
			result.image = image
		end
		if testfn and placer then
			result.testfn = testfn
			-- TODO incomplete
			-- Need to patch the playercontroller component's
			-- "StartBuildPlacementMode() to pass along testfn:
			-- self.placer.components.placer.testfn = recipe.testfn
		end
		return result
	end
end

local recipe = Recipe("dreamsnatcher", {
		Ingredient("goldnugget", 3),
		Ingredient("silk",  6),
		Ingredient("twigs", 6),
		Ingredient("feather_crow", 2)
	},
	RECIPETABS.MAGIC, TECH.MAGIC_TWO, "dreamsnatcher_placer",
	nil, nil, nil, nil, "images/dreamsnatcher.xml")

local function MakeDreamer(sleepercmp, inst)
	inst:AddTag("sleeper") -- DST compat

	-- Ignore structural sleepers (birdcage)
	if inst:HasTag("structure") then
		return
	end
	inst:AddComponent("dreamer")
end
AddComponentPostInit("sleeper", MakeDreamer)

local function MakePlayerDreamer(inst)
	inst:AddComponent("dreamer")
end
AddPlayerPostInit(MakePlayerDreamer)
