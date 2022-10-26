local gears = require("gears")
local lain = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi = require("beautiful.xresources").apply_dpi
local themes = require("modules.themes")

local math, string, os = math, string, os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

-- {
--  dracula
--  tomorrow-night
--  nord
--  gruvbox-dark
--  monokai
--  oceanic-next
--  solarized-dark
--  solarized-light
-- }

local colors = themes.pick_a_theme("dracula")

local theme = {}
theme.dir = os.getenv("HOME") .. "/.config/awesome/themes/powerarrow"
theme.font = "Iosevka Nerd Font 12"
theme.fg_normal = colors["bg"]
theme.fg_focus = colors["bg"]
theme.fg_urgent = colors["bg"]
theme.fg_minimize = "#ababab"
theme.bg_normal = colors["bg"]
theme.bg_focus = colors["bg"]
theme.bg_urgent = colors["bg"]
theme.bg_minimize = colors["bg"]
theme.taglist_fg_focus = colors["fg"]
theme.tasklist_bg_focus = colors["bg"]
theme.tasklist_fg_focus = colors["fg"]
theme.border_width = dpi(5)
theme.border_normal = colors["bg"]
theme.border_focus = colors["fg"]
theme.border_marked = "#91231c"
theme.menu_height = dpi(20)
theme.menu_width = dpi(140)
theme.tasklist_plain_task_name = true
theme.tasklist_disable_icon = true
theme.useless_gap = dpi(3)
theme.bg_systray = colors["3"]
theme.systray_icon_spacing = dpi(4)
theme.taglist_spacing = dpi(24)
theme.taglist_squares_resize = true
theme.squares_resize = true
theme.fg_occupied = colors["4"]

local markup = lain.util.markup
local separators = lain.util.separators

-- Battery
local bat = lain.widget.bat({
	settings = function()
		if bat_now.status and bat_now.status ~= "N/A" then
			if bat_now.ac_status == 1 then
				if not bat_now.perc and tonumber(bat_now.perc) >= 85 then
					widget:set_markup(markup.font(theme.font, " " .. bat_now.perc .. "% FULL!!"))
				else
					widget:set_markup(markup.font(theme.font, " " .. bat_now.perc .. "% "))
				end
				widget:set_markup(markup.font(theme.font, " " .. bat_now.perc .. "% "))
				return
			elseif not bat_now.perc and tonumber(bat_now.perc) >= 85 then
				widget:set_markup(markup.font(theme.font, " " .. bat_now.perc .. "% FULL!!"))
			elseif not bat_now.perc and tonumber(bat_now.perc) <= 30 then
				widget:set_markup(markup.font(theme.font, " " .. bat_now.perc .. "% LOW!!"))
			else
				widget:set_markup(markup.font(theme.font, " " .. bat_now.perc .. "% "))
			end
			widget:set_markup(markup.font(theme.font, " " .. bat_now.perc .. "% "))
		else
			widget:set_markup()
		end
	end,
})

--TextClock
local textclock = wibox.widget({
	font = theme.font,
	format = "  %Y-%m-%d %a    %I:%M %p",
	widget = wibox.widget.textclock,
	refresh = 1,
})

local pacupdates = awful.widget.watch('bash -c "pacman -Qu | wc -l"', 20, function(widget, stdout)
	widget:set_markup(markup.fontfg(theme.font, colors["bg"], string.format("  %s Updates", stdout)))
end)

-- Separators
local arrow_left = separators.arrow_left
local arrow_right = separators.arrow_right

function theme.powerline_rl(cr, width, height)
	local arrow_depth, offset = height / 2, 0

	-- Avoid going out of the (potential) clip area
	if arrow_depth < 0 then
		width = width + 2 * arrow_depth
		offset = -arrow_depth
	end

	cr:move_to(offset + arrow_depth, 0)
	cr:line_to(offset + width, 0)
	cr:line_to(offset + width - arrow_depth, height / 2)
	cr:line_to(offset + width, height)
	cr:line_to(offset + arrow_depth, height)
	cr:line_to(offset, height / 2)

	cr:close_path()
end

local function pl(widget, bgcolor, padding)
	return wibox.container.background(wibox.container.margin(widget, dpi(16), dpi(16)), bgcolor, theme.powerline_rl)
end

function theme.at_screen_connect(s)
	-- Quake application
	s.quake = lain.util.quake({ app = awful.util.terminal })

	-- Tags
	awful.tag(awful.util.tagnames, s, awful.layout.layouts)

	-- Create a promptbox for each screen
	s.mypromptbox = awful.widget.prompt()
	-- Create an imagebox widget which will contains an icon indicating which layout we're using.
	-- We need one layoutbox per screen.
	s.mylayoutbox = wibox.container.background(awful.widget.layoutbox(s), colors["5"])
	s.mylayoutbox:buttons(my_table.join(
		awful.button({}, 1, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 2, function()
			awful.layout.set(awful.layout.layouts[1])
		end),
		awful.button({}, 3, function()
			awful.layout.inc(-1)
		end),
		awful.button({}, 4, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 5, function()
			awful.layout.inc(-1)
		end)
	))
	-- Create a taglist widget
	s.mytaglist = wibox.container.background(
		wibox.container.margin(
			awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons),
			dpi(5),
			dpi(5)
		),
		colors["2"]
	)

	-- Create a tasklist widget
	s.mytasklist = wibox.container.margin(
		awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons),
		dpi(3),
		dpi(3)
	)

	-- Create the wibox
	s.mywibox =
		awful.wibar({ position = "top", screen = s, height = dpi(22), bg = theme.bg_normal, fg = theme.fg_normal })

	-- Add widgets to the wibox
	s.mywibox:setup({
		layout = wibox.layout.align.horizontal,
		{ -- Left widgets
			layout = wibox.layout.fixed.horizontal,
			spacing = 0,
			s.mytaglist,
			arrow_right(colors["2"], colors["bg"]),
			s.mypromptbox,
		},
		s.mytasklist, -- Middle widget
		{ -- Right widgets
			layout = wibox.layout.fixed.horizontal,
			arrow_left(colors["bg"], colors["3"]),
			wibox.container.background(
				wibox.container.margin(wibox.widget.systray(), dpi(3), dpi(3), dpi(3), dpi(3)),
				colors["3"]
			),
			arrow_left(colors["3"], colors["4"]),
			wibox.container.background(
				wibox.container.margin(
					wibox.widget({ baticon, bat.widget, layout = wibox.layout.align.horizontal }),
					dpi(3),
					dpi(3)
				),
				colors["4"]
			),
			arrow_left(colors["4"], colors["2"]),
			wibox.container.background(
				wibox.container.margin(
					wibox.widget({ nil, pacupdates, layout = wibox.layout.align.horizontal }),
					dpi(3),
					dpi(3)
				),
				colors["2"]
			),
			arrow_left(colors["2"], colors["1"]),
			wibox.container.background(wibox.container.margin(textclock, dpi(4), dpi(8)), colors["1"]),
			arrow_left(colors["1"], colors["5"]),
			--]]
			s.mylayoutbox,
		},
	})
end

return theme
