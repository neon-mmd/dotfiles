-------------------------imports-----------------------------
local tagnames = {}

-------------------------tagnames----------------------------
function tagnames.pick_a_tagnames_style(style)
	local tagStyle = {
		named = {
			"term",
			"web",
			"vbox",
			"media",
			"cloud",
			"code",
			"chat",
			"mail",
			"conf",
		},
		iconic = {
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
		},
	}
	return tagStyle[style]
end

return tagnames
