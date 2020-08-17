local Table = LP.PlayerGui.HUD.Clan.Group.cs:GetChildren()
while wait() do 
    LP.Backpack.Stank:FireServer("color",Table[math.random(1,#Table)])
end 