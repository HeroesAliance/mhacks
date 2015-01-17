local id=assert(tonumber(get.id))
local robot=assert(data.robots[id])

local d={
	title='<a href="main.lua">Projects</a>&nbsp;&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;&nbsp;'..robot.name,
	wtitle="Project "..robot.name
}

print(tm.header(d))
print([[
	<a href="newUpdate.lua?id=]]..id..[[">
		<div style="border-style: solid; border-width: 4px; border-color:000000; background-color:#303030; width:10%; font-size:60px;">
			<center>+</center>
		</div>
	</a><br>
]])

if post then
	if post.info and post.image then
		table.insert(robot.updates,{
			image=post.image,
			topic=post.info,
			comments={},
			created=socket.gettime(),
		})
	end
end

local updates={}
for k,v in pairs(robot.updates) do
	v.lastUpdate=v.lastUpdate or v.created
	v.index=k
	table.insert(updates,v)
end

table.sort(updates,function(a,b)
	return a.lastUpdate>b.lastUpdate
end)

for k,v in pairs(updates) do
	print([[
		<div style="border-style: solid; position: relative; border-width: 4px; border-color:000000; background-color:#303030; width:128px; width:90%; margin: 0 auto; padding:16px;"><a href="update.lua?project=]]..id..[[&id=]]..v.index..[[">
			<div style="font-size:25px; color:#EEEEEE; vertical-align:bottom;"><img src="]]..htmlencode(v.image)..[[" width=128 height=128 style="float:left; margin-right:16px;"/>
			<div style="font-size:14px; color:#CCCCCC;">]]..timeDiff(v.created)..[[</div>]]..htmlencode(v.topic)..[[</div>
			]]..(next(v.comments) and ([[<div style="font-size:30px; color:#EEEEEE; position:relative; bottom:0; float:right;"><img src="http://i.imgur.com/FkYz7KX.png" style="margin-right:8px;"/>]]..#v.comments..[[</div>]]) or "")..[[
			<div class="spacer" style="clear: both;"></div>
		</a></div><br/>
	]])
end

print(tm.footer(d))
