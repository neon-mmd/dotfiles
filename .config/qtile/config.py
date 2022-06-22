# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import os
import subprocess
from libqtile.dgroups import simple_key_binder
from libqtile import qtile, hook, extension
from typing import List  # noqa: F401
from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

#-----------------------------------------Custom-functions----------------------------------
def color_picker(n):
    color_collection = [
        [  # tomorrow night
            ["#1d1f21", "#1d1f21"],  # panel background
            ["#ae7b00", "#ae7b00"],  # background for current screen tab
            ["#c5c8c6", "#c5c8c6"],  # font color for group names
            ["#912226", "#912226"],  # border line color for current tab
            ["#682a9b", "#682a9b"],  # border line color for 'other tabs' and color for 'odd widgets'
            ["#1d1f21", "#1d1f21"],  # color for the 'even widgets'
            ["#1d1f21", "#1d1f21"],  # window name
            ["#682a9b", "#682a9b"]
        ],
        [  # dracula
            ["#282a36", "#282a36"],  # panel background
            ["#44475a", "#44475a"],  # background for current screen tab
            ["#f8f8f2", "#f8f8f2"],  # font color for group names
            ["#bd93f9", "#bd93f9"],  # border line color for current tab
            ["#ff5555", "#ff5555"],  # border line color for 'other tabs' and color for 'odd widgets'
            ["#282a36", "#282a36"],  # color for the 'even widgets'
            ["#282a36", "#282a36"],  # window name
            ["#ffb86c", "#ffb86c"]
        ]
    ]

    return color_collection[n]

colors = color_picker(1)

def dmenu_select_according_to_theme():
    return "dmenu_run -i -fn 'Nerd Fonts' -nb " + colors[0][0] + " -nf " + colors[2][0] + " -sb " + colors[3][0] + " -sf " + colors[7][0]

#-----------------------------------------------groups---------------------------------------------
my_groups = [
    "term", "web", "vbox", "vlc", "nextcloud", "code", "whatsapp", "mail",
    "vcapps"
]

groups = [
    Group(my_groups[0], layout='monadtall'),
    Group(my_groups[1], layout='monadtall'),
    Group(my_groups[2], layout='monadtall'),
    Group(my_groups[3], layout='monadtall'),
    Group(my_groups[4], layout='monadtall'),
    Group(my_groups[5], layout='monadtall'),
    Group(my_groups[6], layout='monadtall'),
    Group(my_groups[7], layout='monadtall'),
    Group(my_groups[8], layout='monadtall')
]

mod = "mod4"
terminal = guess_terminal()

#---------------------------------------------keybindings--------------------------------------------
keys = [
    # Switch between windows
    Key([mod],
        "j",
        lazy.layout.up(),
        desc="Move focus up"),
    Key([mod],
        "k",
        lazy.layout.down(),
        desc="Move focus down"),

    # Swap windows  
    Key([mod, "shift"],
        "j",
        lazy.layout.shuffle_up(),
        desc="Move window up"),
    Key([mod, "shift"],
        "k",
        lazy.layout.shuffle_down(),
        desc="Move window down"),

    # make window normal
    Key([mod],
        "n",
        lazy.layout.normalize(),
        desc="Reset all window sizes"),

    # launch the default terminal
    Key([mod],
        "Return",
        lazy.spawn(terminal),
        desc="Launch terminal"),

    # toggle between different layouts
    Key([mod],
        "space",
        lazy.next_layout(),
        desc="Toggle between layouts"),

    # close the current application
    Key([mod, "shift"],
        "c",
        lazy.window.kill(),
        desc="Kill focused window"),

    # launch the web browser
    Key([mod],
        "b",
        lazy.spawn("brave"),
        desc="launch brave"),

    # launch gnu emacs using emacsclient if available otherwise
    # launch default emacs
    Key([mod],
        "d",
        lazy.spawn("emacsclient -c -n -a 'emacs'"),
        desc="launch emacs"),

    # restart qtile session
    Key([mod, "control"],
        "r",
        lazy.restart(),
        desc="Restart Qtile"),

    # launch the logout application
    Key([mod, "shift"],
        "q",
        lazy.spawn("neon-logout"),
        desc="Shutdown Qtile"),

    # launch virt-manager to manage virtual machines
    Key([mod],
        "v",
        lazy.spawn("virt-manager"),
        desc="launch virt-manager"),

    # launch common-websites.sh script for opening my common websites
    # which I use on day to day basis
    Key([mod],
        "l",
        lazy.spawn("common-websites.sh"),
        desc="common web links"),

    # launch article-viewer-convertor.sh script to download an article
    # in readable format for later viewing
    Key([mod],
        "i",
        lazy.spawn("article-viewer-convertor.sh"),
        desc="download any file using aria2"),

    # launch search-engines.py script to search through different search
    # engines and open it in the browser
    Key([mod],
        "w",
        lazy.spawn("search-engines.py"),
        desc="search the web through dmenu"),

    # launch the file manager
    Key([mod], 
            "p", 
            lazy.spawn("pcmanfm"), 
            desc="launch file manager"),

    # Launch the office suite application
    Key([mod],
        "o",
        lazy.spawn("onlyoffice-desktopeditors"),
        desc="launch office app"),

    # article viewer
    Key([mod], 
            "a", 
            lazy.spawn("phrack.py"), 
            desc="download phrack articles"),

    # Launch dmenu 
    Key([mod],
        'r',
        lazy.spawn(
            dmenu_select_according_to_theme()
        ),
        desc="run prompt")
]

dgroups_key_binder = simple_key_binder(mod)

#--------------------------------------------layouts-----------------------------------------
layouts = [
    # layout.Columns(border_focus_stack=['#d75f5f', '#8f3d3d'], border_width=4),
    layout.MonadTall(margin=5,
                     border_focus=colors[2],
                     border_normal=colors[5],
                     border_width=5),
    layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),#   # layout.Zoomy(),
]

#-----------------------------------------------------widgets-------------------------------------
widget_defaults = dict(font='Nerd Fonts', fontsize=12, padding=3)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(active=colors[2],
                                background=colors[0],
                                font="Nerd Fonts",
                                highlight_color=colors[5],
                                highlight_method='line',
                                inactive=colors[4]),
                widget.WindowName(background=colors[0],
                                  font="Nerd Fonts",
                                  foreground=colors[2],
                                  padding=1),
                widget.Systray(icon_size=20, padding=5, background=colors[0]),
                widget.TextBox(text="",
                               padding=0,
                               fontsize=50,
                               background=colors[0],
                               foreground=colors[1],
                               font="Nerd Fonts"),
                widget.Clock(background=colors[1],
                             foreground=colors[2],
                             update_interval=1.0,
                             format=' %Y-%m-%d %a   %I:%M %p'),
                widget.TextBox(text="",
                               padding=0,
                               fontsize=50,
                               background=colors[1],
                               foreground=colors[3],
                               font="Nerd Fonts"),
                widget.Battery(charge_char='',
                               discharge_char='',
                               notify_below=86,
                               update_interval=60,
                               background=colors[3],
                               foreground=colors[2],
                               format='{char}  {percent:2.0%}'),
                widget.TextBox(text="",
                               padding=0,
                               fontsize=50,
                               background=colors[3],
                               foreground=colors[6],
                               font="Nerd Fonts"),
                widget.CheckUpdates(
                    update_interval=60,
                    distro="Arch",
                    display_format="{updates}  Updates",
                    no_update_string="Nothing To Update",
                    colour_no_updates=colors[2],
                    colour_have_updates=colors[2],
                    background=colors[6],
                    fontsize=12,
                    font="Nerd Fonts"),
                widget.TextBox(text="",
                               padding=0,
                               fontsize=50,
                               background=colors[6],
                               foreground=colors[7],
                               font="Nerd Fonts"),
                widget.CurrentLayout(foreground=colors[2],
                                     background=colors[7],
                                     font="Nerd Fonts",
                                     fmt="",
                                     fontsize=20),
            ],
            24,
            opacity=0.90), ),
]

# Drag floating layouts.
mouse = [
    Drag([mod],
         "Button1",
         lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod],
         "Button3",
         lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_app_rules = []  # type: List
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

#-------------------------------------------autostart---------------------------------------
@hook.subscribe.startup_once
def autostart():
    processes = [['nitrogen', '--restore'], ['picom'], ['nm-applet'],
                 ['gnome-keyring'], ['polkit-dumb-agent'],
                 ['optimus-manager-qt'], ['pcmanfm', '-d'],
                 ['battery-notifier.sh'], ['gpg-connect-agent', '/bye']]

    for p in processes:
        subprocess.Popen(p)


# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
