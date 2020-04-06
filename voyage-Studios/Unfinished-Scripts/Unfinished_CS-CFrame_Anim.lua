local plr = game:GetService("Players").LocalPlayer
repeat wait() until plr.Character
local Char = plr.Character
local Humanoid = Char:WaitForChild('Humanoid', 2)
local Mouse = plr:GetMouse()
local ANGLES = CFrame.Angles
local CF = CFrame.new
local VT = Vector3.new
local MR = math.random
local MRA = math.rad
local SIN = math.sin
local COS = math.cos
local ASIN = math.asin
local ACOS = math.acos
local FLOOR = math.floor
local CEIL = math.ceil
local CFM = CFrame.fromMatrix
local EULARCF = CFrame.fromEulerAnglesXYZ
local EUALRVT = CFrame.fromEulerAnglesYXZ
local SQRT = math.sqrt
local FS = 1/60
local IT = Instance.new
local UIS = game:GetService("UserInputService")
local SINE = 0

Animation_Speed = 1.5
Player_Size = 1
Cooldown = false
IT = Instance.new
CF = CFrame.new
VT = Vector3.new
RAD = math.rad
C3 = Color3.new
UD2 = UDim2.new
BRICKC = BrickColor.new
ANGLES = CFrame.Angles
EULER = CFrame.fromEulerAnglesXYZ
COS = math.cos
ACOS = math.acos
SIN = math.sin
ASIN = math.asin
ABS = math.abs
MRANDOM = math.random
FLOOR = math.floor
ATTACK = false
local MUTEX = false
local ROOTC0 = CF(0, 0, 0) * ANGLES(RAD(-90), RAD(0), RAD(180))
local NECKC0 = CF(0, 1, 0) * ANGLES(RAD(-90), RAD(0), RAD(180))
local RIGHTSHOULDERC0 = CF(-0.5, 0, 0) * ANGLES(RAD(0), RAD(90), RAD(0))
local LEFTSHOULDERC0 = CF(0.5, 0, 0) * ANGLES(RAD(0), RAD(-90), RAD(0))
local TEXTAVAL = false
local SphereVectorReturn
local surfacegui; local textlabel
--local PresetPos = {Vector3.new(-4.305, 4.753, 9.89), Vector3.new(-3.885, 4.753, 9.89)}



if Humanoid.RigType == Enum.HumanoidRigType.R15 then
	 Head = Char:WaitForChild("Head", .5)
	 Root = Char:WaitForChild("HumanoidRootPart", .5)
	 Torso = Char:WaitForChild("UpperTorso", .5)
	 RightLeg = Char:WaitForChild("RightUpperLeg", .5)
	 RightArm = Char:WaitForChild("RightUpperArm", .5)
	 LeftLeg = Char:WaitForChild("LeftUpperLeg", .5)
	 LeftArm = Char:WaitForChild("LeftUpperArm", .5)
	 Neck = Head:FindFirstChild("Neck")
	 RootJoint  = Torso:FindFirstChild("Waist")
	 RightShoulder = RightArm:FindFirstChild("RightShoulder")
	 RightHip = RightLeg:FindFirstChild("RightHip")
	 LeftShoulder = LeftArm:FindFirstChild("LeftShoulder")
	 LeftHip = LeftLeg:FindFirstChild("LeftHip")
else
	RootPart = Char["HumanoidRootPart"]
	Torso = Char["Torso"]
	Head = Char["Head"]
	RightArm = Char["Right Arm"]
	LeftArm = Char["Left Arm"]
	RightLeg = Char["Right Leg"]
	LeftLeg = Char["Left Leg"]
	RootJoint = pcall(function() RootJoint = RootPart["RootJoint"] MUTEX = true end)
	if not MUTEX then
		RootJoint = RootPart["Root Hip"]
	else
		RootJoint = RootPart["RootJoint"]
	end
	Neck = Torso["Neck"]
	RightShoulder = Torso["Right Shoulder"]
	LeftShoulder = Torso["Left Shoulder"]
	RightHip = Torso["Right Hip"]
	LeftHip = Torso["Left Hip"]
end



function DestoryAccess()
	for _,v in pairs(Char:GetChildren()) do
		if v:IsA("Accessory") then
			v:Destroy()
		elseif v:IsA("Part") and v.Name == Char.Head.Name then
		for _,k in pairs(v:GetChildren()) do
				if k:IsA("Decal") then
					k:Destroy()
				end
			end
		end
	end
	pcall(function()
		if Char.Shirt and Char.Pants then
			Char.Shirt.ShirtTemplate = "http://www.roblox.com/asset/?id=2956188500"
			Char.Pants.PantsTemplate = "http://www.roblox.com/asset/?id=2949169917"
		else
			IT("Shirt", Char); IT("Pants", Char)
			Char.Shirt.ShirtTemplate = "http://www.roblox.com/asset/?id=2956188500"
			Char.Pants.PantsTemplate = "http://www.roblox.com/asset/?id=2949169917"
		end
		if Head.Mesh then
			Head.Mesh:Destroy()
			local newmesh = IT("SpecialMesh", Head)
			newmesh.Scale = newmesh.Scale + VT(0.2, 0.2, 0.2)
		end
	end)
end

function CreateWeld(name, part0, part1, c0, c1, parent)
	local weld = Instance.new("Weld")
	weld.Parent = part0
	weld.Part0 = part0
	weld.Part1 = part1
	pcall(function() weld.C0 = c0 end);
	pcall(function() weld.C1 = c1 end);
	weld.Name = name
	return weld
end

function CreateMotor(name, part0, part1, c0, c1, parent)
	local motor = Instance.new("Motor6D")
	motor.Parent = part0
	motor.Part0 = part0
	motor.Part1 = part1
	pcall(function() motor.C0 = c0 end);
	pcall(function() motor.C1 = c1 end);
	motor.Name = name
	return motor
end

function QuaternionFromCFrame(cf)
	local mx, my, mz, m00, m01, m02, m10, m11, m12, m20, m21, m22 = cf:components()
	local trace = m00 + m11 + m22
	--print(m00, m01, m02, m20, m10)
	if trace > 0 then 
		local s = math.sqrt(1 + trace)
		local recip = 0.5 / s
		return (m21 - m12) * recip, (m02 - m20) * recip, (m10 - m01) * recip, s * 0.5
	else
		local i = 0
		if m11 > m00 then
			i = 1
		end
		if m22 > (i == 0 and m00 or m11) then
			i = 2
		end
		if i == 0 then
			local s = math.sqrt(m00 - m11 - m22 + 1)
			local recip = 0.5 / s
			return 0.5 * s, (m10 + m01) * recip, (m20 + m02) * recip, (m21 - m12) * recip
		elseif i == 1 then
			local s = math.sqrt(m11 - m22 - m00 + 1)
			local recip = 0.5 / s
			return (m01 - m10) * recip, 0.5 * s, (m21 + m12) * recip, (m02 + m20) * recip
		elseif i == 2 then
			local s = math.sqrt(m22 - m00 - m11 + 1)
			local recip = 0.5 / s 
			return (m02 + m20) * recip, (m12 + m21) * recip, 0.5 * s, (m10 - m01) * recip
		end
	end
end
 
function QuaternionToCFrame(px, py, pz, x, y, z, w)
	return CFrame.new(px,py,pz,x,y,z,w)
end
 
function QuaternionSlerp(a, b, t)
	local cosTheta = a[1] * b[1] + a[2] * b[2] + a[3] * b[3] + a[4] * b[4]
	local startInterp, finishInterp;
	if cosTheta >= 0.0001 then
		if (1 - cosTheta) > 0.0001 then
			local theta = ACOS(cosTheta)
			local invSinTheta = 1 / SIN(theta)
			startInterp = SIN((1 - t) * theta) * invSinTheta
			finishInterp = SIN(t * theta) * invSinTheta
		else
			startInterp = 1 - t
			finishInterp = t
		end
	else
		if (1 + cosTheta) > 0.0001 then
			local theta = ACOS(-cosTheta)
			local invSinTheta = 1 / SIN(theta)
			startInterp = SIN((t - 1) * theta) * invSinTheta
			finishInterp = SIN(t * theta) * invSinTheta
		else
			startInterp = t - 1
			finishInterp = t
		end
	end
	return a[1] * startInterp + b[1] * finishInterp, a[2] * startInterp + b[2] * finishInterp, a[3] * startInterp + b[3] * finishInterp, a[4] * startInterp + b[4] * finishInterp
end

function Clerp(a, b, t)
	local qa = {QuaternionFromCFrame(a)}
	local qb = {QuaternionFromCFrame(b)}
	local ax, ay, az = a.x, a.y, a.z
	local bx, by, bz = b.x, b.y, b.z
	local _t = 1 - t
	return QuaternionToCFrame(_t * ax + t * bx, _t * ay + t * by, _t * az + t * bz, QuaternionSlerp(qa, qb, t))
end


function Slerp(p0, p1, theta)
	p0:Lerp(p1, theta)
end



function SSWait(NUMBER)
	if NUMBER == 0 or NUMBER == nil then script.HeartBeat.Event:Wait() else 
		for i = 1, NUMBER do script.HeartBeat.Event:Wait() end; end
end


function CreateLabel(TC, TSC, SIZEX, SIZEY, TXT, TT, PARENT, TXTS)
	print("safsafsdf")
	if not Head:WaitForChild("TextDisplay", .5) and TEXTAVAL == true then
		print("safsgasgag")
		surfacegui = IT("BillboardGui")
		surfacegui.Name = "TextDisplay"
		surfacegui.Adornee = Head
		surfacegui.Parent = Head
		surfacegui.Size = UDim2.new(4,0,1,0)
		surfacegui.StudsOffset = Vector3.new(0,1,1)
	elseif not PARENT:WaitForChild("TextDisplay", .5) then
		print("safsadffd")
		surfacegui = IT("BillboardGui")
		surfacegui.Name = "TextDisplay"
		surfacegui.Adornee = PARENT
		surfacegui.Parent = PARENT
		surfacegui.Size = UDim2.new(4,0,1,0)
		surfacegui.StudsOffset = Vector3.new(0,1,1)	
	elseif Head:WaitForChild("TextDisplay", .5) then
		print("adsfsdfadfsdf")
		pcall(function() for i,v in pairs(Head:FindFirstChild("TextDisplay"):GetChildren()) do v:Destroy() end; end)
	end
	pcall(function()
	print("asfsdafdasfadf")
	textlabel = IT("TextLabel")
	textlabel.BackgroundTransparency = TT[1]
	textlabel.TextTransparency = TT[2]
	textlabel.TextStrokeTransparency = TT[3]
	textlabel.Size = UDim2.new(SIZEX,0,SIZEY,0)
	textlabel.TextColor3 = TC
	textlabel.TextStrokeColor3 = TSC
	textlabel.Font = "Fantasy"
	if typeof(TXT) ~= "string" then TXT = tostring(TXT) end; 
	textlabel.TextSize = TXTS
	textlabel.Parent = PARENT:WaitForChild("TextDisplay", .5)
	textlabel.TextScaled = true
	for i = 1, string.len(TXT),1 do
		wait()
		textlabel.Text = string.sub(TXT,1,i)
	end
	end)
	TEXTAVAL = false
	return textlabel
end

function CreateSound(ID, NAME, PARENT, LOOPED, VOL, DIST, EMITTER, ROLL)
	for _,v in pairs(PARENT) do if v:IsA("Sound") then return end; end
	local sound = IT("Sound")
	sound.SoundId = ID
	sound.Name = NAME
	sound.RollOffMode = ROLL
	sound.EmitterSize = EMITTER
	sound.MaxDistance = DIST
	sound.Volume = VOL
	sound.Looped = LOOPED
	sound.Parent = PARENT
	return sound
end


function Chat(TXT, waitt)
	TEXTAVAL = true
	local textlabel = CreateLabel(Color3.fromRGB(255,255,255), Color3.fromRGB(0,0,0), 1,1, TXT, {1, 0, 0}, Head, 30)
	SSWait(waitt)
	textlabel:Destroy()
end

function CreatePart(MATERIAL, SIZE, PARENT, TRANSPARENCY, COLLIDE, LOCKED, ANCHORED, COLOR, FORMFACTOR, NAME, REFLECTANCE, TYPE)
	local newpart = script[TYPE]:Clone()
	newpart.formFactor = FORMFACTOR
	newpart.Material = MATERIAL
	newpart.Size = SIZE
	newpart.Transparency = TRANSPARENCY
	newpart.CanCollide = COLLIDE
	newpart.Anchored = ANCHORED
	newpart.BrickColor = BrickColor.new(COLOR)
	newpart.Reflectance = REFLECTANCE
	newpart.Name = NAME
	newpart:BreakJoints()
	newpart.Parent = PARENT
	return newpart
end

function CreateCube(SIZE, WAITT, PART, OFFSET, COLOR, BOOL)
	print("asfsadfsf")
	local Colors = {"Lilly white", "Ghost grey", "Mid gray", "Medium stone grey", "Dark stone grey", "Really black"}
	COLOR = Colors[MR(1,6)]
	print(COLOR)
	local wave = CreatePart("Neon", Vector3.new(SIZE,SIZE,SIZE), workspace, 0, false, true, true, COLOR, 3, "Effect", 0.5, "Cube")
--	local mesh = IT("BlockMesh", workspace)
	wave.CFrame = CF(PART) * CF(0,OFFSET,0) * ANGLES(MRA(0), MRA(0), MRA(0))
	coroutine.resume(coroutine.create(function(PART)	
	for i = 1, WAITT, 0.5/Animation_Speed*math.pi/2 do
		SSWait()
		print("asfsadfsaf")
		--mesh.Scale = mesh.Scale + VT(SIZE/15, SIZE/15, SIZE/15)
		if BOOL then
			wave.Size = wave.Size + VT(SIZE/15, SIZE/15, SIZE/15)
		else
			wave.Size = wave.Size - VT(SIZE/15, SIZE/15, SIZE/15)
		end
		wave.CFrame = CF(wave.Position) * ANGLES(MRA(MR(-360,360)), MRA(MR(-360,360)), MRA(MR(-360,360)))
		wave.Transparency = wave.Transparency + 1/WAITT
		if wave.Transparency > 0.99 then
			wave:Destroy()
			end
		end
	end))
end


function CreateWave(INAIR, SIZE, ROTATE, ROTATEDIR, WAITT, PART, OFFSET, COLOR, BOOL)
	local Colors = COLOR
	local COLOR = Colors[MR(1,#Colors)]
	local wave = CreatePart("Neon", VT(0,0,0), workspace, 0, false, true, true, COLOR, 3, "Effect", 0, "Cube")
	local mesh = IT("SpecialMesh", wave)
	mesh.Scale = VT(SIZE ,SIZE, SIZE)
	mesh.Offset = VT(0, 0, -SIZE/8)
	mesh.MeshId = "http://www.roblox.com/asset/?id=20329976"
	mesh.MeshType = "FileMesh"
	if BOOL then
		wave.CFrame = CF(PART.Position) * CF(0,OFFSET,0) * ANGLES(MRA(INAIR), MRA(0), MRA(0))
	else 
		wave.CFrame = CF(PART) * CF(0,OFFSET,0) * ANGLES(MRA(INAIR), MRA(0), MRA(0))		
	end
	coroutine.resume(coroutine.create(function()
		for i = 1, WAITT, 0.2/Animation_Speed do
			SSWait()
			mesh.Scale = mesh.Scale + VT(SIZE/5, 0.1, SIZE/5)
			mesh.Offset = VT(0,0,-mesh.Scale.X/8)
			if ROTATE then
				wave.CFrame = wave.CFrame * CFrame.fromEulerAnglesXYZ(0, ROTATEDIR, 0)
			end
			wave.Transparency = wave.Transparency + 1/WAITT
			if wave.Transparency > 0.99 then
				wave:Destroy()
			end
		end
	end))
end

function CreateSphere(SIZE, WAITT, PART, OFFSET, COLOR, BOOL)
	local Colors = COLOR
	COLOR = Colors[MR(1,#Colors)]
	print(COLOR)
	local sphere = CreatePart("Neon", Vector3.new(SIZE, SIZE, SIZE), workspace, 0, false, true, true, COLOR, 3, "Effect", 0, "Sphere")
	if BOOL == nil then
		sphere.CFrame = CF(PART.Position) * CF(0,OFFSET,0) * ANGLES(MRA(0), MRA(0), MRA(0))
	elseif BOOL == true then
		PART = RootPart.Position
		sphere.CFrame = CF(PART) * CF(0,0,0) * ANGLES(MRA(0), MRA(0), MRA(0))	
	elseif BOOL == false then
		sphere.CFrame = CF(PART) * CF(0,0,0) * ANGLES(MRA(0), MRA(0), MRA(0))		
	end
				
	coroutine.resume(coroutine.create(function()
		for i = 1, WAITT, 0.2/Animation_Speed do
			SSWait()
			sphere.Size = sphere.Size + VT(0.5,0.5,0.5)
			sphere.CFrame = CF(sphere.Position) * ANGLES(MRA(0), MRA(0), MRA(0))
			sphere.Transparency = sphere.Transparency + 1/WAITT
			if BOOL then
				sphere.CFrame = Clerp(sphere.CFrame, CF(Mouse.Hit.X, 0, Mouse.Hit.Z) * ANGLES(0,0,0), 0.2/Animation_Speed)
				LastPos = sphere.CFrame
			end
			if sphere.Transparency > 0.99 then
				sphere:Destroy()
			end
		end
	end))
	return LastPos
end

function Turnto(POS, PART)
	pcall(function()PART.CFrame = CF(PART.Position, VT(POS.X, PART.Position.Y, POS.Z)) end);
end

function CallMultiple(FUNCNAME, TIMES, WAITT, ...)
	local FuncReturn;
		for i = 0, TIMES, 1 do
			if i > 0 then
				SSWait(WAITT)
			end
			FuncReturn = FUNCNAME(...)

		end
	return FuncReturn
end

function CreateDamage(DMG, PARENT, NAME)
	local Label = CreateLabel(Color3.fromRGB(255,255,255), Color3.fromRGB(0,0,0), 1, 1, NAME..", Has Taken: "..DMG.." Damage", {1,0,0,0}, PARENT, 20)
	return Label
end

function CallMutipleDiff(PART)
	coroutine.resume(coroutine.create(function()CallMultiple(CreateSphere,20, 15, 15, 64, PART, 0, {"White", "Black"}, false)end))
	coroutine.resume(coroutine.create(function()CallMultiple(CreateCube, 20, 15, 15, 64, PART, 0, "Really red", true)end))
	coroutine.resume(coroutine.create(function()CallMultiple(CreateWave, 20, 15, 0, 19, true, -00.2, 34, PART, -1, {"White", "Black", "Mid gray"}, false)end))
	coroutine.resume(coroutine.create(function()CallMultiple(CreateWave, 20, 15, 0, 19, true, -00.2, 34, PART, -1, {"White", "Black", "Mid gray"}, false)end))
	return true
end

function DealDamage(DMG, CHAR, BUFF)
	local function Crit(NUM)
		NUM = math.abs(NUM)
		local CritDmg = BUFF*2
		local Def = CHAR.Humanoid.Health/100
		local Crit = NUM * CritDmg/Def
		return Crit
	end
	local humanoid = CHAR:WaitForChild("Humanoid", .5)
	if humanoid then
		local AMT = Crit(DMG)
		humanoid:TakeDamage(AMT)
		return AMT
	end
end

function killnearest(position,range)
	for i,v in ipairs(workspace:GetChildren()) do
	local body = v:GetChildren()
		for part = 1, #body do
			if((body[part].ClassName == "Part" or body[part].ClassName == "MeshPart") and v ~= Char) then
				if(body[part].Position - position).Magnitude < range then
					if v.ClassName == "Model" then
						v:BreakJoints()
					end
				end
			end
		end
	end
end



HB = Instance.new("BindableEvent", script)
HB.Name = "HeartBeat"
local tf = 0
local frame = FS
local allowframeloss = false
local tossremainder = false
local lastframe = tick()
script.HeartBeat:Fire()

game:GetService("RunService").Heartbeat:Connect(function(s, p)
	tf = tf + s
	if tf >= frame then
		if allowframeloss then
			script.HeartBeat:Fire()
			lastframe = tick()
		else
			for i = 1, math.floor(tf / frame) do
				script.HeartBeat:Fire()
			end
			lastframe = tick()
		end
		if tossremainder then
			tf = 0
		else
			tf = tf - frame * math.floor(tf / frame)
		end
	end	
end)


local WALKSPEEDVALUE = 6 / (Humanoid.WalkSpeed / 16)
local OldC = {RootJoint.C0, Neck.C0, LeftShoulder.C0, RightShoulder.C0, RightHip.C0, LeftHip.C0}


function LeftPunch()
if ATTACK == false then
		ATTACK = true
	for i=0, 0.5, 0.1 / Animation_Speed do
		wait()
		--RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 * Player_Size, 0 * Player_Size, -0.2 * Player_Size + 0.05 * COS(SINE / 12) * Player_Size) * ANGLES(RAD(0), RAD(0), RAD(-25)), 0.15 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0 * Player_Size, 0 * Player_Size, 0 + ((1 * Player_Size) - 1)) * ANGLES(RAD(5 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(15)), 0.15 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5 * Player_Size, 0.5 * Player_Size, 0 * Player_Size) * ANGLES(RAD(90), RAD(0), RAD(-90)) * LEFTSHOULDERC0, 0.5 / Animation_Speed)
		--RightShoulder.C0 = Clerp(RightShoulder.C0, CF(0 * Player_Size, 0 * Player_Size, 0 * Player_Size) * ANGLES(RAD(0), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 0 / Animation_Speed)
		--RightHip.C0 = Clerp(RightHip.C0, CF(1 * Player_Size, -0.8 * Player_Size - 0.05 * COS(SINE / 12) * Player_Size, -0.2 * Player_Size) * ANGLES(RAD(0), RAD(95), RAD(0)) * ANGLES(RAD(-5), RAD(0), RAD(-2.5)), 0.15 / Animation_Speed)
		--LeftHip.C0 = Clerp(LeftHip.C0, CF(-1 * Player_Size, -0.8 * Player_Size - 0.05 * COS(SINE / 12) * Player_Size, -0.2 * Player_Size) * ANGLES(RAD(-15), RAD(-75), RAD(0)) * ANGLES(RAD(-7.5), RAD(0), RAD(-15)), 0.15 / Animation_Speed)
	end

	local connection
	local HIT = nil
	local mutex = false
	local Torso2
	if Cooldown == false then Cooldown = true else return nil end;
	connection = LeftArm.Touched:Connect(function(blow) 
	   if blow.Parent:FindFirstChild("Humanoid") and blow.Parent.Name ~= Char.Name and mutex == false 
		then mutex = true print(blow.Parent) HIT = true 
			Torso2 = blow.Parent:FindFirstChild("UpperTorso") or blow.Parent:FindFirstChild("Torso")
			CallMultiple(CreateCube, 3, 8, 5, 20, Torso.Position, 0, "Blue") 
			local DMG = DealDamage(MR(10,15), blow.Parent, 1) 
			local TDMG = CreateDamage(DMG, Torso.Parent.Head, Torso.Parent.Name)
			TDMG:Destroy()
			print(Torso)
			--Turnto(RootPart.Position, Torso)
			--Turnto(Torso.Position, RootPart)
			else connection:disconnect() end;
	end)

	for i=0, 1, 0.1 / Animation_Speed do
        wait()
     --   RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 * Player_Size, 0 * Player_Size, -0.2 * Player_Size + 0.05 * COS(SINE / 12) * Player_Size) * ANGLES(RAD(0), RAD(0), RAD(55)), 0.15 / Animation_Speed)
	--	Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0 * Player_Size, 0 * Player_Size, 0 + ((1 * Player_Size) - 1)) * ANGLES(RAD(5 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(-25)), 0.45 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5 * Player_Size, 0.5 * Player_Size, 0 * Player_Size) * ANGLES(RAD(60), RAD(0), RAD(25)) * LEFTSHOULDERC0, 0.5 / Animation_Speed)
	--	RightShoulder.C0 = Clerp(RightShoulder.C0, CF(0 * Player_Size, 0 * Player_Size, 0 * Player_Size) * ANGLES(RAD(0), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 0 / Animation_Speed)
	--	RightHip.C0 = Clerp(aRightHip.C0, CF(1 * Player_Size, -0.8 * Player_Size - 0.05 * COS(SINE / 12) * Player_Size, -0.2 * Player_Size) * ANGLES(RAD(0), RAD(95), RAD(0)) * ANGLES(RAD(-5), RAD(0), RAD(-2.5)), 0.15 / Animation_Speed)
	--	LeftHip.C0 = Clerp(LeftHip.C0, CF(-1 * Player_Size, -0.8 * Player_Size - 0.05 * COS(SINE / 12) * Player_Size, -0.2 * Player_Size) * ANGLES(RAD(-35), RAD(-75), RAD(0)) * ANGLES(RAD(-7.5), RAD(0), RAD(-15)), 0.15 / Animation_Speed)
		if HIT == true then
			break
		end
	end
	
	if HIT ~= nil then
		Head.Eye.Material = "Neon"
		Head.Eye.BrickColor = BrickColor.new("Really red")
		Head.Eye2.Material = "Neon"
		Head.Eye2.BrickColor = BrickColor.new("Really red")
			Turnto(RootPart.Position, Torso2)
			Turnto(Torso2.Position, RootPart)
		Chat("Left...",0)
		--RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.3 * Player_Size, -0.15 * Player_Size, 0.5 * Player_Size) * ANGLES(MRA(-40), MRA(-90), MRA(-100)) * RIGHTSHOULDERC0, 0.15/Animation_Speed)
		for i=0, 1, 0.1/Animation_Speed do
			wait()
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5 * Player_Size, 0.5 * Player_Size, -0.2 * Player_Size ) * ANGLES(RAD(120), RAD(360), RAD(40)) * LEFTSHOULDERC0, 0.99 / Animation_Speed)			--LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5 * Player_Size, 0.5 * Player_Size, -0.2 * Player_Size ) * ANGLES(RAD(13), RAD(-28.9), RAD(-15)) * LEFTSHOULDERC0, 0.15 / Animation_Speed
			--RootJoint.C0 = Clerp(RootJoint.C0, CF(0 * Player_Size,0 * Player_Size ,0.2 * Player_Size + 0.05 * COS(0) * Player_Size) * ANGLES(MRA(-89.9),MRA(0),MRA(-205)), 0.99/Animation_Speed) -- -89.9, 0, -70  
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5 * Player_Size, 0.5 * Player_Size, -0.2 * Player_Size) * ANGLES(MRA(140), MRA(360), MRA(-40)) * RIGHTSHOULDERC0, 0.99/Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1 * Player_Size, -0.8 * Player_Size - 0.05 * COS(SINE / 12) * Player_Size, -0.2 * Player_Size) * ANGLES(RAD(0), RAD(95), RAD(0)) * ANGLES(RAD(-5), RAD(0), RAD(-2.5)), 0.99 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1 * Player_Size, -0.8 * Player_Size - 0.05 * COS(SINE / 12) * Player_Size, -0.2 * Player_Size) * ANGLES(RAD(-35), RAD(-75), RAD(0)) * ANGLES(RAD(-7.5), RAD(0), RAD(-15)), 0.99 / Animation_Speed)		
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0 * Player_Size, 0 * Player_Size, 0 + ((1 * Player_Size) - 1)) * ANGLES(RAD( 0--[[5 - 4 * SIN(SINE / 12)]]), RAD(350), RAD(15)), 0.15 / Animation_Speed)	
			end
		
--	for i=0,1,0.1/Animation_Speed do
			--wait()			
			--RootJoint.C0 = Clerp(RootJoint.C0, CF(0 * Player_Size,0 * Player_Size ,0.2 * Player_Size + 0.15 * COS(0) * Player_Size) * ANGLES(MRA(-89.9),MRA(0),MRA(-205)), 0.99/Animation_Speed)
			--RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5 * Player_Size, 0.5 * Player_Size, 0.5 * Player_Size) * ANGLES(MRA(120), MRA(0), MRA(0)) * RIGHTSHOULDERC0, 0.5/Animation_Speed)
			--RightHip.C0 = Clerp(RightHip.C0, OldC[5] * CF(0,0,0) * ANGLES(0,0,0), 0.15/Animation_Speed)
			--LeftHip.C0 = Clerp(LeftHip.C0, OldC[6] * CF(0,0,0) * ANGLES(0,0,0), 0.15/Animation_Speed)
--end

coroutine.resume(coroutine.create(function()
	for i = 0,1,0.2/Animation_Speed do
		wait()
		RootJoint.C0 = Clerp(RootJoint.C0, CF(0 * Player_Size, 0 * Player_Size, 0.2 * Player_Size + 0 * COS(SINE/12) * Player_Size) * ANGLES(MRA(-89.9), MRA(0), MRA(200)), 0.85/Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5 * Player_Size, 0.5 * Player_Size, 0.4 * Player_Size) * ANGLES(MRA(100), MRA(360), MRA(25)) * LEFTSHOULDERC0, 0.85/Animation_Speed)
	end
end))
wait(0.4)
	for i =0,1,0.1/Animation_Speed do
		wait()
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.7 * Player_Size, 0.5 * Player_Size, 0 * Player_Size) * ANGLES(MRA(100), MRA(360), MRA(-65)) * LEFTSHOULDERC0, 0.85/Animation_Speed)
		RootJoint.C0 = Clerp(RootJoint.C0, CF(0 * Player_Size,0 * Player_Size ,0.2 * Player_Size + -0.69 * COS(10) * Player_Size) * ANGLES(MRA(-89.9),MRA(350),MRA(-265)), 0.85/Animation_Speed)
	end
		--[[Chat("Punch!",0)
		CallMultiple(CreateSphere, 3, 2, 5, 10, Torso, 0, {"Dark orange", "Bright orange", "Really red"}) 
		local DMG = DealDamage(MR(30,35), Torso.Parent, 1) 
		local TDMG = CreateDamage(DMG, Torso.Parent.Head, Torso.Parent.Name)
		TDMG:Destroy()
		Torso.Parent:BreakJoints()
		]]
	for i =0,1,0.1/Animation_Speed do
		wait()
		RootJoint.C0 = Clerp(RootJoint.C0, CF(0 * Player_Size, 0 * Player_Size, 0.2 * Player_Size + 0 * COS(SINE/12) * Player_Size) * ANGLES(MRA(-89.9), MRA(0), MRA(-180)), 0.85/Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5 * Player_Size, 0.5 * Player_Size, -0.2 * Player_Size ) * ANGLES(RAD(120), RAD(360), RAD(40)) * LEFTSHOULDERC0, 0.99 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5 * Player_Size, 0.5 * Player_Size, -0.2 * Player_Size) * ANGLES(MRA(135), MRA(360), MRA(-40)) * RIGHTSHOULDERC0, 0.99 / Animation_Speed)
		--LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25 * Player_Size, 0.5 * Player_Size, -0.2 * Player_Size) * ANGLES(MRA(125), MRA(360), MRA(25)) * LEFTSHOULDERC0, 0.85/Animation_Speed)
	end
	--[[for i =0,1,0.1/Animation_Speed do
		wait()
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.65 * Player_Size, 0.5 * Player_Size, 0.2 * Player_Size) * ANGLES(MRA(-325), MRA(-360), MRA(30)) * LEFTSHOULDERC0, 1.1/Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.65 * Player_Size, 0.5 * Player_Size, 0.2 * Player_Size) * ANGLES(MRA(400), MRA(10), MRA(-30)) * RIGHTSHOULDERC0, 1.1/Animation_Speed)
	end]]
	
	
	for i =0,1,0.1/Animation_Speed do
		wait()
		--LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5 * Player_Size, 0.5 * Player_Size, -0.2 * Player_Size ) * ANGLES(RAD(120), RAD(360), RAD(40)) * LEFTSHOULDERC0, 0.99 / Animation_Speed)
		--RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5 * Player_Size, 0.5 * Player_Size, -0.2 * Player_Size) * ANGLES(MRA(135), MRA(360), MRA(-40)) * RIGHTSHOULDERC0, 0.99 / Animation_Speed)
	end
		
		--[[for i =0,1,0.1/Animation_Speed do
			wait()
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.3 * Player_Size, 0.5 * Player_Size, -0.9 * Player_Size) * ANGLES(MRA(120), MRA(0), MRA(-55)) * RIGHTSHOULDERC0, 0.5/Animation_Speed)
		end
		]]
		
		--[[
		for i =0, 1, 0.1/Animation_Speed do
			wait()
			RootJoint.C0 = Clerp(RootJoint.C0, CF(0 * Player_Size, 0 * Player_Size, 0.2 * Player_Size + 0.05 * COS(SINE/12) * Player_Size) * ANGLES(MRA(-89.9), MRA(0), MRA(-70)), 0.15/Animation_Speed) -- -89.9, 0, -70  
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.3 * Player_Size, 0.5 * Player_Size, 0.5 * Player_Size) * ANGLES(MRA(70), MRA(0), MRA(100)) * RIGHTSHOULDERC0, 0.15/Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5 * Player_Size, 0.5 * Player_Size, -0.2 * Player_Size ) * ANGLES(RAD(180), RAD(360), RAD(40)) * LEFTSHOULDERC0, 0.15 / Animation_Speed)			
		end
		]]

		
		end
--[[	for i =0,1,0.1/Animation_Speed do
		wait()
		RootJoint.C0 = Clerp(RootJoint.C0, OldC[1]* CF(0,0,0) * ANGLES(0,0,0), 0.15/Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, OldC[2] * CF(0,0,0) * ANGLES(0,0,0), 0.15/Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, OldC[4] * CF(0,0,0) * ANGLES(0,0,0), 0.15/Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, OldC[3]* CF(0,0,0) * ANGLES(0,0,0), 0.15/Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, OldC[5]* CF(0,0,0) * ANGLES(0,0,0), 0.15/Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, OldC[6]* CF(0,0,0) * ANGLES(0,0,0), 0.15/Animation_Speed)
	end
]]
--[[	for i =0,1,0.1/Animation_Speed do
		wait()
		RootJoint.C0 = Clerp(RootJoint.C0, OldC[1], 0.15/Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, OldC[2], 0.15/Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, OldC[4], 0.15/Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, OldC[3], 0.15/Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, OldC[5], 0.15/Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, OldC[6], 0.15/Animation_Speed)
	end
	for i =0,1,0.1/Animation_Speed do
		wait()
		RootJoint.C0 = Clerp(RootJoint.C0, OldC[1], 0.15/Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, OldC[2], 0.15/Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, OldC[4], 0.15/Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, OldC[3], 0.15/Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, OldC[5], 0.15/Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, OldC[6], 0.15/Animation_Speed)
	end]]
wait()
connection:disconnect()
	end
ATTACK = false
end

function RightPunch()
if ATTACK == false then
		ATTACK = true
	for i=0, 0.5, 0.1 / Animation_Speed do
		wait()
		--RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 * Player_Size, 0 * Player_Size, -0.2 * Player_Size + 0.05 * COS(SINE / 12) * Player_Size) * ANGLES(RAD(0), RAD(0), RAD(-25)), 0.15 / Animation_Speed)
		--Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0 * Player_Size, 0 * Player_Size, 0 + ((1 * Player_Size) - 1)) * ANGLES(RAD(5 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(15)), 0.15 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5 * Player_Size, 0.5 * Player_Size, 0 * Player_Size) * ANGLES(RAD(90), RAD(0), RAD(90)) * RIGHTSHOULDERC0, 0.15 / Animation_Speed)
		--RightShoulder.C0 = Clerp(RightShoulder.C0, CF(0 * Player_Size, 0 * Player_Size, 0 * Player_Size) * ANGLES(RAD(0), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 0 / Animation_Speed)
		--RightHip.C0 = Clerp(RightHip.C0, CF(1 * Player_Size, -0.8 * Player_Size - 0.05 * COS(SINE / 12) * Player_Size, -0.2 * Player_Size) * ANGLES(RAD(0), RAD(95), RAD(0)) * ANGLES(RAD(-5), RAD(0), RAD(-2.5)), 0.15 / Animation_Speed)
		--LeftHip.C0 = Clerp(LeftHip.C0, CF(-1 * Player_Size, -0.8 * Player_Size - 0.05 * COS(SINE / 12) * Player_Size, -0.2 * Player_Size) * ANGLES(RAD(-15), RAD(-75), RAD(0)) * ANGLES(RAD(-7.5), RAD(0), RAD(-15)), 0.15 / Animation_Speed)
	end

	local connection
	local HIT = nil
	local mutex = false
	local Torso2
	if Cooldown == false then Cooldown = true else return nil end;
	connection = RightArm.Touched:Connect(function(blow) 
	   if blow.Parent:FindFirstChild("Humanoid") and blow.Parent.Name ~= Char.Name and mutex == false 
		then mutex = true print(blow.Parent) HIT = true 
			Torso2 = blow.Parent:FindFirstChild("UpperTorso") or blow.Parent:FindFirstChild("Torso")
			CallMultiple(CreateCube, 3, 8, 5, 20, Torso.Position, 0, "Blue") 
			local DMG = DealDamage(MR(10,15), blow.Parent, 1)
			local TDMG = CreateDamage(math.floor(DMG), Torso.Parent.Head, Torso.Parent.Name) 
			print(Torso)
			TDMG:Destroy()
		--	Turnto(RootPart.Position, Torso)
		--	Turnto(Torso.Position, RootPart)
			else connection:disconnect() end;
	end)

	for i=0, 1, 0.1 / Animation_Speed do
        wait()
     --   RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 * Player_Size, 0 * Player_Size, -0.2 * Player_Size + 0.05 * COS(SINE / 12) * Player_Size) * ANGLES(RAD(0), RAD(0), RAD(55)), 0.15 / Animation_Speed)
	--	Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0 * Player_Size, 0 * Player_Size, 0 + ((1 * Player_Size) - 1)) * ANGLES(RAD(5 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(-25)), 0.45 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5 * Player_Size, 0.5 * Player_Size, 0 * Player_Size) * ANGLES(RAD(60), RAD(0), RAD(-25)) * RIGHTSHOULDERC0, 0.2 / Animation_Speed)
	--	RightShoulder.C0 = Clerp(RightShoulder.C0, CF(0 * Player_Size, 0 * Player_Size, 0 * Player_Size) * ANGLES(RAD(0), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 0 / Animation_Speed)
	--	RightHip.C0 = Clerp(aRightHip.C0, CF(1 * Player_Size, -0.8 * Player_Size - 0.05 * COS(SINE / 12) * Player_Size, -0.2 * Player_Size) * ANGLES(RAD(0), RAD(95), RAD(0)) * ANGLES(RAD(-5), RAD(0), RAD(-2.5)), 0.15 / Animation_Speed)
	--	LeftHip.C0 = Clerp(LeftHip.C0, CF(-1 * Player_Size, -0.8 * Player_Size - 0.05 * COS(SINE / 12) * Player_Size, -0.2 * Player_Size) * ANGLES(RAD(-35), RAD(-75), RAD(0)) * ANGLES(RAD(-7.5), RAD(0), RAD(-15)), 0.15 / Animation_Speed)
		if HIT == true then
			break
		end
	end
	
	if HIT ~= nil then
		Head.Eye.Material = "Neon"
		Head.Eye.BrickColor = BrickColor.new("Really red")
		Head.Eye2.Material = "Neon"
		Head.Eye2.BrickColor = BrickColor.new("Really red")
			Turnto(RootPart.Position, Torso2)
			Turnto(Torso2.Position, RootPart)
		Chat("Right...", 20)
		--RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.3 * Player_Size, -0.15 * Player_Size, 0.5 * Player_Size) * ANGLES(MRA(-40), MRA(-90), MRA(-100)) * RIGHTSHOULDERC0, 0.15/Animation_Speed)
		for i=0, 1, 0.1/Animation_Speed do
			wait()
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5 * Player_Size, 0.5 * Player_Size, -0.2 * Player_Size ) * ANGLES(RAD(120), RAD(360), RAD(40)) * LEFTSHOULDERC0, 0.99 / Animation_Speed)			--LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5 * Player_Size, 0.5 * Player_Size, -0.2 * Player_Size ) * ANGLES(RAD(13), RAD(-28.9), RAD(-15)) * LEFTSHOULDERC0, 0.15 / Animation_Speed
			--RootJoint.C0 = Clerp(RootJoint.C0, CF(0 * Player_Size,0 * Player_Size ,0.2 * Player_Size + 0.05 * COS(0) * Player_Size) * ANGLES(MRA(-89.9),MRA(0),MRA(-205)), 0.99/Animation_Speed) -- -89.9, 0, -70  
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5 * Player_Size, 0.5 * Player_Size, -0.2 * Player_Size) * ANGLES(MRA(140), MRA(360), MRA(-40)) * RIGHTSHOULDERC0, 0.99/Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1 * Player_Size, -0.8 * Player_Size - 0.05 * COS(SINE / 12) * Player_Size, -0.2 * Player_Size) * ANGLES(RAD(0), RAD(95), RAD(0)) * ANGLES(RAD(-5), RAD(0), RAD(-2.5)), 0.99 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1 * Player_Size, -0.8 * Player_Size - 0.05 * COS(SINE / 12) * Player_Size, -0.2 * Player_Size) * ANGLES(RAD(-35), RAD(-75), RAD(0)) * ANGLES(RAD(-7.5), RAD(0), RAD(-15)), 0.99 / Animation_Speed)		
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0 * Player_Size, 0 * Player_Size, 0 + ((1 * Player_Size) - 1)) * ANGLES(RAD(5 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(15)), 0.15 / Animation_Speed)	
			end
		
--	for i=0,1,0.1/Animation_Speed do
			--wait()			
			--RootJoint.C0 = Clerp(RootJoint.C0, CF(0 * Player_Size,0 * Player_Size ,0.2 * Player_Size + 0.15 * COS(0) * Player_Size) * ANGLES(MRA(-89.9),MRA(0),MRA(-205)), 0.99/Animation_Speed)
			--RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5 * Player_Size, 0.5 * Player_Size, 0.5 * Player_Size) * ANGLES(MRA(120), MRA(0), MRA(0)) * RIGHTSHOULDERC0, 0.5/Animation_Speed)
			--RightHip.C0 = Clerp(RightHip.C0, OldC[5] * CF(0,0,0) * ANGLES(0,0,0), 0.15/Animation_Speed)
			--LeftHip.C0 = Clerp(LeftHip.C0, OldC[6] * CF(0,0,0) * ANGLES(0,0,0), 0.15/Animation_Speed)
	--end
	for i =0,1,0.1/Animation_Speed do
		wait()
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.7 * Player_Size, 0.5 * Player_Size, 0 * Player_Size) * ANGLES(MRA(100), MRA(360), MRA(-35)) * LEFTSHOULDERC0, 0.45/Animation_Speed)
		RootJoint.C0 = Clerp(RootJoint.C0, CF(0 * Player_Size,0 * Player_Size ,0.2 * Player_Size + -0.69 * COS(0) * Player_Size) * ANGLES(MRA(-86.9),MRA(360),MRA(-240)), 0.45/Animation_Speed)
	end
		--[[Chat("Punch!",0)
		CallMultiple(CreateSphere, 3, 2, 5, 10, Torso, 0, {"Dark orange", "Bright orange", "Really red"}) 
		local DMG = DealDamage(MR(30,35), Torso.Parent, 1) 
		local TDMG = CreateDamage(DMG, Torso.Parent.Head, Torso.Parent.Name)
		TDMG:Destroy()
		Torso.Parent:BreakJoints()
		]]
	for i =0,1,0.1/Animation_Speed do
		wait()
		RootJoint.C0 = Clerp(RootJoint.C0, CF(0 * Player_Size, 0 * Player_Size, 0.2 * Player_Size + 0 * COS(SINE/12) * Player_Size) * ANGLES(MRA(-89.9), MRA(0), MRA(-180)), 1.1/Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25 * Player_Size, 0.5 * Player_Size, -0.2 * Player_Size) * ANGLES(MRA(125), MRA(360), MRA(25)) * LEFTSHOULDERC0, 1.1/Animation_Speed)
	end
	--[[for i =0,1,0.1/Animation_Speed do
		wait()
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.65 * Player_Size, 0.5 * Player_Size, 0.2 * Player_Size) * ANGLES(MRA(-325), MRA(-360), MRA(30)) * LEFTSHOULDERC0, 1.1/Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.65 * Player_Size, 0.5 * Player_Size, 0.2 * Player_Size) * ANGLES(MRA(400), MRA(10), MRA(-30)) * RIGHTSHOULDERC0, 1.1/Animation_Speed)
	end]]
	
	
	for i =0,1,0.1/Animation_Speed do
		wait()
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5 * Player_Size, 0.5 * Player_Size, -0.2 * Player_Size ) * ANGLES(RAD(120), RAD(360), RAD(40)) * LEFTSHOULDERC0, 0.5 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5 * Player_Size, 0.5 * Player_Size, -0.2 * Player_Size) * ANGLES(MRA(135), MRA(360), MRA(-40)) * RIGHTSHOULDERC0, 0.5/Animation_Speed)
	end
		
		--[[for i =0,1,0.1/Animation_Speed do
			wait()
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.3 * Player_Size, 0.5 * Player_Size, -0.9 * Player_Size) * ANGLES(MRA(120), MRA(0), MRA(-55)) * RIGHTSHOULDERC0, 0.5/Animation_Speed)
		end
		]]
		
		--[[
		for i =0, 1, 0.1/Animation_Speed do
			wait()
			RootJoint.C0 = Clerp(RootJoint.C0, CF(0 * Player_Size, 0 * Player_Size, 0.2 * Player_Size + 0.05 * COS(SINE/12) * Player_Size) * ANGLES(MRA(-89.9), MRA(0), MRA(-70)), 0.15/Animation_Speed) -- -89.9, 0, -70  
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.3 * Player_Size, 0.5 * Player_Size, 0.5 * Player_Size) * ANGLES(MRA(70), MRA(0), MRA(100)) * RIGHTSHOULDERC0, 0.15/Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5 * Player_Size, 0.5 * Player_Size, -0.2 * Player_Size ) * ANGLES(RAD(180), RAD(360), RAD(40)) * LEFTSHOULDERC0, 0.15 / Animation_Speed)			
		end
		]]

		
		end
--[[	for i =0,1,0.1/Animation_Speed do
		wait()
		RootJoint.C0 = Clerp(RootJoint.C0, OldC[1]* CF(0,0,0) * ANGLES(0,0,0), 0.15/Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, OldC[2] * CF(0,0,0) * ANGLES(0,0,0), 0.15/Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, OldC[4] * CF(0,0,0) * ANGLES(0,0,0), 0.15/Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, OldC[3]* CF(0,0,0) * ANGLES(0,0,0), 0.15/Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, OldC[5]* CF(0,0,0) * ANGLES(0,0,0), 0.15/Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, OldC[6]* CF(0,0,0) * ANGLES(0,0,0), 0.15/Animation_Speed)
	end
]]
--[[	for i =0,1,0.1/Animation_Speed do
		wait()
		RootJoint.C0 = Clerp(RootJoint.C0, OldC[1], 0.15/Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, OldC[2], 0.15/Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, OldC[4], 0.15/Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, OldC[3], 0.15/Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, OldC[5], 0.15/Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, OldC[6], 0.15/Animation_Speed)
	end
	for i =0,1,0.1/Animation_Speed do
		wait()
		RootJoint.C0 = Clerp(RootJoint.C0, OldC[1], 0.15/Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, OldC[2], 0.15/Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, OldC[4], 0.15/Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, OldC[3], 0.15/Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, OldC[5], 0.15/Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, OldC[6], 0.15/Animation_Speed)
	end]]
wait()
connection:disconnect()
	end
ATTACK = false
end

function Do()
	print("AUIsauhgfsfyhafisdhsdf")
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.3 * Player_Size, -0.2 * Player_Size, 0 * Player_Size) * ANGLES(RAD(8), RAD(180), RAD(120)) * LEFTSHOULDERC0, 0.15 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.3 * Player_Size, -0.2 * Player_Size, 0 * Player_Size) * ANGLES(RAD(8), RAD(-180), RAD(-120)) * RIGHTSHOULDERC0, 0.15 / Animation_Speed)
end


function IronClash()
	if ATTACK == false then
		ATTACK = true
		for i = 0, 1, 0.1/Animation_Speed do
			wait()
			RootJoint.C0 = Clerp(RootJoint.C0, CF(0 * Player_Size, 3 * Player_Size, 0 * Player_Size) * ANGLES(MRA(0), MRA(0), MRA(0)) * ROOTC0, 0.15/Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1 * Player_Size, -1 * Player_Size - 0.05 * COS(SINE / 12) * Player_Size, -0.2 * Player_Size) * ANGLES(RAD(0), RAD(-110), RAD(0)) * ANGLES(RAD(-7), RAD(0), RAD(0)), 0.15 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1 * Player_Size, -1 * Player_Size - 0.05 * COS(SINE / 12) * Player_Size, -0.2 * Player_Size) * ANGLES(RAD(0), RAD(110), RAD(0)) * ANGLES(RAD(-7), RAD(0), RAD(0)), 0.15 / Animation_Speed)	
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.3 * Player_Size, -0.1 * Player_Size, -0.3 * Player_Size) * ANGLES(RAD(115), RAD(90), RAD(0)) * LEFTSHOULDERC0, 0.15 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.3 * Player_Size, -0.1 * Player_Size, -0.3 * Player_Size) * ANGLES(RAD(115), RAD(-90), RAD(0)) * RIGHTSHOULDERC0, 0.15 / Animation_Speed)					
		end
		for i = 0, 1, 0.1/Animation_Speed do
			wait()
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5 * Player_Size, 1 * Player_Size, 0 * Player_Size) * ANGLES(RAD(-10), RAD(180), RAD(240)) * LEFTSHOULDERC0, 0.15 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5 * Player_Size, 1 * Player_Size, 0 * Player_Size) * ANGLES(RAD(-10), RAD(-180), RAD(-240)) * RIGHTSHOULDERC0, 0.15 / Animation_Speed)
		end
		Head.Eye.Material = "Neon"
		Head.Eye.BrickColor = BrickColor.new("White")
		Head.Eye2.Material = "Neon"
		Head.Eye2.BrickColor = BrickColor.new("White")
		CallMultiple(CreateSphere, 3, 10, 0, 40, Torso, 0, {"White"})
		for i = 0, 1, 0.1/Animation_Speed do
			wait()
			RootJoint.C0 = Clerp(RootJoint.C0, CF(0 *Player_Size, -0.58 * Player_Size,0*Player_Size) * ANGLES(MRA(0), MRA(0), MRA(0)) * ROOTC0, 0.15/Animation_Speed)
		end
		for i = 0, 1, 0.1/Animation_Speed do
			wait()
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.3 * Player_Size, -0.2 * Player_Size, 0 * Player_Size) * ANGLES(RAD(8), RAD(180), RAD(120)) * LEFTSHOULDERC0, 0.15 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.3 * Player_Size, -0.2 * Player_Size, 0 * Player_Size) * ANGLES(RAD(8), RAD(-180), RAD(-120)) * RIGHTSHOULDERC0, 0.15 / Animation_Speed)
		end
		Chat("IronGod...", 150)
		local Pos = Head
		CallMultiple(CreateSphere,10,20,0, 80, Pos, 20, {"White"}) 
		local Light = IT("PointLight", Torso)
		Light.Brightness = 1
		Light.Range = 1000
		local Sphere = CallMultiple(CreateSphere, 3, 10, 0, 380, Pos, 100, {"White", "Black", "Black", "Black", "White", "Black"})
		for i = 0, 1, 0.1/Animation_Speed do
			wait()
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5 * Player_Size, 0.5 * Player_Size, 0 * Player_Size) * ANGLES(RAD(60), RAD(0), RAD(-25)) * RIGHTSHOULDERC0, 0.2 / Animation_Speed)	
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5 * Player_Size, 0.5 * Player_Size, 0 * Player_Size) * ANGLES(RAD(60), RAD(0), RAD(25)) * LEFTSHOULDERC0, 0.2 / Animation_Speed)
		end
		Chat("Clash!", 150)
		Pos = Head
		SSWait(200)
		Chat("Aiming....", 30)
		local LastPos = CallMultiple(CreateSphere,15, 20, 0, 65, Pos.Position, 0, {"White", "Black"}, true)
		CallMutipleDiff(LastPos.p)
		killnearest(LastPos.p, 300)
		SSWait(150)
		Light:Destroy()
	for i =0,1,0.1/Animation_Speed do
		wait()
		RootJoint.C0 = Clerp(RootJoint.C0, OldC[1], 0.15/Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, OldC[2], 0.15/Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, OldC[4], 0.15/Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, OldC[3], 0.15/Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, OldC[5], 0.15/Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, OldC[6], 0.15/Animation_Speed)
	end
	for i =0,1,0.1/Animation_Speed do
		wait()
		RootJoint.C0 = Clerp(RootJoint.C0, OldC[1], 0.15/Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, OldC[2], 0.15/Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, OldC[4], 0.15/Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, OldC[3], 0.15/Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, OldC[5], 0.15/Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, OldC[6], 0.15/Animation_Speed)
	end
	end
	ATTACK = false
end

function SuperHeroPunch()
	if ATTACK == false then
		ATTACK = true
		for i=0, 1, 0.1 / Animation_Speed do
			wait()
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5 * Player_Size, 0.5 * Player_Size, 0 * Player_Size) * ANGLES(RAD(90), RAD(0), RAD(90)) * RIGHTSHOULDERC0, 0.5 / Animation_Speed)
		end
		local connection
		local HIT = nil
		local mutex = false
		local Torso
		if Cooldown == false then Cooldown = true else return nil end;
		connection = RightArm.Touched:Connect(function(blow) 
		   if blow.Parent:FindFirstChild("Humanoid") and blow.Parent.Name ~= Char.Name and mutex == false 
			then mutex = true print(blow.Parent) 
			HIT = true 
			Torso = blow.Parent:FindFirstChild("UpperTorso") or blow.Parent:FindFirstChild("Torso")
			CallMultiple(CreateCube, 3, 8, 5, 20, Torso.Position, 0, "Blue") 
			local DMG = DealDamage(MR(10,15), blow.Parent, 1)
			local TDMG = CreateDamage(math.floor(DMG), Torso.Parent.Head, Torso.Parent.Name) 
			print(Torso)
			TDMG:Destroy()
			Turnto(RootPart.Position, Torso)
			Turnto(Torso.Position, RootPart)
			else connection:disconnect() end;
		end)
		for i=0, 1, 0.1 / Animation_Speed do
			wait()
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5 * Player_Size, 0.5 * Player_Size, 0 * Player_Size) * ANGLES(RAD(60), RAD(0), RAD(-25)) * RIGHTSHOULDERC0, 0.5 / Animation_Speed)		
			if HIT == true then
				break
			end
		end
		print(HIT)
		if HIT ~= nil then
			print("Jasddasdsd")
			for i = 0, 1, 0.1/Animation_Speed do
				wait()
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.3 * Player_Size, -0.1 * Player_Size, 0.2 * Player_Size) * ANGLES(RAD(115), RAD(90), RAD(0)) * LEFTSHOULDERC0, 0.5 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.3 * Player_Size, -0.1 * Player_Size, 0.2 * Player_Size) * ANGLES(RAD(115), RAD(-90), RAD(0)) * RIGHTSHOULDERC0, 0.5 / Animation_Speed)
			end
			wait(1)
			Chat("SuperHero...", 20)
			for i = 0, 1, 0.1/Animation_Speed do
				wait()
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5 * Player_Size, 0.5 * Player_Size, 0.5 * Player_Size) * ANGLES(RAD(90), RAD(10), RAD(0)) * LEFTSHOULDERC0, 0.5 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5 * Player_Size, 0.5 * Player_Size, 0.5 * Player_Size) * ANGLES(RAD(90), RAD(-10), RAD(0)) * RIGHTSHOULDERC0, 0.5 / Animation_Speed)		
			end
			for i = 0, 1, 0.1/Animation_Speed do
				wait()
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5 * Player_Size, 0.5 * Player_Size, -0.5 * Player_Size) * ANGLES(RAD(90), RAD(10), RAD(0)) * LEFTSHOULDERC0, 0.5 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5 * Player_Size, 0.5 * Player_Size, -0.5 * Player_Size) * ANGLES(RAD(90), RAD(-10), RAD(0)) * RIGHTSHOULDERC0, 0.5 / Animation_Speed)				
			end
			Chat("Punch!", 20)
			local DMG = DealDamage(MR(10,15), Torso.Parent, 1)
			local TDMG = CreateDamage(math.floor(DMG), Torso.Parent.Head, Torso.Parent.Name) 
			TDMG:Destroy()
			CallMultiple(CreateSphere, 4, 12, 1, 70, Torso, 0, {"Cyan", "Teal", "Toothpaste", "Dark blue"}) 
			CallMultiple(CreateWave, 2, 8, 0,2,true,-0.02,150,RootPart,-2,{"Cyan", "Teal", "Toothpaste", "Dark blue"}, true)
		end
		for i =0,1,0.1/Animation_Speed do
			wait()
			RootJoint.C0 = Clerp(RootJoint.C0, OldC[1], 0.15/Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, OldC[2], 0.15/Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, OldC[4], 0.15/Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, OldC[3], 0.15/Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, OldC[5], 0.15/Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, OldC[6], 0.15/Animation_Speed)
		end
	wait()
	connection:disconnect()
	end
	ATTACK = false
end

function KeyDown(Input, GPE)
	local Start = tick()
	if Input.KeyCode == Enum.KeyCode.E then
		local KeyStart = tick()
		print(math.abs(Start - KeyStart))
		if math.abs(Start - KeyStart) >= 1.5 and math.abs(Start - KeyStart) <= 4.5 then return nil end;
		local Cool = LeftPunch()
		if Cool == nil then wait(0.1) Cooldown = false else Cooldown = true end;
	elseif Input.KeyCode == Enum.KeyCode.F then
		local KeyStart = tick()
		print(math.abs(Start - KeyStart))
		if math.abs(Start - KeyStart) >= 1.5 and math.abs(Start - KeyStart) <= 4.5 then return nil end;
		local Cool = RightPunch()
		if Cool == nil then wait(0.1) Cooldown = false else Cooldown = true end;
	elseif Input.KeyCode ==  Enum.KeyCode.Z then		
		local KeyStart = tick()
		print(math.abs(Start - KeyStart))
		if math.abs(Start - KeyStart) >= 1.5 and math.abs(Start - KeyStart) <= 4.5 then return nil end;
		local Cool = SuperHeroPunch()
		if Cool == nil then wait(0.1) Cooldown = false else Cooldown = true end;	
	elseif Input.KeyCode == Enum.KeyCode.R then
		local KeyStart = tick()
		print(math.abs(Start - KeyStart))
		if math.abs(Start - KeyStart) >= 1.5 and math.abs(Start - KeyStart) <= 4.5 then return nil end;
		local Cool = IronClash()
		if Cool == nil then wait(0.1) Cooldown = false else Cooldown = true end;		
	end
end

local Eye = CreatePart("Concrete", VT(0.25, 0.25, 0.25), Head, 0, false, true, false, "Really black", 1, "Eye", 0, "Sphere")
CreateWeld("EyeWeld", Eye, Head, nil, CF(-0.2 * Player_Size, -0.75 * Player_Size, -0.5 * Player_Size)*NECKC0, NECKC0, Eye)
local Eye2 = CreatePart("Concrete",VT(0.25, 0.25, 0.25), Head, 0, false, true, false, "Really black", 1, "Eye2", 0, "Sphere" )
CreateWeld("EyeWeld", Eye2, Head, nil,CF(0.2 * Player_Size, -0.75 * Player_Size, -0.5 * Player_Size)*NECKC0, Eye)

Chat("Loading Character Appearence...")

UIS.InputBegan:Connect(KeyDown)
DestoryAccess()


