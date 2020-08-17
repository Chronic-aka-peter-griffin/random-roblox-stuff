local a;
a = hookfunc(getrawmetatable(game).__namecall,function(self,...)
   if getnamecallmethod() == "FireServer" then 
        print(self,...)
    end
    return a(self,...)
end)