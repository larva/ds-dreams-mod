require "prefabutil"

--
-- Ravings from "The Raven", by Edgar Allen Poe
--
local ravings = {
"Once upon a midnight dreary, while I pondered, weak and weary",
"Over many a quaint and curious volume of forgotten lore",
"While I nodded, nearly napping, suddenly there came a tapping",
"As of some one gently rapping, rapping at my chamber door.",
"\"'Tis some visitor,\" I muttered, \"tapping at my chamber door-",
"Only this and nothing more.\"'",
"",
"Ah, distinctly I remember it was in the bleak December;",
"And each separate dying ember wrought its ghost upon the floor.",
"Eagerly I wished the morrow; vainly I had sought to borrow",
"From my books surcease of sorrow -- sorrow for the lost Lenore--",
"For the rare and radiant maiden whom the angels name Lenore--",
"Nameless here for evermore.",
"",
"And the silken, sad, uncertain rustling of each purple curtain",
"Thrilled me -- filled me with fantastic terrors never felt before;",
"So that now, to still the beating of my heart, I stood repeating",
"\"'Tis some visitor entreating entrance at my chamber door--",
"Some late visitor entreating entrance at my chamber door;--",
"This it is and nothing more.\"",
"",
"Presently my soul grew stronger; hesitating then no longer,",
"\"Sir,\" said I, \"or Madam, truly your forgiveness I implore;",
"But the fact is I was napping, and so gently you came rapping,",
"And so faintly you came tapping, tapping at my chamber door,",
"That I scarce was sure I heard you\" -- here I opened wide the door; --",
"Darkness there and nothing more.",
"",
"Deep into that darkness peering, long I stood there wondering, fearing,",
"Doubting, dreaming dreams no mortal ever dared to dream before;",
"But the silence was unbroken, and the stillness gave no token,",
"And the only word there spoken was the whispered word, \"Lenore?\"",
"This I whispered, and an echo murmured back the word, \"Lenore!\" --",
"Merely this and nothing more.",
"",
"Back into the chamber turning, all my soul within me burning,",
"Soon again I heard a tapping somewhat louder than before.",
"\"Surely,\" said I, \"surely that is something at my window lattice;",
"Let me see, then, what thereat is, and this mystery explore --",
"Let my heart be still a moment and this mystery explore;-",
"'Tis the wind and nothing more!\"",
"",
"Open here I flung the shutter, when, with many a flirt and flutter,",
"In there stepped a stately Raven of the saintly days of yore;",
"Not the least obeisance made he; not a minute stopped or stayed he;",
"But, with mien of lord or lady, perched above my chamber door --",
"Perched upon a bust of Pallas just above my chamber door --",
"Perched, and sat, and nothing more.",
"",
"Then this ebony bird beguiling my sad fancy into smiling,",
"By the grave and stern decorum of the countenance it wore,",
"\"Though thy crest be shorn and shaven, thou,\" I said, \"art sure no craven,",
"Ghastly grim and ancient Raven wandering from the Nightly shore --",
"Tell me what thy lordly name is on the Night’s Plutonian shore!\"",
"Quoth the Raven \"Nevermore.\"",
"",
"Much I marvelled this ungainly fowl to hear discourse so plainly,",
"Though its answer little meaning -- little relevancy bore;",
"For we cannot help agreeing that no living human being",
"Ever yet was blessed with seeing bird above his chamber door --",
"Bird or beast upon the sculptured bust above his chamber door,",
"With such name as \"Nevermore.\"",
"",
"But the Raven, sitting lonely on the placid bust, spoke only",
"That one word, as if his soul in that one word he did outpour.",
"Nothing farther then he uttered -- not a feather then he fluttered—",
"Till I scarcely more than muttered \"Other friends have flown before --",
"On the morrow he will leave me, as my Hopes have flown before.\"",
"Then the bird said \"Nevermore.\"",
"",
"Startled at the stillness broken by reply so aptly spoken,",
"\"Doubtless,\" said I, \"what it utters is its only stock and store",
"Caught from some unhappy master whom unmerciful Disaster",
"Followed fast and followed faster till his songs one burden bore --",
"Till the dirges of his Hope that melancholy burden bore",
"Of 'Never -- nevermore'.\"",
"",

"But the Raven still beguiling all my fancy into smiling,",
"Straight I wheeled a cushioned seat in front of bird, and bust and door;",
"Then, upon the velvet sinking, I betook myself to linking",
"Fancy unto fancy, thinking what this ominous bird of yore --",
"What this grim, ungainly, ghastly, gaunt, and ominous bird of yore",
"Meant in croaking \"Nevermore.\"",
"",
"This I sat engaged in guessing, but no syllable expressing",
"To the fowl whose fiery eyes now burned into my bosom's core;",
"This and more I sat divining, with my head at ease reclining",
"On the cushion's velvet lining that the lamp-light gloated o'er,",
"But whose velvet-violet lining with the lamp-light gloating o'er,",
"She shall press, ah, nevermore!",
"",
"Then, methought, the air grew denser, perfumed from an unseen censer",
"Swung by Seraphim whose foot-falls tinkled on the tufted floor.",
"\"Wretch,\" I cried, \"thy God hath lent thee -- by these angels he hath sent thee",
"Respite -- respite and nepenthe from thy memories of Lenore;",
"Quaff, oh quaff this kind nepenthe and forget this lost Lenore!\"",
"Quoth the Raven \"Nevermore.\"",
"",
"\"Prophet!\" said I, \"thing of evil! -- prophet still, if bird or devil! --",
"Whether Tempter sent, or whether tempest tossed thee here ashore,",
"Desolate yet all undaunted, on this desert land enchanted --",
"On this home by Horror haunted -- tell me truly, I implore --",
"Is there -- is there balm in Gilead? -- tell me -- tell me, I implore!\"",
"Quoth the Raven \"Nevermore.\"",
"",
"\"Prophet!\" said I, \"thing of evil! -- prophet still, if bird or devil!",
"By that Heaven that bends above us -- by that God we both adore --",
"Tell this soul with sorrow laden if, within the distant Aidenn,",
"It shall clasp a sainted maiden whom the angels name Lenore --",
"Clasp a rare and radiant maiden whom the angels name Lenore.\"",
"Quoth the Raven \"Nevermore.\"",
"",
"\"Be that word our sign of parting, bird or fiend!\" I shrieked, upstarting --",
"\"Get thee back into the tempest and the Night's Plutonian shore!",
"Leave no black plume as a token of that lie thy soul hath spoken!",
"Leave my loneliness unbroken! -- quit the bust above my door!",
"Take thy beak from out my heart, and take thy form from off my door!\"",
"Quoth the Raven \"Nevermore.\"",
"",
"And the Raven, never flitting, still is sitting, still is sitting",
"On the pallid bust of Pallas just above my chamber door;",
"And his eyes have all the seeming of a demon's that is dreaming,",
"And the lamp-light o'er him streaming throws his shadow on the floor;",
"And my soul from out that shadow that lies floating on the floor",
"Shall be lifted -- nevermore!",
}

IsDST =  _G.kleifileexists("scripts/networking.lua") and true or false
local IsDST = IsDST

local assets = {
	Asset("ANIM", "anim/dreamsnatcher.zip"),
}

local prefabs = {
	"shadowhand",
	"shadowhand_arm",
	"nightmarefuel",
}

if IsDST then
	local GetWorld = function()
		return TheWorld
	end
end

local function GetPhase()
	if IsDST then
		if TheWorld.state.isday then
			return 0
		elseif TheWorld.state.isnight then
			return 2
		else
			return 1
		end
	else
		if GetClock():IsDay() then
			return 0
		elseif GetClock():IsDusk() then
			return 1
		else
			return 2
		end
	end
end

local function onnear(inst, player)

	inst.SoundEmitter:PlaySound("dontstarve/rain/thunder_close", "rumble")

	-- TheCamera:Shake(shakeType, duration, speed, scale)
	-- See components/quaker.lua -- TODO no idea what "40" is!
	local duration = 100000000 -- such a long time is sort of like forever
	local intensity = math.min(100.0, inst.insanity)/100.0
	local scale = 0.2*intensity
	local speed = 0.02*intensity
	if IsDST then
		-- NOTE: player is non-nil in DST ONLY!
		player:ScreenFlash(intensity)
		-- See: ShakeAllCameras() in simutil.lua
		player:ShakeCamera(CAMERASHAKE.FULL, duration, speed, scale, inst, 40)
		inst.shakees[player] = player
	else
		inst:DoTaskInTime(0, function()
			GetClock():DoLightningLighting(intensity)
		end)
		TheCamera:Shake("FULL", duration, speed, scale, 40)
	end
end

local function onfar(inst)
	-- NOTE: player is non-nil in DST ONLY!
	inst.SoundEmitter:KillSound("rumble")
	if IsDST then
		-- No more players are nearby
		for k,v in pairs(inst.shakees) do
			if v ~= nil then
				v:ShakeCamera(CAMERASHAKE.FULL, 0, 0, 0, 0, nil, 0)
			end
		end
		inst.shakees = {}
	else
		TheCamera:Shake("FULL", 0.01, 0, 0, 0)
	end
end

local function ondescribe(inst, viewer)
	local phase = GetPhase()
	if phase == 0 then
		return "I find myself doubting, dreaming dreams no mortal ever dared to dream before."
	elseif phase == 1 then
		return "I can see the Night\'s Plutonian shore!"
	end

	local quoth = ravings[inst.line]
	inst.line = (inst.line + 1) % #ravings
	if not quoth then
		return "Odd, I was expecting something fantastic"
	end
	return quoth
end

local radius = 1

local function onload(inst, data)
	if data and data.line then
		inst.line = data.line
	end
	if data and data.insanity then
		inst.insanity = data.insanity
	end
	inst.AnimState:PlayAnimation("idle", true)
end

local function onsave(inst, data)
	if data == nil then
		data = {}
	end
	data.line = inst.line
	data.insanity = inst.insanity
end

local function fn(Sim)
	local inst = CreateEntity()
	inst.entity:AddTransform()
	local anim = inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
	MakeObstaclePhysics(inst, radius)
	local minimap = inst.entity:AddMiniMapEntity()
	local light = inst.entity:AddLight()
	if IsDST then
		inst.entity:AddNetwork()
	end

	anim:SetBank("dreamsnatcher") -- Entity Name in Spriter (top level)
	anim:SetBuild("dreamsnatcher") -- File name (e.g. "filename.zip")
	anim:PlayAnimation("idle", true) -- Animation in Spriter (bottom level)
	--anim:SetMultColour(1, 1, 1, 1.0)
	minimap:SetIcon("minimap.tex")
	minimap:SetPriority(1)

	inst:AddTag("structure")
	inst:AddTag("dreamsnatcher")

	light:Enable(false)
	light:SetRadius(1.2)
	light:SetFalloff(1)
	light:SetIntensity(0.25)
	light:SetColour(1.0, 1.0, 1.0)

	if IsDST then
		MakeSnowCoveredPristine(inst)
	end

	--
	-- Snatcher arms operate independently on client and server;
	-- there is no need to keep them in sync. However we only
	-- accumulate insanity and spawn loot on the server.
	--
	inst.snatcher_arms = {}
	inst.attached = 0
	inst:ListenForEvent("onattachdreamer", function(inst, dreamer)
		inst.attached = inst.attached + 1
		inst.snatcher_arms[dreamer].start = GetTime()
		if inst.attached == 1 then
			-- TODO use light tweener?
			inst.Light:Enable(true)
			-- First to attach so initiate snatching animation loop
			--inst.AnimState:PlayAnimation("snatch_pre", false)
			inst.AnimState:PushAnimation("snatch_pre", false)
			inst.AnimState:PushAnimation("snatch", true)
		end
		local dream = dreamer.components.dreamer.dream
		if dream then
			dream:Disturb()
		end
		if IsDST and not TheWorld.ismastersim then
			return
		end
		if not dreamer.components.sanity then
			return
		end
		dreamer.sanitysuckfn = function(event)
			-- All sanity gained by entities with sanity components
			-- produces opposite amounts of insanity absorbed by
			-- dream snatcher. Only insanity accumulates towards
			-- spawning nightmarefuel.
			local delta = event.newpercent - event.oldpercent
			if delta < 0 then
				return
			end
			inst.insanity = inst.insanity + delta
		end
		dreamer.sanefn = function(event)
			-- HOWEVER: Sleepers that go sane wipe out accumulation
			inst.insanity = 0
		end
		dreamer.insanefn = function(event)
			-- AND: Sleepers that go insane boost nightmare 
			-- production alot! This should be impossible because
			-- sleeping restores sanity.
			inst.insanity = inst.insanity + 100
		end
		inst:ListenForEvent("sanitydelta", dreamer.sanitysuckfn)
		inst:ListenForEvent("gosane", dreamer.sanefn)
		inst:ListenForEvent("goinsane", dreamer.insanefn)
	end)
	inst.Attach = function(inst, dreamer)
		if not dreamer then
			return
		end
		if inst.snatcher_arms[dreamer] then
			return
		end
		local hand = SpawnPrefab("shadowhand")--"dreaming/dream_hand")
		hand:AddTag("notarget")
		hand:AddTag("notraptrigger")
		hand.persists = false
		RemovePhysicsColliders(hand)
		hand.Physics:SetCollisionGroup(COLLISION.SANITY)
		hand.Physics:CollidesWith(COLLISION.SANITY)
		--hand.Physics:CollidesWith(COLLISION.WORLD)
		hand.Physics:SetMass(10) -- Needs nonzero mass otherwise it never moves!
		hand.arm = nil

		-- Critical HACKS
		-- Removing player proximity ensures the shadowhand never
		-- starts searching for a fire.
		if hand.components.playerprox then
			hand:RemoveComponent("playerprox")
		end
		-- Removing the daytime callback ensures the hand works for
		-- nocturnal dreamers too.
		if IsDST then
			-- TODO test night -> day transition to make sure this
			--	isn't buggy! Might not be moddable: need a ref
			--	to the shadowhand Dissipate function but instead
			--	hand.dissipatefn might be nil *and* it contains
			--	a wrapper function rather than a ref to the func
			--	we need! This will be fixed once we implement a
			--	custom hand/arm animation for the deamsnatcher.
			hand:StopWatchingWorldState("daytime", nil)
		else
			hand:RemoveEventCallback("daytime", hand.dissipatefn, GetWorld())
		end

		-- Removing this prevents the shadow arm and hand from being
		-- saved and thus ensures that the above hacks are always
		-- applied.
		if hand.components.knownlocations then
			hand:RemoveComponent("knownlocations")
		end

		hand.Transform:SetPosition(inst.Transform:GetWorldPosition())

		-- Tune sanity loss to account for extended contact
		if hand.components.sanityaura then
			hand.components.sanityaura.aura = -TUNING.SANITYAURA_TINY
		end

		hand.SeekDreamer = function(hand, snatcher, dreamer)
			hand:ClearBufferedAction()
			hand.components.locomotor:Clear()
			hand.arm = SpawnPrefab("shadowhand_arm")
			hand.arm.persists = false
			hand.arm:AddTag("notarget")
			hand.arm:AddTag("notraptrigger")
			hand.arm.Transform:SetPosition(hand.Transform:GetWorldPosition())
			hand.arm:FacePoint(Vector3(dreamer.Transform:GetWorldPosition()))
			hand.arm.components.stretcher:SetStretchTarget(hand)
			hand.components.locomotor.walkspeed = 2
			hand.components.locomotor:SetReachDestinationCallback(function(hand)
				hand.components.locomotor:SetReachDestinationCallback(nil)
				hand.AnimState:PlayAnimation("grab")
				hand.SoundEmitter:KillAllSounds()
				snatcher:PushEvent("onattachdreamer", dreamer)
			end)
			hand.components.locomotor:GoToEntity(dreamer, nil, false)
		end
		hand.Retract = function(hand)
			hand.components.locomotor:Clear()
			hand.components.locomotor.walkspeed = 10 
			hand.AnimState:PlayAnimation("grab_pst")
			hand.SoundEmitter:PlaySound("dontstarve/sanity/shadowhand_creep", "creeping")
			hand.components.locomotor:SetReachDestinationCallback(function(hand)
				hand.components.locomotor:SetReachDestinationCallback(nil)
				hand.SoundEmitter:KillAllSounds()
				hand.arm:Remove()
				hand:Remove()
			end)
			if hand.arm and hand.components.locomotor then
				hand.components.locomotor:GoToEntity(hand.arm, nil, false)
			else
				hand.SoundEmitter:KillAllSounds()
				hand:Remove()
			end
		end
		inst.snatcher_arms[dreamer] = { ["hand"] = hand, ["start"] = nil }
		hand:SeekDreamer(inst, dreamer)
	end

	inst.Detach = function(inst, dreamer)
		local tuple = inst.snatcher_arms[dreamer]
		if not tuple then
			return
		end
		if tuple.start then -- else it never attached
			if inst.attached == 1 then
				-- Last one -- switch back to idle
				inst.AnimState:PushAnimation("snatch_pst", false)
				inst.AnimState:PushAnimation("idle", true)
				-- TODO use light tweener?
				inst.disable_light_fn = function(inst)
					inst:RemoveEventCallback("animover", inst.disable_light_fn)
					inst.Light:Enable(false)
					inst.disable_light_fn = nil
				end
				inst:ListenForEvent("animover", inst.disable_light_fn)
			end
			inst.attached = inst.attached - 1
		end
		local hand = tuple.hand
		if not hand then
			return
		end
		inst.snatcher_arms[dreamer] = nil
		-- TODO could *almost* trigger "startaction" and avoid
		--      writing our own Retract function.
		hand:ClearBufferedAction()
		hand:Retract()

		if IsDST and not TheWorld.ismastersim then
			return
		end
		local duration
		if not tuple.start then
			duration = 0
		else
			duration = GetTime() - tuple.start
		end
		inst:CollectSanity(dreamer, duration)
	end
	inst.CollectSanity = function(inst, dreamer, duration)
	end

	if IsDST then
		inst.entity:SetPristine()
		if not TheWorld.ismastersim then
			return inst
		end
	end

	inst.line = 1
	inst:AddComponent("inspectable")
	if not IsDST then
		inst.components.inspectable:SetDescription(function(inspectme, viewer)
			return ondescribe(inst, viewer)
		end)
	else
		inst.components.inspectable.descriptionfn = ondescribe
	end

	inst:AddComponent("lootdropper")
	inst.insanity = 0
	inst.CollectSanity = function(inst, dreamer, duration)
		if IsDST and not TheWorld.ismastersim then
			return
		end
		if dreamer.components.sanity then
			-- We've already collected the sanity over time.
			-- Stop collecting via the sanity callbacks
			inst:RemoveEventCallback("sanitydelta", dreamer.sanitysuckfn)
			inst:RemoveEventCallback("gosane", dreamer.sanefn)
			inst:RemoveEventCallback("goinsane", dreamer.insanefn)
			dreamer.sanitysuckfn = nil
			dreamer.sanefn = nil
			dreamer.insanefn = nil
		else
			-- NPCs don't have a sanity component. Scale the
			-- insanity accumulated by the duration of sleep.
			-- Divide by the distance to the dream snatcher
			-- much like the sanity component does for entities
			-- with a sanity aura.
			if duration >= (0.8*math.min(TUNING.MANDRAKE_SLEEP_TIME, TUNING.PANFLUTE_SLEEPTIME)) then -- approx 0.25*TUNING.seg_time
				-- The duration threshold reduces the utility
				-- of frequently-woken dreamers. Players that
				-- scheme to put masses of NPCs to sleep must
				-- time it well otherwise their efforts will
				-- not be rewarded at all.
				inst.insanity = inst.insanity + (duration*TUNING.SANITYAURA_TINY/math.max(1, inst:GetDistanceSqToInst(dreamer.inst)))
			end
		end

		-- Roughly speaking, somebody has to go insane to make one
		-- nightmare fuel.
		local INSANITY_THRESH = 100*(1.0 - TUNING.SANITY_BECOME_INSANE_THRESH)

		while inst.insanity >= INSANITY_THRESH do
			inst.insanity = inst.insanity - INSANITY_THRESH
			inst.components.lootdropper:SpawnLootPrefab("nightmarefuel")
		end
		if inst.insanity < 0 then
			inst.insanity = 0
		end
	end

	inst:AddComponent("playerprox")
	local prox = inst.components.playerprox
	prox:SetDist(5,6)
	if IsDST then
		-- Keep a set of players whose cameras are shaking
		inst.shakees = {}
	end
	prox.onnear = onnear
	prox.onfar = onfar
	if IsDST then
		prox:SetPlayerAliveMode(prox.AliveModes.AliveOnly)
		prox:SetTargetMode(prox.TargetModes.AnyPlayer)
	end

	inst:AddComponent("sanityaura")
	inst.components.sanityaura.aura = -TUNING.SANITYAURA_TINY

	inst.OnLoad = onload
	inst.OnSave = onsave

	MakeMediumBurnable(inst)
	MakeLargePropagator(inst)
	MakeSnowCovered(inst) --, 0.1*radius)

	return inst
end

return Prefab("common/dreamsnatcher", fn, assets, prefabs),
	MakePlacer("dreamsnatcher_placer",
			"dreamsnatcher", "dreamsnatcher", "idle")
