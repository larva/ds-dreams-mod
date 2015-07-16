local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local STRINGS = GLOBAL.STRINGS
local TECH = GLOBAL.TECH

STRINGS.NAMES.DREAMSNATCHER_ITEM = "Dreamsnatcher"
STRINGS.RECIPE_DESC.DREAMSNATCHER_ITEM = "Harness your nightmares."

STRINGS.NAMES.DREAMSNATCHER = "Dreamsnatcher"

STRINGS.CHARACTERS.GENERIC.DESCRIBE.DREAMSNATCHER = "Doubting, dreaming dreams no mortal ever dared to dream before"

STRINGS.CHARACTERS.GENERIC.DESCRIBE.DREAMSNATCHER_ITEM = "And his eyes have all the seeming of a demon's that is dreaming"

PrefabFiles = 
{
	"dreamsnatcher",
}

Assets = 
{
	Asset("IMAGE", "minimap/dreamsnatcher.tex"),
	Asset("ATLAS", "minimap/dreamsnatcher.xml"),
}
AddMinimapAtlas("minimap/dreamsnatcher.xml")

local dreamsnatcher = GLOBAL.Recipe("dreamsnatcher",
	{Ingredient("goldnugget", 3),
	 Ingredient("silk",  3),
	 Ingredient("twigs", 6),
	 Ingredient("feathers", 2)},
	RECIPETABS.MAGIC, TECH.MAGIC_TWO, "dreamsnatcher_placer")
dreamsnatcher.atlas = "minimap/dreamsnatcher.xml"

local radius = 12
local sleepingbag = GLOBAL.require "components/sleepingbag"
local dosleep = sleepingbag.DoSleep
function sleepingbag:DoSleep(sleeper)
	dosleep(self, sleeper)
	local snatcher = GetClosestInstWithTag("dreamsnatcher", sleeper, radius)
	if (not snatcher) then
		return
	end

	snatcher.ListenForEvent("onwakeup", function(sleeper)
		local fuel = GLOBAL.SpawnPrefab("nightmarefuel")
		fuel.Transform:SetPosition(snatcher.Transform.GetWorldPosition())
		snatcher.components.finiteuses.Use()
		snatcher.RemoveEventCallback("onwakeup", self, sleeper)
	end, sleeper)
end
