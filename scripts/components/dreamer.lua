
local Dreamer = Class(function(self, inst)
	self.inst = inst
	self.dream = nil
	self.snatcher = nil
	-- non-player (sleeper) events
	self.inst:ListenForEvent("onwakeup", function(inst)
		self:StopDreaming()
	end)
	self.inst:ListenForEvent("gotosleep", function(inst)
		self:StartDreaming()
	end)

	if self.inst:HasTag("player") then
		self.await_wake = false
		self.await_sleep = true
		self.inst:ListenForEvent("newstate", function(inst, data)
			local dreamer = inst.components.dreamer
			if dreamer.await_wake and data.statename == "wakeup" then
				dreamer.await_wake = false
				dreamer.await_sleep = true
				dreamer:StopDreaming()
				return
			end
			if dreamer.await_sleep and (data.statename == "bedroll" or data.statename == "tent") then
				dreamer.await_sleep = false
				dreamer.await_wake = true
				-- TODO sync with end of animation
				dreamer:StartDreaming()
				return
			end

			if dreamer.await_sleep then
				if dreamer.inst.sg:HasStateTag("sleeping") then
					if dreamer.inst.sg:HasStateTag("waking") then
						return
					end
					dreamer.await_sleep = false
					dreamer.await_wake = true
					dreamer:StartDreaming()
					return
				end
			end
		end)
	end
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
