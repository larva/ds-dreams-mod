local Dreamer = Class(function(self, inst)
	self.inst = inst
	self.dream = nil
	self.snatcher = nil
	self.inst:ListenForEvent("onwakeup", function(inst)
		self:StopDreaming()
	end)
	self.inst:ListenForEvent("gotosleep", function(inst)
		self:StartDreaming()
	end)
end)

local search_radius = 20
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
