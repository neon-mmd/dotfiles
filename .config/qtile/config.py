from os import path
from numpy import array
from subprocess import run
from libqtile.dgroups import simple_key_binder
from libqtile import hook
from libqtile.layout import Floating
from libqtile.config import Screen
from libqtile.utils import guess_terminal
from modules.functions import color_picker, group_selector
from modules.widgets import widget_creation
from modules.groups import groups
from modules.layouts import layout_creation
from modules.behaviour import mouse_behavior, program_behaviour
from modules.keybindings import define_keybindings

# -----------------------------------------------groups---------------------------------------------
# [
#    iconic
#    named
# ]

my_groups = tuple(group_selector("iconic"))[0]

# [
#   dracula
#   tomorrow-night
#   nord
#   gruvbox-dark
#   monokai
#   oceanic-next
#   solarized-dark
#   solarized-light
# ]

colors = tuple(color_picker("nord"))[0]
groups = tuple(groups(my_groups))[0]
mod = "mod4"
terminal = guess_terminal()
font = "Iosevka Nerd Font"

# ---------------------------------------------keybindings--------------------------------------------
keys = tuple(define_keybindings(terminal, colors, font))[0]
dgroups_key_binder = simple_key_binder(mod)

# --------------------------------------------layouts-----------------------------------------
layouts = tuple(layout_creation(colors))[0]

# -----------------------------------------------------widgets-------------------------------------
widget_defaults = dict(font=font, fontsize=15, padding=10)
extension_defaults = widget_defaults.copy()
screens = array([Screen(top=tuple(widget_creation(colors))[0])])
mouse = tuple(mouse_behavior(mod))[0]
dgroups_app_rules = []  # type: list
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
floating_layout = Floating(float_rules=tuple(program_behaviour())[0])
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True

# -------------------------------------------autostart---------------------------------------


@hook.subscribe.startup_once
def autostart():
    home = path.expanduser(r"~/.config/autostart-apps-wm/autostart.sh")
    run((home))


wmname = "LG3D"  # ---> compulsory otherwise qtile won't work
