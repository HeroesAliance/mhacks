local id=assert(tonumber(get.project))
local robot=assert(data.robots[id])
local uid=assert(tonumber(get.id))
local update=assert(robot.updates[uid])

local d={
	title='<a href="main.lua">Projects</a>&nbsp;&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;&nbsp;<a href="project.lua?id='..id..'">'..robot.name.."</a>&nbsp;&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;&nbsp;Update",
	wtitle="Update"
}
print(tm.header(d))

print([[
	<div style="border-style: solid; border-width: 4px; border-color:#000000; background-color:#303030; width:90%; margin: 0 auto; padding:16px;">
		<div style="font-size:25px; color:#EEEEEE; vertical-align:top;"><img src="]]..htmlencode(update.image)..[[" width=256 height=256 style="border-style: solid; position: relative; border-width: 4px; border-color:000000; float:left; margin-right:16px;"/>
		<div style="font-size:15px; color:#CCCCCC;">]]..timeDiff(update.created)..[[</div>]]..htmlencode(update.topic)..[[</div>
		<div class="spacer" style="clear: both;"></div>
	</div><br/>
]])

print([[
	<a href="newComment.lua?project=]]..id..[[&id=]]..uid..[["><div style="border-style: solid; border-width: 4px; border-color:000000; background-color:#303030; width:10%; font-size:60px;">
		<center>+</center>
	</div></a><br>
]])

if post and post.comment then
	table.insert(update.comments,1,{post.comment,socket.gettime()})
	update.lastUpdate=socket.gettime()
	save()
end

if get.delete then
	table.remove(update.comments,tonumber(get.delete))
	save()
end

for k,v in pairs(update.comments) do
	print([[
		<div style="border-style: solid; border-width: 4px; border-color:#000000; background-color:#303030; width:90%; margin: 0 auto; padding:16px;">
			<div style="font-size:25px; color:#EEEEEE; vertical-align:top;">
			]]..htmlencode(v[1])..[[</div>
			<div style="font-size:15px; color:#CCCCCC;"><a href="update.lua?project=]]..id..[[&id=]]..uid..[[&delete=]]..k..[[">[delete]</a> ]]..timeDiff(v[2])..[[</div>
		</div><br/>
	]])
end

print(tm.footer(d))
