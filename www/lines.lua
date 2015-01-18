local count
local function countFile(file)
	if fs.isDir(file) then
		return count(file)
	elseif file:match("%.lua$") then
		local t=0
		local fl=assert(io.open(file,"r"))
		for l in fl:read("*a"):gmatch("\n") do
			t=t+1
		end
		fl:close()
		return t
	end
	return 0
end
function count(dir)
	local t=0
	for k,v in pairs(fs.list(dir)) do
		local file=fs.combine(dir,v)
		t=t+countFile(file)
	end
	return t
end
print(count("C:\\Users\\Kevin\\Desktop\\t\\hackathon\\webserver\\www")+countFile("C:\\Users\\Kevin\\Desktop\\t\\hackathon\\webserver\\project.lua"))