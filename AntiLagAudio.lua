local Player = game:GetService'Players'['Player']
game:GetService'RunService'.Stepped:Connect(function()
    local Tool = Player.Character:FindFirstChild'BoxModel' or Player.Character:FindFirstChild'BoomBox'
    if Tool then
        Tool.Handle.SoundX.Playing = false
    end
end)
