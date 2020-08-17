local old;
old = hookfunc(getrawmetatable(game).__namecall,function(self,...)
	local Arguments = {...}
	if Arguments[3] and typeof(Arguments[3]) == "table" then
		if Arguments[3]['SoundId'] then
			Arguments[3]['SoundId'] = "rbxassetid://4643823821"
			Arguments[3]['Volume'] = 10
			Arguments[3]['Replicate'] = true
			return old(self,unpack(Arguments))
		end
	end
	return old(self,...)
end)
