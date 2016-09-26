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
