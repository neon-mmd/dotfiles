# -----------------------------------------------------imports-------------------------------------
from libqtile.bar import Bar
from libqtile.widget import (
    GroupBox,
    WindowName,
    Systray,
    Clock,
    CheckUpdates,
    CurrentLayout,
)
from modules.functions import unicode, check_battery

# -----------------------------------------------------widgets-------------------------------------

face_style = "arrow"


def widget_creation(colors):
    yield Bar(
        [
            GroupBox(
                active=colors["4"],
                background=colors["2"],
                highlight_color=colors["fg"],
                highlight_method="block",
                disable_drag=True,
                inactive=colors["bg"],
            ),
            tuple(unicode(colors["bg"], colors["2"], "right", face_style))[0],
            WindowName(background=colors["bg"], foreground=colors["fg"], padding=10),
            tuple(unicode(colors["bg"], colors["3"], "left", face_style))[0],
            Systray(icon_size=20, padding=5, background=colors["3"]),
            tuple(unicode(colors["3"], colors["5"], "left", face_style))[0],
            Clock(
                background=colors["5"],
                foreground=colors["bg"],
                update_interval=1.0,
                format="  %Y-%m-%d %a    %I:%M %p",
            ),
            tuple(unicode(colors["5"], colors["2"], "left", face_style))[0],
            tuple(check_battery(colors["bg"], colors["2"]))[0],
            tuple(unicode(colors["2"], colors["1"], "left", face_style))[0],
            CheckUpdates(
                update_interval=60,
                distro="Arch",
                display_format="{updates}   Updates",
                no_update_string="Nothing To Update",
                colour_no_updates=colors["fg"],
                colour_have_updates=colors["bg"],
                background=colors["1"],
            ),
            tuple(unicode(colors["1"], colors["6"], "left", face_style))[0],
            CurrentLayout(
                foreground=colors["bg"],
                background=colors["6"],
                fmt="",
                fontsize=20,
            ),
        ],
        24,
        opacity=0.85,
    )
