tm={}
function tm.header(d)
	return [[
		<html>
			<head>
				<title>]]..d.wtitle..[[</title>
				<style>
					body {
						font-family:Arial, Helvetica, sans-serif
					}
					a:link {
						color: #DDDDDD;
						text-decoration: none;
					}
					a:visited {
						color: #DDDDDD;
						text-decoration: none;
					}
					a:hover {
						color: #DDDDDD;
						text-decoration: none;
					}
					a:active {
						color: #DDDDDD;
						text-decoration: none;
					}
				</style>
			</head>
			<body style="background: url('http://i.imgur.com/baXjePq.png');">
				<div style="text-shadow: 1px 1px 5px #000000; border-style: solid; border-width: 4px; border-color:#202020; background: url('http://i.imgur.com/XPgyxq8.png'); color:#DDDDDD; padding:16; padding-left:64px;">
					<div style="float:left; font-size:30px; padding-top:20px;">
						]]..d.title..[[
					</div>
					<div style="float:right; margin-top: 24px; margin-right: 24px;">
						<form action="search.lua" method="post">
							<input type="text" name="query" value="]]..(d.searchtext or "")..[[" style="line-height: 30px; font-size: 25px;"/>
							<input type="submit" value="Search" style="font-size: 25px;">
						</form>
					</div>
					<div class="spacer" style="clear: both;"></div>
				</div><br/>
	]]
end

function tm.footer(d)
	return [[
			</body>
		</html>
	]]
end

function timeDiff(t)
	local df=socket.gettime()-t
	if df<2 then
		return "just now"
	elseif df<60 then
		return math.floor(df).." seconds ago"
	elseif df<3600 then
		return math.floor(df/60).." minute"..(math.floor(df/60)==1 and "" or "s").." ago"
	elseif df<86400 then
		return math.floor(df/3600).." hour"..(math.floor(df/3600)==1 and "" or "s").." ago"
	else
		local t=os.date("*t",t)
		return t.month.."/"..t.day.."/"..tostring(t.year):sub(-2,-1)
	end
end

data={
	robots={
		{
			updates={
				{
					image="http://i.imgur.com/GcBNBSt.jpg",
					topic="Added rubber bands to claw",
					comments={},
					created=socket.gettime()-5000,
				},
				{
					image="http://i.imgur.com/zeLmjzg.jpg",
					topic="Added 4pt auton to LCD menu",
					comments={},
					created=socket.gettime()-4000,
				},
				{
					image="http://i.imgur.com/wXECtXq.png",
					topic="Changing gear ratio on arm from 1:15 to 1:25 to decrease gear skipping",
					comments={},
					created=socket.gettime()-3600,
				},
				{
					image="http://puu.sh/eDRpn.png",
					topic="Fixed bug in encoder functions",
					comments={},
					created=socket.gettime()-1000,
				},
			},
			name="4540D",
			image="http://i.imgur.com/h1HiH7A.jpg",
		},
		{
			updates={
				{
					image="http://puu.sh/eDV6P.png",
					topic="Implemented this feature",
					comments={},
					created=socket.gettime()-10000,
				},
				{
					image="http://puu.sh/eDWzj.png",
					topic="Killed some time by making the \"This website\" icon",
					comments={},
					created=socket.gettime()-9000,
				},
				{
					image="http://puu.sh/eDWpD.png",
					topic="Implemented this fancy comment indicator",
					comments={
						{"I like turtles",socket.gettime()-7950},
					},
					created=socket.gettime()-8000,
				},
				{
					image="http://i.imgur.com/vcsSWN9.jpg",
					topic="Changes are now sorted by last comment\nComments are now inserted to the beginning rather than end\npic unrelated",
					comments={},
					created=socket.gettime()-7000,
				},
				{
					image="https://assets-cdn.github.com/images/modules/logos_page/GitHub-Mark.png",
					topic="Pushed to github!",
					comments={},
					created=socket.gettime()-6000,
				},
				{
					image="http://puu.sh/eEdtl.png",
					topic="Added search feature",
					comments={},
					created=socket.gettime()-5000,
				},
			},
			name="This website",
			image="http://puu.sh/eDVAT.png",
		},
	}
}

function newRobot(name,pic)
	local o={
		projects={},
		newProject=function()
			
		end
	}
	table.insert(data.robots,o)
	
end
