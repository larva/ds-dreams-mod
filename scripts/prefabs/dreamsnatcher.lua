GLOBAL.require "prefabutil"

local assets = {
	Asset("IMAGE", "minimap/dreamsnatcher.tex"),
	Asset("ATLAS", "minimap/dreamsnatcher.xml"),
}

local function inspect(inst, viewer)
	return 
end

local function onfinished(inst)
	-- TODO drop nightmare fuel
	-- TODO make disappearance animation
end

local function fn(Sim)
	local inst = CreateEntity()
	local trans = inst.entity:AddTransform()
	MakeObstaclePhysics(inst, radius)
	local minimap = inst.entity.AddMiniMapEntity()
	minimap.SetIcon("dreamsnatcher.tex")
	inst:AddTag("structure")
	inst:AddTag("dreamsnatcher")
	MakeMediumBurnable(inst)
	MakeMediumPropagator(inst)
	MakeSnowCovered(inst, 0.1)
	inst:AddComponent("inspectable")
	inst.components.inspectable:SetDescription("It appears to be doubting, dreaming dreams no mortal ever dared to dream before")
	inst:AddComponent("sanityaura")
	inst.components.sanityaura.aura = -TUNING.SANITYAURA_SMALL

	inst:AddComponent("finiteuses")
	inst.components.finiteuses:SetMaxUses(TUNING.TENT_USES)
	inst.components.finiteuses:SetUses(TUNING.TENT_USES)
	inst.components.finiteuses:SetOnFinished(onfinished)

	return inst
end

return Prefab("magic/dreamsnatcher", fn),
	MakePlacer("magin/dreamsnatcher_placer", "dreamsnatcher", "dreamsnatcher", "idle")
