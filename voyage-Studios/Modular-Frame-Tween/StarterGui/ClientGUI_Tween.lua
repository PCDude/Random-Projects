
local plr = game:GetService("Players").LocalPlayer
local module = require(script.Parent.MouseHoverTween):Open(plr)
local SP = script.Parent
local debounce = false
local co 

game:GetService("RunService").RenderStepped:Connect(function()
if debounce == false then
	debounce = true
co = coroutine.create(function()
	for _,v in pairs(SP.mAINmENU:GetChildren()) do
		if v:IsA("TextButton") then
		v.MouseEnter:Connect(function()
			local module = require(script.Parent.MouseHoverTween):Mouse(plr, v.Name, true)
		end)

		v.MouseLeave:Connect(function()
			local module = require(script.Parent.MouseHoverTween):Mouse(plr, v.Name, false)
			end)
		end
	end
	coroutine.yield(co)
end)
coroutine.resume(co)
wait(math.pi*2)
debounce = false
	end
end)
