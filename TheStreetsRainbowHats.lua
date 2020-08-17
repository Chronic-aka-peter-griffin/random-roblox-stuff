local LP = game:GetService'Players'.LocalPlayer
local Child = LP.PlayerGui.HUD.Clan.Group.cs:GetChildren()
local Child2 = {}

local a = LP.PlayerGui.HUD.Clan.Group.Reps:GetChildren()
for i = 1,#a do 
    if a[i]:IsA'TextButton' then 
        Child2[#Child2 + 1] = a[i]
    end 
end 

for i = 1,math.huge do
    LP.Backpack.Stank:FireServer("rep",Child2[math.random(1,#Child2)])
    LP.Backpack.Stank:FireServer("color",Child[math.random(1,#Child)])
    wait()
end

