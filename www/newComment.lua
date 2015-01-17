local id=assert(tonumber(get.project))
local robot=assert(data.robots[id])
local uid=assert(tonumber(get.id))
local update=assert(robot.updates[uid])

local d={
	title='<a href="main.lua">Projects</a>&nbsp;&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;&nbsp;<a href="project.lua?id='..id..'">'..robot.name..'</a>&nbsp;&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;&nbsp;<a href="update.lua?project='..id..'&id='..uid..'">Update</a>&nbsp;&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;&nbsp;Comment',
	wtitle="Comment"
}

print(tm.header(d))

print([[
<div style="border-style: solid; border-width: 4px; border-color:#FFFFFF; background-color:#00EE00; padding:16px;">
	<form action="update.lua?project=]]..id..[[&id=]]..uid..[[" method="post"><table>
		<tr><td style="font-size: 30px;">Comment: </td><td><textarea type="text" name="comment" rows="6" cols="50" style="line-height: 30px; font-size: 25px;"></textarea></td></tr>
		<tr><td></td><td><input type="submit" value="Submit" style="font-size: 25px;"></td></tr>
	</table></form>
</div>
]])

print(tm.footer(d))
