---------------------------imports--------------------------
local awful = require("awful")
local gears = require("gears")
local mytable = awful.util.table or gears.table -- 4.{0,1} compatibility
local easykey = require("modules.Ezkey")
local naughty = require("naughty")
local lain = require("lain")
local hotkeys_popup = require("awful.hotkeys_popup")
local keybindings = {}
local themes = require("modules.themes")
local colors = themes.pick_a_theme("dracula")

---------------------------keybindings----------------------
function keybindings.define_global_keybindings(terminal, browser, editor, font)
	return mytable.join(
		-- Destroy all notifications
		easykey.EzKey("C-S-space", function()
			naughty.destroy_all_notifications()
		end, "destroy all notifications", "hotkeys"),

		-- Neon logout
		easykey.EzKey("M-S-q", function()
			awful.util.spawn("neon-logout")
		end, "Displays logout options", "Apps/Scripts"),

		-- QuteBrowser
		easykey.EzKey("M-b", function()
			awful.util.spawn(browser)
		end, "Launch Neon-Browser", "Apps/Scripts"),

		-- Emacs server
		easykey.EzKey("M-d", function()
			awful.util.spawn(editor)
		end, "Launch the emacsclient frame", "Apps/Scripts"),

		-- VirtualBox
		easykey.EzKey("M-v", function()
			awful.util.spawn("virtualbox")
		end, "Launch VirtualBox", "Apps/Scripts"),

		-- Common websites script
		easykey.EzKey("M-c", function()
			awful.util.spawn("common-websites")
		end, "Launch custom web links bookmark", "Apps/Scripts"),

		-- Article viewer and convertor script
		easykey.EzKey("M-i", function()
			awful.util.spawn("article-viewer-convertor")
		end, "Download any article locally", "Apps/Scripts"),

		-- Search engine list script
		easykey.EzKey("M-w", function()
			awful.util.spawn("search-engines")
		end, "Launch custom script to search form a specific search engine", "Apps/Scripts"),

		-- Themes-changer script
		easykey.EzKey("M-S-t", function()
			awful.util.spawn("themes-changer")
		end, "Launch custom script to change themes easily", "Apps/Scripts"),

		-- close all notifications
		easykey.EzKey("A-S-k", function()
			awful.util.spawn("dunstctl close-all")
		end, "close all notifications", "Apps/Scripts"),

		-- toggle touchpad on or off
		easykey.EzKey("A-S-t", function()
			awful.util.spawn("touchpad")
		end, "toggle touchpad", "Apps/Scripts"),

		-- Flatpak-launcher script
		easykey.EzKey("M-a", function()
			awful.util.spawn("flatpak-launcher")
		end, "Launch custom script to launch flatpak applications", "Apps/Scripts"),

		-- Pcmanfm
		easykey.EzKey("M-p", function()
			awful.util.spawn("pcmanfm")
		end, "Launch Pcmanfm", "Apps/Scripts"),

		-- Onlyoffice
		easykey.EzKey("M-o", function()
			awful.util.spawn("onlyoffice-desktopeditors")
		end, "Launch Office App.", "Apps/Scripts"),

		-- Show help
		easykey.EzKey("M-s", hotkeys_popup.show_help, "show help", "awesome"),

		-- Tag browsing
		easykey.EzKey("M-Left", awful.tag.viewprev, "view previous", "tag"),
		easykey.EzKey("M-Right", awful.tag.viewnext, "view next", "tag"),
		easykey.EzKey("M-Escape", awful.tag.history.restore, "go back", "tag"),

		-- Non-empty tag browsing
		easykey.EzKey("A-Left", function()
			lain.util.tag_view_nonempty(-1)
		end, "view  previous nonempty", "tag"),
		easykey.EzKey("A-Right", function()
			lain.util.tag_view_nonempty(1)
		end, "view  previous nonempty", "tag"),

		-- Default client focus
		easykey.EzKey("M-j", function()
			awful.client.focus.byidx(1)
		end, "focus next by index", "client"),
		easykey.EzKey("M-k", function()
			awful.client.focus.byidx(-1)
		end, "focus previous by index", "client"),

		-- Resize client focus
		easykey.EzKey("M-C-j", function(c)
			awful.tag.incmwfact(0.01)
		end),
		easykey.EzKey("M-C-k", function()
			awful.tag.incmwfact(-0.01)
		end),
		easykey.EzKey("M-C-h", function()
			awful.client.incwfact(-0.01)
		end),

		-- Layout manipulation
		easykey.EzKey("M-S-j", function()
			awful.client.swap.byidx(1)
		end, "swap with next client by index", "client"),
		easykey.EzKey("M-S-k", function()
			awful.client.swap.byidx(-1)
		end, "swap with previous client by index", "client"),
		easykey.EzKey("M-C-j", function()
			awful.screen.focus_relative(1)
		end, "focus the next screen", "screen"),
		easykey.EzKey("M-C-k", function()
			awful.screen.focus_relative(-1)
		end, "focus the previous screen", "screen"),
		easykey.EzKey("M-u", awful.client.urgent.jumpto, "jump to urgent client", "client"),
		easykey.EzKey("M-Tab", function()
			if cycle_prev then
				awful.client.focus.history.previous()
			else
				awful.client.focus.byidx(-1)
			end
			if client.focus then
				client.focus:raise()
			end
		end, "cycle with previous/go back", "client"),

		-- Show/hide wibox
		easykey.EzKey("M-S-b", function()
			for s in screen do
				s.mywibox.visible = not s.mywibox.visible
				if s.mybottomwibox then
					s.mybottomwibox.visible = not s.mybottomwibox.visible
				end
			end
		end, "toggle wibox", "awesome"),

		-- On-the-fly useless gaps change
		easykey.EzKey("A-C-+", function()
			lain.util.useless_gaps_resize(1)
		end, "increment useless gaps", "tag"),
		easykey.EzKey("A-C-_", function()
			lain.util.useless_gaps_resize(-1)
		end, "decrement useless gaps", "tag"),

		-- Dynamic tagging
		easykey.EzKey("M-S-n", function()
			lain.util.add_tag()
		end, "add new tag", "tag"),
		easykey.EzKey("M-S-r", function()
			lain.util.rename_tag()
		end, "rename tag", "tag"),
		easykey.EzKey("M-S-Left", function()
			lain.util.move_tag(-1)
		end, "move tag to the left", "tag"),
		easykey.EzKey("M-S-Right", function()
			lain.util.move_tag(1)
		end, "move tag to the right", "tag"),
		easykey.EzKey("M-S-d", function()
			lain.util.delete_tag()
		end, "delete tag", "tag"),

		-- Standard program
		easykey.EzKey("M-Return", function()
			awful.spawn(terminal)
		end, "open a terminal", "launcher"),
		easykey.EzKey("M-C-r", awesome.restart, "reload awesome", "awesome"),
		easykey.EzKey("M-A-l", function()
			awful.tag.incmwfact(0.05)
		end, "increase master width factor", "layout"),
		easykey.EzKey("M-A-h", function()
			awful.tag.incmwfact(-0.05)
		end, "decrease master width factor", "layout"),
		easykey.EzKey("M-S-h", function()
			awful.tag.incnmaster(1, nil, true)
		end, "increase the number of master clients", "layout"),
		easykey.EzKey("M-S-l", function()
			awful.tag.incnmaster(-1, nil, true)
		end, "decrease the number of master clients", "layout"),
		easykey.EzKey("M-C-h", function()
			awful.tag.incncol(1, nil, true)
		end, "increase the number of columns", "layout"),
		easykey.EzKey("M-C-l", function()
			awful.tag.incncol(-1, nil, true)
		end, "decrease the number of columns", "layout"),
		easykey.EzKey("M-space", function()
			awful.layout.inc(1)
		end, "select next", "layout"),
		easykey.EzKey("M-S-space", function()
			awful.layout.inc(-1)
		end, "select previous", "layout"),

		easykey.EzKey("M-C-n", function()
			local c = awful.client.restore()
			-- Focus restored client
			if c then
				c:emit_signal("request::activate", "key.unminimize", { raise = true })
			end
		end, "restore minimized", "client"),

		--dmenu
		easykey.EzKey("M-r", function()
			os.execute(
				string.format(
					"dmenu_run -i -fn '%s' -nb '%s' -nf '%s' -sb '%s' -sf '%s'",
					font,
					colors["bg"],
					colors["fg"],
					colors["2"],
					colors["4"]
				)
			)
		end, "show dmenu", "launcher"),
        easykey.EzKey("XF86MonBrightnessDown", function ()
            awful.util.spawn("xbacklight -dec 10") end),
        easykey.EzKey("XF86MonBrightnessUp", function ()
            awful.util.spawn("xbacklight -inc 10") end)
	)
end

function keybindings.define_client_keybindings()
	return mytable.join(
		easykey.EzKey("A-S-m", lain.util.magnify_client, "magnify client", "client"),
		easykey.EzKey("M-f", function(c)
			c.fullscreen = not c.fullscreen
			c:raise()
		end, "toggle fullscreen", "client"),
		easykey.EzKey("M-S-c", function(c)
			c:kill()
		end, "close", "client"),
		easykey.EzKey("M-C-space", awful.client.floating.toggle, "toggle floating", "client"),
		easykey.EzKey("M-C-Return", function(c)
			c:swap(awful.client.getmaster())
		end, "move to master", "client"),
		easykey.EzKey("M-o", function(c)
			c:move_to_screen()
		end, "move to screen", "client"),
		easykey.EzKey("M-t", function(c)
			c.ontop = not c.ontop
		end, "toggle keep on top", "client"),
		easykey.EzKey("M-n", function(c)
			-- The client currently has the input focus, so it cannot be
			-- minimized, since minimized clients can't have the focus.
			c.minimized = true
		end, "minimize", "client"),
		easykey.EzKey("M-m", function(c)
			c.maximized = not c.maximized
			c:raise()
		end, "(un)maximize", "client")
	)
end

function keybindings.define_tag_keybindings(globalkeys, i)
	return mytable.join(
		globalkeys,
		-- View tag only.
		easykey.EzKey("M-#" .. i + 9, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				tag:view_only()
			end
		end, "view tag #" .. i, "tag"),
		-- Toggle tag display.
		easykey.EzKey("M-C-#" .. i + 9, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				awful.tag.viewtoggle(tag)
			end
		end, "toggle tag #" .. i, "tag"),
		-- Move client to tag.
		easykey.EzKey("M-S-#" .. i + 9, function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:move_to_tag(tag)
				end
			end
		end, "move focused client to tag #" .. i, "tag"),
		-- Toggle tag on focused client.
		easykey.EzKey("M-C-S-#" .. i + 9, function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:toggle_tag(tag)
				end
			end
		end, "toggle focused client on tag #" .. i, "tag")
	)
end

return keybindings
