local module = {}
module.Dict = {}

function module:FindR3()
	_G.table = {}
	for i,v in pairs(workspace.Zones:GetChildren()) do
			
			local pos1, pos2 = v.Position - (v.Size/2), v.Position + (v.Size/2) 
			print(v)
			local val = Region3.new(pos1, pos2)
			module.Dict[tostring(val)] = {v.Name, v.Image.Value}
			table.insert(_G.table, val)
			print(v.Name, v.Image.Value)	
			v:Destroy()

	end
	local tbl = _G.table
	return tbl
end


return module
