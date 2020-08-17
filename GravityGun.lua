local Players = game:GetService'Players'
local UserInput = game:GetService'UserInputService'
local LP = Players.LocalPlayer or Players.PlayerAdded:Wait()
local Mouse = LP:GetMouse()
local Character = LP.Character or LP.CharacterAdded:Wait()
local Tool = Instance.new('Tool',game.Players.LocalPlayer.Backpack)
Tool.Name = "GravGun"
Tool.RequiresHandle = false
local Handle = Instance.new('Part',Tool)
Handle.Name = "Handle"
Handle.Transparency = 1
local Distance = 5
local SeizureMode = false
local BodyPos,BodyV;

local function createBodyPos(Parent)
	local BodyPosition = Instance.new('BodyPosition',Parent)
	BodyPosition.P = BodyPosition.P * 8
	BodyPosition.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
	if SeizureMode then
		BodyV = Instance.new('BodyAngularVelocity',Parent)
		BodyV.AngularVelocity = Vector3.new(0,9e9,0)
		BodyV.MaxTorque = Vector3.new(0,9e9,0)
	end
	return BodyPosition
end

UserInput.InputBegan:Connect(function(Input)
	if Input.KeyCode == Enum.KeyCode.Q and Distance > 5 then
		Distance = Distance - 5
	elseif Input.KeyCode == Enum.KeyCode.V then
		Distance = Distance + 5
	elseif Input.KeyCode == Enum.KeyCode.B then
		SeizureMode = not SeizureMode
	end
end)

Mouse.Button1Down:Connect(function()
local Target = Mouse.Target
	if Target and LP.Character:FindFirstChild'GravGun' then
		local Target = Mouse.Target.Parent:FindFirstChild'Head' or Mouse.Target.Parent.Parent:FindFirstChild'Head' or Mouse.Target
		if Players:GetPlayerFromCharacter(Target.Parent) or not Target.Anchored then
			BodyPos = createBodyPos(Target)
			BodyPos.Position = Tool.Handle.Position + CFrame.new(Tool.Handle.Position,Mouse.Hit.p).lookVector * Distance
		end
	end
end)

Mouse.Button1Up:Connect(function()
	if BodyPos then
		BodyPos:Destroy()
	end
	if BodyV then
		BodyV:Destroy()
	end
end)

while wait() do
	if BodyPos then
		BodyPos.Position = Tool.Handle.Position + CFrame.new(Tool.Handle.Position,Mouse.Hit.p).lookVector * Distance
	end
end
