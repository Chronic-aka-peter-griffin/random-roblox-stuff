local Players = game:GetService'Players'
local LP = Players.LocalPlayer
local Mouse = LP:GetMouse()
local DeleteTool = Instance.new('Tool',LP.Backpack)
DeleteTool.Name = "Zetox Btools"

Mouse.Button1Down:Connect(function()
    if Mouse.Target and LP.Character:FindFirstChild'Zetox Btools' then
        Mouse.Target:Destroy()
    end 
end)