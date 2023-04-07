from os import path
from typing import Dict, List, Tuple
from subprocess import run
from libqtile.dgroups import simple_key_binder
from libqtile import hook
from libqtile.layout import Floating
from libqtile.config import Click, Drag, Group, Screen
from libqtile.layout.max import Max
from libqtile.layout.xmonad import MonadTall
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

my_groups: Tuple[str, str, str, str, str, str, str, str, str] = group_selector("named")

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

colors: Dict[str, str] = color_picker("catppuccin-mocha")
groups: Tuple[Group, Group, Group, Group, Group, Group, Group, Group, Group] = groups(
    my_groups
)
mod: str = "mod4"
terminal: str | None = guess_terminal()
font: str = "Iosevka Nerd Font"

# ---------------------------------------------keybindings--------------------------------------------
keys: Tuple = define_keybindings(terminal, colors, font)
dgroups_key_binder = simple_key_binder(mod)

# --------------------------------------------layouts-----------------------------------------
layouts: Tuple[MonadTall, Max] = layout_creation(colors)

# -----------------------------------------------------widgets-------------------------------------
widget_defaults: Dict = dict(font=font, fontsize=15, padding=10)
extension_defaults: Dict = widget_defaults.copy()
screens: Tuple = (Screen(top=widget_creation(colors)),)
mouse: Tuple[Drag, Drag, Click] = mouse_behavior(mod)
dgroups_app_rules: List = []  # type: list
follow_mouse_focus: bool = False
bring_front_click: bool = False
cursor_warp: bool = False
floating_layout: Floating = Floating(float_rules=program_behaviour())
auto_fullscreen: bool = True
focus_on_window_activation: str = "smart"
reconfigure_screens: bool = True
auto_minimize: bool = True

# -------------------------------------------autostart---------------------------------------


@hook.subscribe.startup_once
def autostart() -> None:
    global_autostart: str = path.expanduser(r"~/.config/autostart-apps-wm/autostart.sh")
    local_autostart: str = path.expanduser(r"~/.config/qtile/autostart.sh")
    run((global_autostart))
    run((local_autostart))


wmname: str = "LG3D"  # ---> compulsory otherwise qtile won't work
