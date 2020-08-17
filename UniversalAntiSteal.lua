local ScreenGui = Instance.new('ScreenGui',game:GetService'CoreGui')
local Frame = Instance.new('Frame',ScreenGui)
local TextLabel = Instance.new('TextLabel',Frame)
local TextBox = Instance.new('TextBox',Frame)
local TextLabel_2 = Instance.new('TextLabel',Frame)
local TextLabel_3 = Instance.new('TextLabel',Frame)
local TextBox_2 = Instance.new('TextBox',Frame)
local TextLabel_4 = Instance.new('TextLabel',Frame)
local TextBox_3 = Instance.new('TextBox',Frame)
local TextButton = Instance.new('TextButton',Frame)

Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.Position = UDim2.new(0.5, -188, 0.5, -112)
Frame.Size = UDim2.new(0, 441, 0, 290)
Frame.Style = Enum.FrameStyle.RobloxRound
Frame.Active = true 
Frame.Draggable = true

TextLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(-0.0188964568, 0, -0.0298064258, 0)
TextLabel.Size = UDim2.new(0, 441, 0, 50)
TextLabel.Font = Enum.Font.SciFi
TextLabel.Text = "Universal Antisteal by Cy"
TextLabel.TextColor3 = Color3.fromRGB(170, 0, 0)
TextLabel.TextSize = 30.000
TextLabel.TextWrapped = true

TextBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextBox.BackgroundTransparency = 0.600
TextBox.Position = UDim2.new(-0.0190987457, 0, 0.896091819, 0)
TextBox.Size = UDim2.new(0, 139, 0, 36)
TextBox.ClearTextOnFocus = false
TextBox.Font = Enum.Font.SourceSans
TextBox.Text = "142376088"
TextBox.TextColor3 = Color3.fromRGB(0, 170, 255)
TextBox.TextSize = 20.000

TextLabel_2.Parent = Frame
TextLabel_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.Position = UDim2.new(-0.0167657081, 0, 0.774525821, 0)
TextLabel_2.Size = UDim2.new(0, 138, 0, 33)
TextLabel_2.Font = Enum.Font.SourceSans
TextLabel_2.Text = "Audio (Change this after you setup the boombox)"
TextLabel_2.TextColor3 = Color3.fromRGB(170, 0, 0)
TextLabel_2.TextSize = 25.000
TextLabel_2.TextScaled = true 

TextLabel_3.Parent = Frame
TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.BackgroundTransparency = 1.000
TextLabel_3.Position = UDim2.new(0.691872656, 0, 0.77140522, 0)
TextLabel_3.Size = UDim2.new(0, 138, 0, 33)
TextLabel_3.Font = Enum.Font.SourceSans
TextLabel_3.Text = "Boombox Setup Id"
TextLabel_3.TextColor3 = Color3.fromRGB(170, 0, 0)
TextLabel_3.TextSize = 25.000
TextLabel_3.TextScaled = true

TextBox_2.Parent = Frame
TextBox_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextBox_2.BackgroundTransparency = 0.600
TextBox_2.Position = UDim2.new(0.690651834, 0, 0.896091819, 0)
TextBox_2.Size = UDim2.new(0, 139, 0, 36)
TextBox_2.ClearTextOnFocus = false
TextBox_2.Font = Enum.Font.SourceSans
TextBox_2.Text = "142376088"
TextBox_2.TextColor3 = Color3.fromRGB(0, 170, 255)
TextBox_2.TextSize = 20.000
TextBox_2.TextWrapped = true
TextBox_2.TextEditable = false

TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_4.BackgroundTransparency = 1.000
TextLabel_4.Position = UDim2.new(0.33586359, 0, 0.3162328, 0)
TextLabel_4.Size = UDim2.new(0, 138, 0, 33)
TextLabel_4.Font = Enum.Font.SourceSans
TextLabel_4.Text = "Cancer Shit to add"
TextLabel_4.TextColor3 = Color3.fromRGB(170, 0, 0)
TextLabel_4.TextSize = 20.000

TextBox_3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextBox_3.BackgroundTransparency = 0.600
TextBox_3.Position = UDim2.new(0.332375169, 0, 0.461609066, 0)
TextBox_3.Size = UDim2.new(0, 139, 0, 36)
TextBox_3.ClearTextOnFocus = false
TextBox_3.Font = Enum.Font.SourceSans
TextBox_3.Text = "fuckblackstheysmell"
TextBox_3.TextColor3 = Color3.fromRGB(0, 170, 255)
TextBox_3.TextScaled = true
TextBox_3.TextSize = 20.000
TextBox_3.TextWrapped = true

TextButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BackgroundTransparency = 0.600
TextButton.Position = UDim2.new(0.331065774, 0, 0.638375103, 0)
TextButton.Size = UDim2.new(0, 139, 0, 36)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "Play"
TextButton.TextColor3 = Color3.fromRGB(0, 170, 255)
TextButton.TextSize = 20.000

local PathToSet = nil
local RadioArgument = nil

local function ProtectId(IdToProtect,Cancer)
	local URL = game:HttpGet("https://www.roblox.com/studio/plugins/info?assetId="..tostring(IdToProtect))
	if URL then 
		local AlmostTheId = string.find(URL,"value=")
		local Id = URL:sub(AlmostTheId + 7,AlmostTheId + 16):gsub("\"","")
		return ("rbxassetid://"..Cancer.."&assetversionid="..Id.."&rbxassetid://"..Cancer)
	end 
end

local function findId(Table)
	for i,v in pairs(Table) do
		if typeof(v) == "string" or typeof(v) == "number" then 
			if string.find(v,"142376088") then 
				return v 
			end
		end 
	end
end

TextButton.MouseButton1Down:Connect(function()
	if PathToSet and RadioArgument then 
		if string.find(RadioArgument,"142376088") then
			PathToSet:FireServer(ProtectId(TextBox.Text,TextBox_3.Text))
		else
			PathToSet:FireServer(RadioArgument,ProtectId(TextBox.Text,TextBox_3.Text))
		end 
	end 
end)

local raw = getrawmetatable(game)
local Namecall = raw.__namecall 
setreadonly(raw,false)

raw.__namecall = newcclosure(function(self,...)
if checkcaller() then return Namecall(self,...) end 
local Args = {...}
	if getnamecallmethod() == "FireServer" then
		if findId(Args) then 
			RadioArgument = Args[1]
			PathToSet = self
		end
	end 
	return Namecall(self,...)
end)
setreadonly(raw,true)