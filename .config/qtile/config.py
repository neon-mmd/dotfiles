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

my_groups = next(group_selector("iconic"))

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

colors = next(color_picker("oceanic-next"))
groups = next(groups(my_groups))
mod = "mod4"
terminal = guess_terminal()
font = "Iosevka Nerd Font"

# ---------------------------------------------keybindings--------------------------------------------
keys = next(define_keybindings(terminal, colors, font))
dgroups_key_binder = simple_key_binder(mod)

# --------------------------------------------layouts-----------------------------------------
layouts = next(layout_creation(colors))

# -----------------------------------------------------widgets-------------------------------------
widget_defaults = dict(font=font, fontsize=15, padding=10)
extension_defaults = widget_defaults.copy()
screens = array([Screen(top=next(widget_creation(colors)))])
mouse = tuple(mouse_behavior(mod))[0]
dgroups_app_rules = []  # type: list
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
floating_layout = Floating(float_rules=next(program_behaviour()))
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True

# -------------------------------------------autostart---------------------------------------


@hook.subscribe.startup_once
def autostart():
    global_autostart = path.expanduser(r"~/.config/autostart-apps-wm/autostart.sh")
    local_autostart = path.expanduser(r"~/.config/qtile/autostart.sh")
    run((global_autostart))
    run((local_autostart))


wmname = "LG3D"  # ---> compulsory otherwise qtile won't work
