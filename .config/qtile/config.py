import os
from subprocess import run
from libqtile.dgroups import simple_key_binder
from libqtile import hook
from typing import List
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

my_groups = group_selector("iconic")

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

colors = color_picker("dracula")
groups = groups(my_groups)
mod = "mod4"
terminal = guess_terminal()
font = "FiraCode Nerd Font"

# ---------------------------------------------keybindings--------------------------------------------
keys = define_keybindings(terminal, colors, font)
dgroups_key_binder = simple_key_binder(mod)

# --------------------------------------------layouts-----------------------------------------
layouts = layout_creation(colors)

# -----------------------------------------------------widgets-------------------------------------
widget_defaults = dict(font=font, fontsize=15, padding=10)
extension_defaults = widget_defaults.copy()
screens = [Screen(top=widget_creation(colors))]
mouse = mouse_behavior(mod)
dgroups_app_rules = []  # type: List
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
floating_layout = Floating(float_rules=program_behaviour())
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True

# -------------------------------------------autostart---------------------------------------


@ hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser(r'~/.config/autostart-apps-wm/autostart.sh')
    run([home])


wmname = "LG3D"  # ---> compulsory otherwise qtile won't work
