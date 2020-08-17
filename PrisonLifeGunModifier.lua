local T =  {
    ['ReloadTime'] = 0;
    ['Bullets'] = 100;
    ['CurrentAmmo'] = math.huge;
    ['StoredAmmo'] = math.huge;
    ['MaxAmmo'] = math.huge;
    ['FireRate'] = 0;
    ['AutoFire'] = true;
    ['Range'] = math.huge;
    ['Spread'] = 0;
}

local function ChangeStates(Table)
    for i,v in pairs(T) do
        if Table[i] then
            Table[i] = v
        end
    end
end

for i,v in pairs(debug.getregistry()) do
    if typeof(v) == "function" then
        for i,g in pairs(debug.getupvalues(v)) do
            if typeof(g) == "table" then
                ChangeStates(g)
            end
        end
    end
end
