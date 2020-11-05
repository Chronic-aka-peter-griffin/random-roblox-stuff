local Request = require'coro-http'.request
local File = io.open("AudiosOutput.txt","a")
local HaveAudioNames = false 

local function writefile(Content)
    File:write(Content,"\n")
end 

for Line in io.lines("AudiosInput.txt") do 
    for AudioId in Line:gmatch("%w+") do
        if tonumber(AudioId) and #AudioId > 5 then
            coroutine.wrap(function()
            local Head,Body = Request("GET","https://www.roblox.com/studio/plugins/info?assetId="..AudioId)
                if not string.find(Body:lower(),"content deleted") and not string.find(Body:lower(),"removed for copyright") then
                    local Value1 = string.find(Body,"<p>")
                    local Value2 = string.find(Body,"</p>")       
                    if Value1 and Value2 then
                        if HaveAudioNames then            
                            writefile(AudioId.." ".. Body:sub(Value1 + 3,Value2 - 1))
                        else 
                            writefile(AudioId)
                        end
                    end
                end
            end)()
        end
    end
end