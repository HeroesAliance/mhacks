local d={
	title='<a href="main.lua">Projects</a>&nbsp;&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;&nbsp;New',
	wtitle='New project',
}

print(tm.header(d))

print([[
<div style="border-style: solid; border-width: 4px; border-color:#202020; background-color:#303030; padding:16px;">
	<form action="main.lua" method="post"><table>
		<tr><td style="font-size:30px; color:#DDDDDD;">Project name: </td><td><input type="text" name="name" style="line-height: 30px; font-size: 25px;"/></td></tr>
		<tr><td style="font-size:30px; color:#DDDDDD;">Image: </td><td><input type="text" name="image" style="line-height: 30px; font-size: 25px;"/></td></tr>
		<tr><td></td><td><input type="submit" value="Submit" style="font-size: 25px;"></td></tr>
	</table></form>
</div>
]])

print(tm.footer(d))
