# -----------------------------------------------imports--------------------------------------------
from numpy import array
from libqtile.config import Group, Match

# -----------------------------------------------groups---------------------------------------------
def groups(my_groups):
    yield array(
        [
            Group(my_groups[0], layout="monadtall"),
            Group(
                my_groups[1],
                layout="monadtall",
                matches=Match(wm_class=array("qutebrowser")),
            ),
            Group(
                my_groups[2],
                layout="monadtall",
                matches=Match(wm_class=array("VirtualBox Manager")),
            ),
            Group(
                my_groups[3], layout="monadtall", matches=Match(wm_class=array("mpv"))
            ),
            Group(
                my_groups[4],
                layout="monadtall",
                matches=Match(wm_class=array("nextcloud")),
            ),
            Group(
                my_groups[5], layout="monadtall", matches=Match(wm_class=array("emacs"))
            ),
            Group(
                my_groups[6],
                layout="monadtall",
                matches=Match(wm_class=array("telegram-desktop")),
            ),
            Group(
                my_groups[7],
                layout="monadtall",
                matches=Match(wm_class=array("mailspring")),
            ),
            Group(my_groups[8], layout="monadtall"),
        ]
    )
