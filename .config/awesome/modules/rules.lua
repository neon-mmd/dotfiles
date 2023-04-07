----------------------------imports-------------------------
local awful = require("awful")
local beautiful = require("beautiful")
local rules = {}

----------------------------rules-----------------------------
function rules.program_behaviour(clientkeys, clientbuttons)
	return {
		-- All clients will match this rule.
		{
			rule = {},
			properties = {
				border_width = beautiful.border_width,
				border_color = beautiful.border_normal,
				focus = awful.client.focus.filter,
				raise = true,
				keys = clientkeys,
				buttons = clientbuttons,
				screen = awful.screen.preferred,
				placement = awful.placement.no_overlap + awful.placement.no_offscreen,
				size_hints_honor = false,
			},
		},

		-- Floating clients.
		{
			rule_any = {
				instance = {
					"DTA", -- Firefox addon DownThemAll.
					"copyq", -- Includes session name in class.
					"pinentry",
				},
				class = {
					"Arandr",
					"Blueman-manager",
					"Gpick",
					"Kruler",
					"MessageWin", -- kalarm.
					"Sxiv",
					"Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
					"Wpa_gui",
					"veromix",
					"xtightvncviewer",
					"neon-logout",
				},

				-- Note that the name property shown in xprop might be set slightly after creation of the client
				-- and the name shown there might not match defined rules here.
				name = {
					"Event Tester", -- xev.
				},
				role = {
					"AlarmWindow", -- Thunderbird's calendar.
					"ConfigManager", -- Thunderbird's about:config.
					"pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
				},
			},
			properties = { floating = true },
		},

		-- Add titlebars to normal clients and dialogs
		{ rule_any = { type = { "normal", "dialog" } }, properties = { titlebars_enabled = true } },

		-- Set Firefox to always map on the tag named "2" on screen 1.
		{ rule = { class = "qutebrowser" }, properties = { screen = 1, tag = awful.util.tagnames[2] } },

		{ rule = { class = "VirtualBox Manager" }, properties = { screen = 1, tag = awful.util.tagnames[3] } },

		{ rule = { class = "mpv" }, properties = { screen = 1, tag = awful.util.tagnames[4] } },

		{ rule = { class = "Emacs" }, properties = { screen = 1, tag = awful.util.tagnames[6] } },

		{ rule = { class = "WhatSie: WhatsApp" }, properties = { screen = 1, tag = awful.util.tagnames[7] } },

		{ rule = { class = "Nextcloud" }, properties = { screen = 1, tag = awful.util.tagnames[5] } },

		{ rule = { class = "thunderbird" }, properties = { screen = 1, tag = awful.util.tagnames[8] } },
	}
end

return rules
