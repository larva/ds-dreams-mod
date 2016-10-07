local assets = {
	Asset("ANIM", "anim/fade.zip"),
}

local function fade(Sim)
	local inst = CreateEntity()
	inst:AddTag("notarget")
	inst:AddTag("notraptrigger")
	inst:AddTag("fx")
	inst:AddTag("FX")

	inst.persists = true

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	MakeGhostPhysics(inst, 0.1, 1.5)
	RemovePhysicsColliders(inst)
	inst.Physics:SetCollisionGroup(COLLISION.SANITY)
	inst.Physics:CollidesWith(COLLISION.SANITY)
	inst.Physics:CollidesWith(COLLISION.WORLD)
	inst.Physics:SetMass(0)
	inst.AnimState:SetScale(64.0, 64.0, 64.0)
	inst.AnimState:SetMultColour(1, 1, 1, 0.75)

	inst.AnimState:SetBank("fade")
	inst.AnimState:SetBuild("fade")

	inst.AnimState:PushAnimation("idle", true)
	return inst
end

return Prefab("fade", fade, assets)
