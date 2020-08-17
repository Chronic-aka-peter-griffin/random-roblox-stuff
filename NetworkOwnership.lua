local Players = game:GetService'Players'
local RunService = game:GetService'RunService'
local LP = Players.LocalPlayer

while RunService.Stepped:Wait() do
    sethiddenproperty(LP,"MaximumSimulationRadius",math.huge)
    sethiddenproperty(LP,"SimulationRadius",math.huge)
end
