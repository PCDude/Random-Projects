local module = {}
function module:Search(plr, k, mssg)
    
		local thng = require(game.ReplicatedStorage.Modules.Region3)
		local Clone = game:GetService("ReplicatedStorage"):WaitForChild("Area"):Clone()
		local Name = thng.Dict[tostring(k)][1]
		local Image = thng.Dict[tostring(k)][2]
		
		Clone.TextLabel.Text = "You have "..mssg..", "..Name
		Clone.ImageLabel.Image = Image
        Clone.Parent = plr.PlayerGui.DefaultGui
        
		Clone:TweenPosition(UDim2.new(0.362, 0,0.318, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, true)
		
		wait(math.pi)
		Clone:TweenPosition(UDim2.new(0.362, 0,-0.6, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, true)
		wait(1/1)
		
		Clone:Destroy()
end
return module
