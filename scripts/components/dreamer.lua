local Dreamer = Class(function(self, inst)
	self.inst = inst
	self.dream = nil
	self.snatcher = nil
	self.await_wake = false
	self.animoverfn = function(inst)
		local dreamer = inst.components.dreamer
		inst:RemoveEventCallback("animover",
					dreamer.animoverfn)
		dreamer:StartDreaming()
		dreamer.await_wake = true
	end

	self.inst:ListenForEvent("onwakeup", function(inst)
		self.await_wake = false
		self:StopDreaming()
	end)

	self.inst:ListenForEvent("gotosleep", function(inst)
		local dreamer = inst.components.dreamer
		if inst.components.sleeper ~= nil then
			inst:ListenForEvent("animover", self.animoverfn)
		else
			dreamer:StartDreaming()
			dreamer.await_wake = true
		end
	end)

	if not self.inst:HasTag("player") then
		return
	end

	self.newstatefn = function(inst, data)
		local dreamer = inst.components.dreamer
		-- Can't check the Tag in the constructor because it's
		-- added by a PrefabPostInit function.
		if not inst:HasTag("DreamSnatcherHACK") then
			inst:RemoveEventCallback("newstate", dreamer.newstatefn)
			dreamer.newstatefn = nil
			return
		end

		local newstate = data.statename
		if dreamer.await_wake and newstate == "wakeup" then
			dreamer.await_wake = false
			inst:PushEvent("onwakeup")
			return
		end
	end
	self.inst:ListenForEvent("newstate", self.newstatefn)
end)

local search_radius = TUNING.SANITY_EFFECT_RANGE
function Dreamer:StartDreaming()
	if not self.dream then
		-- See: components/frostbreather.lua and prefabs/frostbreath.lua
		self.dream = SpawnPrefab("dreaming/dream")
		self.dream.dreamer = self.inst
		self.inst:AddChild(self.dream)

		local height = 0.0
		if self.inst.Physics then
			local caph = math.max(0.2, 2*(self.inst.Physics:GetRadius() or 0.0), (self.inst.Physics:GetHeight() or 0.0))
			height = height + caph
		end

		self.dream.Transform:SetPosition(0.0, height, 0.0)
	end

	if self.snatcher then
		-- Already linked or linking with snatcher
		return
	end
	self.snatcher = GetClosestInstWithTag("dreamsnatcher",
					      self.inst, search_radius)
	if not self.snatcher then
		-- No nearby dreamsnatcher to link with
		return
	end
	self.snatcher:Attach(self.inst)
end

function Dreamer:StopDreaming()
	if self.dream then
		self.dream:Over()
		self.dream = nil
	end

	if self.snatcher then
		self.snatcher:Detach(self.inst)
		self.snatcher = nil
	end
end

return Dreamer
