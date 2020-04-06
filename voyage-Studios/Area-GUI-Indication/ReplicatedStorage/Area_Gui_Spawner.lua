local RegionPart = workspace:WaitForChild("Hallow Road")
local Region = Region3.new(RegionPart.Position - (RegionPart.Size/2),RegionPart.Position + (RegionPart.Size/2))
local Player = game:GetService("Players").LocalPlayer
local Char = Player.Character or Player.CharacterAdded:Wait()
local debounce = true

wait()
RegionPart.Transparency = 1
RegionPart.CanCollide = false

while wait(1) do
    local Detect = workspace:FindPartsInRegion3WithWhiteList(Region,Char:GetChildren(),math.huge)
    if #Detect > 0 and debounce then
		    debounce = false
		print("Detected")
		    local clone = game.ReplicatedStorage.TextLabel:Clone()
		if not Player.PlayerGui.DefaultGui:FindFirstChild(clone) then
		        clone.Text = "You Have Entered "..RegionPart.Name
		        clone.Parent = Player.PlayerGui.DefaultGui
		clone:TweenPosition(UDim2.new(0.319, 0,0.27, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, .75, true)
		wait(math.pi)
		clone:TweenPosition(UDim2.new(0.319, 0,-0.4,0), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, .75, true)
		wait(375/100)
		clone:Destroy()
	else
		wait(3)
		clone:TweenPosition(UDim2.new(0.319, 0,-0.4,0), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, .75, true)
		clone:Destroy()
	end
	elseif #Detect <= 0 then
		debounce = true
		print("Not Detected")	
	end
end