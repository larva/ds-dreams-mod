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
		self.dream.Transform:SetPosition(0.8, 2.15, 0.8)
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
	--- TODO initiate link with snatcher
	if self.dream then
		self.dream:Disturb()
	end
end

function Dreamer:StopDreaming()
	if self.dream then
		self.dream:Over()
	end
	if self.snatcher then
		--- TODO initiate unlink with snatcher
		self.snatcher:DropLoot()
	end
	self.dream = nil
	self.snatcher = nil
end

return Dreamer