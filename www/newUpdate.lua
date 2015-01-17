local id=assert(tonumber(get.id))
local robot=assert(data.robots[id])

local d={
	title='<a href="main.lua">Projects</a>&nbsp;&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;&nbsp;<a href="project.lua?id='..id..'">'..robot.name.."</a>&nbsp;&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;&nbsp;New update",
	wtitle='New update',
}

print(tm.header(d))

print([[
<div style="border-style: solid; border-width: 4px; border-color:#000000; background-color:#303030; padding:16px;">
	<form action="project.lua?id=]]..id..[[" method="post"><table>
		<tr><td style="font-size: 30px; color:#DDDDDD;">Image: </td><td><input type="text" name="image" style="line-height: 30px; font-size: 25px;"/></td></tr>
		<tr><td style="font-size: 30px; color:#DDDDDD;">Info: </td><td><textarea type="text" name="info" rows="6" cols="50" style="line-height: 30px; font-size: 25px;"></textarea></td></tr>
		<tr><td></td><td><input type="submit" value="Submit" style="font-size: 25px;"></td></tr>
	</table></form>
</div>
]])

print(tm.footer(d))
