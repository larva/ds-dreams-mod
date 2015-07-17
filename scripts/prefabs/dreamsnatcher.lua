--GLOBAL.require "prefabutil"

local assets = {
	Asset("ATLAS", "images/dreamsnatcher.xml"),
	Asset("IMAGE", "images/dreamsnatcher.tex"),
	--Asset("ANIM", "anim/dreamsnatcher.zip"),
	--Asset("SOUND", "sound/foo.fsb"),
}

local function onfinished(inst)
	-- TODO drop nightmare fuel
	-- TODO make disappearance animation
end

local function onwake(inst)
	inst.SoundEmitter:PlaySound("dontstarve/sanity/shadowhand_creep", "creeping")
end

local function onsleep(inst)
	inst.SoundEmitter:KillSound("creeping")
end

local function onnear(inst)
	--inst.SoundEmitter:PlaySound("dontstarve/rain/thunder_close", "rumble")
	-- TODO get all entities with "character" tag and shake their camera?
        --GetPlayer().components.playercontroller:ShakeCamera(inst, "FULL", 0.7, 0.02, .5, 40)
	local lning = SpawnPrefab("common/lightning")
	lning.Transform:SetPosition(inst.Transform:GetWorldPosition())
end

local function onfar(inst)
	--inst.SoundEmitter:KillSound("rumble")
end

local radius = 1

local function fn(Sim)
	local inst = CreateEntity()
	inst.entity:AddTransform()

	local shadow = inst.entity:AddDynamicShadow()
	shadow:SetSize(1, .5)

	--local anim = inst.entity:AddAnimState()
	--anim:SetBank("dreamsnatcher")
	--anim:SetBuild("dreamsnatcher")
	--anim:PlayAnimation("idle", true)

	inst.entity:AddSoundEmitter()

	MakeObstaclePhysics(inst, radius)

	--local minimap = inst.entity:AddMiniMapEntity()
	--minimap:SetIcon("images/dreamsnatcher.tex")

	inst:AddTag("structure")
	inst:AddTag("dreamsnatcher")

	inst:AddComponent("inspectable")
	inst.components.inspectable:SetDescription("It appears to be doubting, dreaming dreams no mortal ever dared to dream before")

	inst:AddComponent("sleeper")
	inst.components.sleeper.hibernate = false
	inst.components.sleeper:SetNocturnal(true)
	inst.components.sleeper:SetDefaultTests()
	inst.components.sleeper:SetResistance(3)
	inst:ListenForEvent("onwakeup", onwake)
	inst:ListenForEvent("gotosleep", onsleep)
	
	inst:AddComponent("playerprox")
	inst.components.playerprox:SetDist(5,6)
	inst.components.playerprox.onnear = onnear
	inst.components.playerprox.onfar = onfar

	inst:AddComponent("sanityaura")
	inst.components.sanityaura.aura = -TUNING.SANITYAURA_SMALL

	--inst:AddComponent("finiteuses")
	--inst.components.finiteuses:SetMaxUses(TUNING.TENT_USES)
	--inst.components.finiteuses:SetUses(TUNING.TENT_USES)
	--inst.components.finiteuses:SetOnFinished(onfinished)

	MakeMediumBurnable(inst)
	MakeLargePropagator(inst)
	-- Requires anim state MakeSnowCovered(inst, 0.1*radius)

	return inst
end

return Prefab("magic/dreamsnatcher", fn, assets)
