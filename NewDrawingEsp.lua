local Players = game:GetService'Players'
local RunService = game:GetService'RunService'
local LP = Players.LocalPlayer
local EspColour = Color3.fromRGB(144,0,0)
local EspTable = {}
local EspSettings = {
    ['Tracer'] = false;
    ['Box'] = true;
    ['Text'] = true
}

local function Unesp(Player)
    local Plr = EspTable[tostring(Player)]
    if Plr then 
        for i,v in pairs(Plr) do
            if i ~= "Box" then 
                v:Remove()
            else 
                table.foreach(v,function(Index,Value) Value:Remove() end)
            end 
        end
        Plr = nil
    end
end

Players.PlayerRemoving:Connect(Unesp)

local function Esp(Player)
    if Player.Character and Player.Character:FindFirstChild'Head' then 
        local TracerLine = Drawing.new'Line'
        local Text = Drawing.new'Text'
        Text.Text = Player.Name
        Text.Color = Color3.fromRGB(144,0,0)
        local Line1,Line2,Line3 = Drawing.new'Line',Drawing.new'Line',Drawing.new'Line'
        Line1.Color = EspColour
        Line2.Color = EspColour
        Line3.Color = EspColour
        EspTable[Player.Name] = {['Tracer'] = TracerLine,['Text'] = Text,['Box'] = {Line1,Line2,Line3}}
    end 
end

local function ShowOrHideEsp(Table,Bool)
    table.foreach(Table,function(Index,Value)
        if Index == "Box" then 
            table.foreach(Value,function(Index2,Value2)
                Value2.Visible = Bool and EspSettings[Index] 
            end)
        else
            Value.Visible = Bool and EspSettings[Index]
        end 
    end)
end 

local function WorldToViewportPoint(Pos)
    return workspace.CurrentCamera:WorldToViewportPoint(Pos)
end 

for i,v in pairs(Players:GetPlayers()) do 
    Esp(v)
end

while wait() do
    for Player,Table in pairs(EspTable) do
        local Player = Players:FindFirstChild(Player)
        if Player then
            local Head,Torso = Player.Character:FindFirstChild'Head',Player.Character:FindFirstChild'Torso'
            if Player.Character and Head and Torso then
                local Pos,OnScreen = WorldToViewportPoint(Head.Position)
                local SizeForBox = Vector3.new(2,3,0) * ((Head.Size.Y / 2) * 2)
                local TopLeft = WorldToViewportPoint((Torso.CFrame * CFrame.new(SizeForBox.X,SizeForBox.Y,0)).p)
                local TopRight = WorldToViewportPoint((Torso.CFrame * CFrame.new(-SizeForBox.X,SizeForBox.Y,0)).p)
                local BottomLeft = WorldToViewportPoint((Torso.CFrame * CFrame.new(SizeForBox.X,-SizeForBox.Y,0)).p)
                local BottomRight = WorldToViewportPoint((Torso.CFrame * CFrame.new(-SizeForBox.X,-SizeForBox.Y,0)).p)
                Table['Text'].Position = Vector2.new(Pos.X,Pos.Y) + Vector2.new(0,10)
                Table['Box'][1].From = Vector2.new(TopLeft.X,TopLeft.Y)
                Table['Box'][1].To = Vector2.new(TopRight.X,TopRight.Y)
                Table['Box'][2].From = Vector2.new(TopRight.X,TopRight.Y)
                Table['Box'][2].To = Vector2.new(BottomRight.X,BottomRight.Y)
                Table['Box'][3].From = Vector2.new(BottomLeft.X,BottomLeft.Y)
                Table['Box'][3].To = Vector2.new(TopLeft.X,TopLeft.Y)
                ShowOrHideEsp(Table,OnScreen)
            end 
        else
            Unesp(Player)
        end 
    end 
end