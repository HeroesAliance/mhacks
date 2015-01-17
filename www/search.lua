assert(post)
assert(post.query)
local query=post.query

local d={
	title='<a href="main.lua">Projects</a>&nbsp;&nbsp;&nbsp;&nbsp;>&nbsp;&nbsp;&nbsp;&nbsp;Search',
	wtitle='Search',
	searchtext=query,
}

print(tm.header(d))

local res={}

local function pescape(txt)
	local o=txt:gsub("[%.%[%]%(%)%%%*%+%-%?%^%$]","%%%1"):gsub("%z","%%z")
	return o
end

for k,v in pairs(data.robots) do
	for n,l in pairs(v.updates) do
		l.index=n
		if l.topic:lower():match(pescape(query:lower())) then
			table.insert(res,{l,k})
		end
	end
end

table.sort(res,function(a,b)
	a[1].lastUpdate=a[1].lastUpdate or a[1].created
	b[1].lastUpdate=b[1].lastUpdate or b[1].created
	return a[1].lastUpdate>b[1].lastUpdate
end)

for k,v in pairs(res) do
	print([[
		<div style="border-style: solid; position: relative; border-width: 4px; border-color:000000; background-color:#303030; width:128px; width:90%; margin: 0 auto; padding:16px;"><a href="update.lua?project=]]..v[2]..[[&id=]]..v[1].index..[[">
			<div style="font-size:25px; color:#EEEEEE; vertical-align:bottom;"><img src="]]..htmlencode(v[1].image)..[[" width=128 height=128 style="float:left; margin-right:16px;"/>
			<div style="font-size:14px; color:#CCCCCC;">]]..timeDiff(v[1].created)..[[ in ]]..data.robots[v[2]].name..[[</div>]]..htmlencode(v[1].topic)..[[</div>
			]]..(next(v[1].comments) and ([[<div style="font-size:30px; color:#EEEEEE; position:relative; bottom:0; float:right;"><img src="http://i.imgur.com/FkYz7KX.png" style="margin-right:8px;"/>]]..#v[1].comments..[[</div>]]) or "")..[[
			<div class="spacer" style="clear: both;"></div>
		</a></div><br/>
	]])
end

print(tm.footer(d))