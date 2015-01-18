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
		local n=1
		while robot.updates[n] do
			n=n+1
		end
		robot.updates[n]={
			image=post.image,
			topic=post.info,
			comments={},
			created=socket.gettime(),
		}
		save()
	end
end

if get.delete then
	robot.updates[tonumber(get.delete)]=nil
	save()
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

if not next(updates) then
	print([[
		<br/><center><div style="color:#DDDDDD; font-size:30px;">
			*cricket*
		</div></center>
	]])
end

for k,v in pairs(updates) do
	print([[
		<div style="border-style: solid; position: relative; border-width: 4px; border-color:000000; background-color:#303030; width:128px; width:90%; margin: 0 auto; padding:16px;"><a href="update.lua?project=]]..id..[[&id=]]..v.index..[[">
			<div style="font-size:25px; color:#EEEEEE; vertical-align:bottom;"><img src="]]..htmlencode(v.image)..[[" width=128 height=128 style="border-style: solid; position: relative; border-width: 4px; border-color:000000; float:left; margin-right:16px;"/>
			<div style="font-size:14px; color:#CCCCCC;"><a href="project.lua?id=]]..id..[[&delete=]]..v.index..[[">[delete]</a> ]]..timeDiff(v.created)..[[</div>]]..htmlencode(v.topic)..[[</div>
			]]..(next(v.comments) and ([[<div style="font-size:30px; color:#EEEEEE; position:relative; bottom:0; float:right;"><img src="http://i.imgur.com/FkYz7KX.png" style="margin-right:8px;"/>]]..#v.comments..[[</div>]]) or "")..[[
			<div class="spacer" style="clear: both;"></div>
		</a></div><br/>
	]])
end

print(tm.footer(d))
