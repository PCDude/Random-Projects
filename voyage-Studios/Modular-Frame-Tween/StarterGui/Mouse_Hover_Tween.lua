local gui = {}

GAMEPASSID = {}
MTDict = {}

local Ob = {__type = ""}
local mt = {__index = Ob}

function gui:Open(plr)
Ob[1] = "string"
local self = setmetatable({}, mt)
self.f = "Left"
self.f2 = "Right"
	for _,v in pairs(plr.PlayerGui.Maine.mAINmENU:GetChildren()) do
		for _,k in pairs(v:GetChildren()) do
			if k.Name == self.f and not k:IsA("LocalScript")  then
				k:TweenSize(UDim2.new(0.05,0,0.075,0), "Out", "Quad", 0.75, true)
			elseif k.Name == self.f2 and not k:IsA("LocalScript") then
				k:TweenSizeAndPosition(UDim2.new(0.05,0,0.075,0), UDim2.new(0.95,0,0.925,0), "Out", "Quad", 0.75, true)
			end
		end
	end
	return true
end

function gui:Mouse(plr, PARENT, MOUSEBOOL)
local self 
if MTDict[self] then
	table.remove(MTDict, MTDict[self.Bool])
else
	Ob[1] = "bool"
	self = setmetatable({}, mt)
	self.Bool = true
	table.insert(MTDict, self.Bool)
end
self.f = "Left"
self.f2 = "Right"
--print(PARENT)
	local Frame = plr.PlayerGui.Maine.mAINmENU[PARENT]
	local function Iter(POS, SIZE)
		for _,v in pairs(Frame:GetChildren()) do 
			pcall(function(err)
				if self.Bool == true then
					if v.Name == self.f  then
						v:TweenSize(SIZE, "Out", "Quad", 0.75, true)
					elseif v.Name == self.f2 then
						v:TweenSizeAndPosition(SIZE, POS, "Out", "Quad", 0.75, true)
					else
						--print("Not Correct Value")
					end
				else
					warn('Cant Find Self! Error Code..001')
				end
			end)
		end 
		
	end
	if MOUSEBOOL == true then
		Iter(UDim2.new(0.5,0,0.925,0) , UDim2.new(0.5,0,0.075,0))
	else
		Iter(UDim2.new(0.95,0,0.925,0) , UDim2.new(0.05,0,0.075,0))
	end
end

return gui
