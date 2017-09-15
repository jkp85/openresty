local reg = "/servers/[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}/endpoint/"
if ngx.var.http_referer ~= nil and ngx.re.find(ngx.var.http_referer, reg, "ioj") ~= nil then
	local res = {}
	for match in (ngx.var.http_referer.."/"):gmatch("(.-)/") do
		table.insert(res, match)
	end
	local path = "/"..table.concat({table.unpack(res, 4, 11)}, "/")
	ngx.redirect(path..ngx.var.request_uri, 301)
end
