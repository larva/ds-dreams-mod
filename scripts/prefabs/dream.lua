local assets = {
	Asset("ANIM", "anim/dreams.zip"),
}

local dreams = {
	[false] = { -- sweet dreams
		"Is this real?",
		"I'm flying!",
		"I'm very rich!",
		"I'm so smart!",
	},
	[true] = { -- nightmares
		"I didn't study for the test!",
		"I'm naked and everyone is laughing!",
		"I'm fully dressed at a nudist colony and everyone is laughing!",
		"I'm being chased!",
		"I'm falling!",
	},
}

local function dream(Sim)
	local inst = CreateEntity()
	inst:AddTag("dream")
	inst:AddTag("cloud")
	inst:AddTag("notarget") -- See: shadowtentacle
	inst:AddTag("notraptrigger")
	inst:AddTag("cattoyairborne")
	inst:AddTag("fx")
	inst:AddTag("FX")

	inst.dreamer = nil
	inst.persists = false

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	MakeGhostPhysics(inst, 0.1, 1.5)
	RemovePhysicsColliders(inst)
	inst.Physics:SetCollisionGroup(COLLISION.SANITY)
	inst.Physics:CollidesWith(COLLISION.SANITY)
	inst.Physics:CollidesWith(COLLISION.WORLD)
	inst.Physics:SetMass(0)
	inst.Transform:SetScale(0.5, 0.5, 0.5)
	inst.AnimState:SetMultColour(1, 1, 1, 0.75)

	inst.entity:AddSoundEmitter()
	inst.SoundEmitter:PlaySound("dontstarve/sanity/shadowhand_creep", "dreaming")

	--
	-- NOTE: No need for a network component since this object
	--	 is purely for humorous effect.
	--
	inst.OnRemoveEntity = function(inst)
		inst.SoundEmitter:KillAllSounds()
		if inst.dreamer then
			inst.dreamer:RemoveChild(inst)
			inst.dreamer = nil
		end
	end

	-- See: http://forums.kleientertainment.com/topic/21111-creating-an-anim-for-items-on-the-ground/?do=findComment&comment=210493
	inst.AnimState:SetBank("dreams")
	inst.AnimState:SetBuild("dreams")

	inst.AnimState:PushAnimation("start", false)
	inst.AnimState:PushAnimation("pleasant", true)

	inst.isnightmare = false

	inst:AddComponent("inspectable")
	local descfn = function(inst, viewer)
		if viewer and inst.dreamer and (viewer == inst.dreamer) then
			local msgs = dreams[inst.isnightmare]
			return msgs[math.random(#msgs)]
		else
			return "What an odd dream!"
		end
	end
	if IsDST then
		inst.components.inspectable.descriptionfn = descfn
	else
		inst.components.inspectable:SetDescription(descfn)
	end

	inst.Disturb = function()
		inst.AnimState:PushAnimation("nightmare", true)
		inst.isnightmare = true
	end

	inst.animoverfn = nil
	inst.Over = function()
		if inst.SoundEmitter:PlayingSound("dreaming") then
			inst.SoundEmitter:KillSound("dreaming")
		end
		inst.AnimState:PushAnimation("end", false)
		inst.AnimState:PlayAnimation("end", false)
		inst:DoTaskInTime(0, function()
			inst.SoundEmitter:PlaySound("dontstarve/sanity/shadowhand_snuff", "poof")
			inst.animoverfn = function()
				inst:RemoveEventCallback("animover", inst.animoverfn)
				inst:RemoveEventCallback("animqueueover", inst.animoverfn)
				inst.animoverfn = nil
				inst:Remove()
			end
			inst:ListenForEvent("animover", inst.animoverfn)
			inst:ListenForEvent("animqueueover", inst.animoverfn)
		end)
	end
	return inst
end

return Prefab("dreaming/dream", dream, assets)
