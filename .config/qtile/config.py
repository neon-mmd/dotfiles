from os import path
from subprocess import run
from libqtile.dgroups import simple_key_binder
from libqtile import hook
from libqtile.layout.floating import Floating
from libqtile.config import Screen
from libqtile.utils import guess_terminal
from modules import (
    color_picker,
    group_selector,
    widget_creation,
    groups,
    layout_creation,
    mouse_behavior,
    program_behaviour,
    define_keybindings,
)

# -----------------------------------------------groups---------------------------------------------
# [
#    iconic
#    named
# ]

my_groups = group_selector("named")

# [
#   dracula
#   tomorrow-night
#   nord
#   gruvbox-dark
#   monokai
#   oceanic-next
#   solarized-dark
#   solarized-light
#   catppuccin-mocha
# ]

colors = color_picker("tomorrow-night")
groups = groups(my_groups)
mod = "mod4"
terminal = guess_terminal()
font = "Iosevka Nerd Font"

# ---------------------------------------------keybindings--------------------------------------------
dgroups_key_binder = simple_key_binder(mod)
keys = define_keybindings(terminal, colors, font, groups)

# --------------------------------------------layouts-----------------------------------------
layouts = layout_creation(colors)

# -----------------------------------------------------widgets-------------------------------------
widget_defaults = dict(font=font, fontsize=15, padding=10)
extension_defaults = widget_defaults.copy()
screens = [Screen(top=widget_creation(colors))]
mouse = mouse_behavior(mod)
dgroups_app_rules = []  # type: list
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
floating_layout = Floating(float_rules=program_behaviour())
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wl_input_rules = None

# -------------------------------------------autostart---------------------------------------


@hook.subscribe.startup_once
def autostart():
    global_autostart = path.expanduser(r"~/.config/autostart-apps-wm/autostart.sh")
    local_autostart = path.expanduser(r"~/.config/qtile/autostart.sh")
    run((global_autostart))
    run((local_autostart))


wmname = "LG3D"  # ---> compulsory otherwise qtile won't work
