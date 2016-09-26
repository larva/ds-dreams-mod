---
--- http://dontstarve.wikia.com/wiki/Console/Commands
--- RunScript("consolecommands")
--- c_godmode()
--- c_spawn("magic/dreamsnatcher")
---
GLOBAL.CHEATS_ENABLED = true
GLOBAL.require( 'debugkeys' )

local function c_give_camp()
	c_godmode()
	c_give("cutgrass", 20)
	c_give("logs", 20)
	c_give("rocks", 20)
	c_give("twigs", 20)
	c_give("flint", 20)
	c_give("berries", 20)
	c_give("common/inventory/tent")
end

local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local STRINGS = GLOBAL.STRINGS
local TECH = GLOBAL.TECH

STRINGS.NAMES.DREAMSNATCHER_ITEM = "Dreamsnatcher"
STRINGS.RECIPE_DESC.DREAMSNATCHER_ITEM = "Snatch your nightmares."

STRINGS.NAMES.DREAMSNATCHER = "Dreamsnatcher"

STRINGS.CHARACTERS.GENERIC.DESCRIBE.DREAMSNATCHER = "Doubting, dreaming dreams no mortal ever dared to dream before"

STRINGS.CHARACTERS.GENERIC.DESCRIBE.DREAMSNATCHER_ITEM = "And his eyes have all the seeming of a demon's that is dreaming"

PrefabFiles =  { "dreamsnatcher", }

Assets = {
	Asset("ATLAS", "images/minimap.xml"),
	Asset("IMAGE", "images/minimap.tex"),
}
AddMinimapAtlas("images/minimap.xml")

local dreamsnatcher = GLOBAL.Recipe("dreamsnatcher",
	{Ingredient("goldnugget", 3),
	 Ingredient("silk",  3),
	 Ingredient("twigs", 6),
	 Ingredient("feathers", 2)},
	RECIPETABS.MAGIC, TECH.MAGIC_TWO) --, "dreamsnatcher_placer")
dreamsnatcher.atlas = "images/dreamsnatcher.xml"
--
-- Patch sleepingbag.DoSleep() to find the closest dreamsnatcher
--
local search_radius = 20
local sleepingbag = GLOBAL.require "components/sleepingbag"
local dosleep = sleepingbag.DoSleep
function sleepingbag:DoSleep(sleeper)
	dosleep(self, sleeper)

	-- Monsters don't interact with dreamsnatcher
	if sleeper:HasTag("monster") then
		return
	end

	local snatcher = GLOBAL.GetClosestInstWithTag("dreamsnatcher", sleeper, search_radius)
	if snatcher then
		sleeper:ListenForEvent("wakeup", function(inst)
			sleeper:RemoveEventCallback("wakeup", self)

			local fuel = SpawnPrefab("nightmarefuel")
			fuel.Transform:SetPosition(sleeper.Transform:GetWorldPosition())
			--inst.components.finiteuses:Use()
		end)
	end
end
