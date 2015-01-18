local d={
	title="Projects",
	wtitle="Projects",
}
print(tm.header(d))
print([[
	<a href="newProject.lua"><div style="border-style: solid; border-width:4px; border-color:000000; background-color:#303030; width:10%; font-size:60px;">
		<center>+</center>
	</div></a><br>
	<div style="overflow:hidden; width:100%;">
]])

if post then
	if post.name and post.image then
		local fail
		for k,v in pairs(data.robots) do
			if v.name==post.name then
				fail=true
			end
		end
		if not fail then
			table.insert(data.robots,{
				updates={},
				name=post.name,
				image=post.image
			})
			save()
		end
	end
end

for k,v in pairs(data.robots) do
	print([[
		<div style="border-style: solid; border-width: 4px; float:left; border-color:#000000; background-color:#404040; width:266px; height:290; padding:16px; margin:10px;"><a href="project.lua?id=]]..k..[[">
			<img src="]]..htmlencode(v.image)..[[" width=256 height=256 style="border-style: solid; position: relative; border-width: 4px; border-color:000000;"/><br/>
			<div style="font-size:40px; color:#DDDDDD;"><center>]]..htmlencode(v.name)..[[</center></div>
		</a></div>
	]])
end
print([[
	</div>
]])
print(tm.footer(d))
