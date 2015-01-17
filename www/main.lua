local d={
	title="Projects",
	wtitle="Projects",
}
print(tm.header(d))
print([[
	<a href="newProject.lua"><div style="border-style: solid; border-width: 4px; border-color:FFFFFF; background-color:#00EE00; padding:8px; font-size:48px;"><center>
		<img src="http://i.imgur.com/JtK1Hz9.png"/><br/>
	</center></div></a><br>
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
		end
	end
end

for k,v in pairs(data.robots) do
	print([[
		<div style="border-style: solid; border-width: 4px; float:left; border-color:#FFFFFF; background-color:#202020; width:256px; height:310; padding:16px; margin-right:20px; margin-bottom:20px;"><a href="project.lua?id=]]..k..[[">
			<img src="]]..htmlencode(v.image)..[[" width=256 height=256/><br/>
			<div style="font-size:50px; color:#DDDDDD;"><center>]]..htmlencode(v.name)..[[</center></div>
		</a></div>
	]])
end
print([[
	</div>
]])
print(tm.footer(d))
