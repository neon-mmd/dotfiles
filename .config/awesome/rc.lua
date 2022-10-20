-------------imports---------------------
pcall(require, "luarocks.loader")

local awful = require("awful")
require("awful.autofocus")
local beautiful = require("beautiful")
local naughty = require("naughty")
local lain = require("lain")
local keybindings = require("modules.keybindings")
local buttons = require("modules.buttons")
local rules = require("modules.rules")
local layouts = require("modules.layouts")
local tagnames = require("modules.tagnames")
require("awful.hotkeys_popup.keys")

--------------Errors------------------------
if awesome.startup_errors then
	naughty.notify({
		preset = naughty.config.presets.critical,
		title = "Oops, there were errors during startup!",
		text = awesome.startup_errors,
	})
end

do
	local in_error = false

	awesome.connect_signal("debug::error", function(err)
		if in_error then
			return
		end

		in_error = true

		naughty.notify({
			preset = naughty.config.presets.critical,
			title = "Oops, an error happened!",
			text = tostring(err),
		})

		in_error = false
	end)
end

-- This function will run once every time Awesome is started
local function run_once(cmd_arr)
	for _, cmd in ipairs(cmd_arr) do
		awful.spawn.with_shell(string.format("pgrep -u $USER -fx '%s' > /dev/null || (%s)", cmd, cmd))
	end
end

run_once({ "urxvtd", "unclutter -root" }) -- comma-separated entries

----------------------------------------themes-----------------------------------
local terminal = "kitty"
local vi_focus = false
local cycle_prev = true
local editor = "emacsclient -c -n -a 'emacs'"
local browser = "qutebrowser"
local font = "FiraCode Nerd Font Mono"

awful.util.terminal = terminal

-- {
--   iconic
--   named
-- }

awful.util.tagnames = tagnames.pick_a_tagnames_style("iconic")
awful.layout.layouts = layouts.define_layouts()
lain.layout.termfair.nmaster = 3
lain.layout.termfair.ncol = 1
lain.layout.termfair.center.nmaster = 3
lain.layout.termfair.center.ncol = 1
lain.layout.cascade.tile.offset_x = 2
lain.layout.cascade.tile.offset_y = 32
lain.layout.cascade.tile.extra_padding = 5
lain.layout.cascade.tile.nmaster = 5
lain.layout.cascade.tile.ncol = 2

awful.util.taglist_buttons = buttons.define_tag_buttons()
awful.util.tasklist_buttons = buttons.define_task_buttons()
beautiful.init(string.format("%s/.config/awesome/themes/powerarrow/theme.lua", os.getenv("HOME")))

--  Screen
-- No borders when rearranging only 1 non-floating or maximized client
screen.connect_signal("arrange", function(s)
	local only_one = #s.tiled_clients == 1
	for _, c in pairs(s.clients) do
		if only_one and not c.floating or c.maximized or c.fullscreen then
			c.border_width = 0
		else
			c.border_width = beautiful.border_width
		end
	end
end)

-- Create a wibox for each screen and add it
awful.screen.connect_for_each_screen(function(s)
	beautiful.at_screen_connect(s)
end)

--  Mouse bindings
--  Key bindings

globalkeys = keybindings.define_global_keybindings(terminal, browser, editor, font)
clientkeys = keybindings.define_client_keybindings()

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
	globalkeys = keybindings.define_tag_keybindings(globalkeys, i)
end

clientbuttons = buttons.define_client_buttons()

-- Set keys
root.keys(globalkeys)

-- Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = rules.program_behaviour(clientkeys, clientbuttons)

-- Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function(c)
	-- Set the windows at the slave,
	-- i.e. put it at the end of others instead of setting it master.
	-- if not awesome.startup then awful.client.setslave(c) end

	if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
		-- Prevent clients from being unreachable after screen count changes.
		awful.placement.no_offscreen(c)
	end
end)

client.connect_signal("focus", function(c)
	c.border_color = beautiful.border_focus
end)
client.connect_signal("unfocus", function(c)
	c.border_color = beautiful.border_normal
end)

-- autostart programs
local home = os.getenv("HOME")
awful.spawn.once(home .. "/.config/autostart-apps-wm/autostart.sh")
