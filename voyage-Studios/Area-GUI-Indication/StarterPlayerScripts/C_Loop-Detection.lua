
repeat wait() until #game:GetService("Workspace"):WaitForChild("Zones"):GetChildren() > 3

local thng = require(game.ReplicatedStorage.Modules.Region3):FindR3()
local plr = game.Players.LocalPlayer


local Region = thng
local Inside = true
local current = nil
local Name, Image


while wait(0.5) do
	wait()
		if plr and plr.Character then
			wait()
			for _,k in ipairs(Region) do
					wait()
					local Find = workspace:FindPartsInRegion3WithWhiteList(k, plr.Character:GetChildren())
					if #Find > 0 and Inside then
						wait()
						Inside = false
						current = k
						if not plr.PlayerGui.DefaultGui:WaitForChild("Area", 0.01) then
							wait()
							local Search = require(game:GetService("ReplicatedStorage"):WaitForChild("Modules"):FindFirstChild("Anti-Lag")):Search(plr, k, "entered")
						end
						wait()
					elseif #Find <= 0 and not Inside then
						wait()
						if k == current then
							current = nil
							Inside = true
							local Search = require(game:GetService("ReplicatedStorage"):WaitForChild("Modules"):FindFirstChild("Anti-Lag")):Search(plr, k, "left")
						end
					end			
				end
			end
		end