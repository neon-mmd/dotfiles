# -----------------------------------------------------imports-------------------------------------
from libqtile.bar import Bar
from libqtile.widget import GroupBox, WindowName, Systray, Clock, Battery, CheckUpdates, CurrentLayout
from modules.functions import unicode


# -----------------------------------------------------widgets-------------------------------------
def widget_creation(colors):
    return Bar(
        [
            GroupBox(active=colors["4"],
                     background=colors["2"],
                     highlight_color=colors["fg"],
                     highlight_method='block',
                     disable_drag=True,
                     inactive=colors["bg"]
                     ),
            unicode("\uE0B0", colors["bg"], colors["2"]),
            WindowName(background=colors["bg"],
                       foreground=colors["fg"],
                       padding=10
                       ),
            unicode("\uE0B2", colors["bg"], colors["3"]),
            Systray(icon_size=20,
                    padding=5,
                    background=colors["3"]
                    ),
            unicode("\uE0B2", colors["3"], colors["5"]),
            Clock(background=colors["5"],
                  foreground=colors["bg"],
                  update_interval=1.0,
                  format=' %Y-%m-%d %a  %I:%M %p'
                  ),
            unicode("\uE0B2", colors["5"], colors["2"]),
            Battery(charge_char='',
                    discharge_char='',
                    notify_below=86,
                    update_interval=60,
                    background=colors["2"],
                    foreground=colors["bg"],
                    format='{char}  {percent:2.0%}'
                    ),
            unicode("\uE0B2", colors["2"], colors["1"]),
            CheckUpdates(
                update_interval=60,
                distro="Arch",
                display_format="{updates}  Updates",
                no_update_string="Nothing To Update",
                colour_no_updates=colors["fg"],
                colour_have_updates=colors["bg"],
                background=colors["1"]
            ),
            unicode("\uE0B2", colors["1"], colors["6"]),
            CurrentLayout(foreground=colors["bg"],
                          background=colors["6"],
                          fmt="",
                          fontsize=20),
        ],
        24,
        opacity=0.85
    )
