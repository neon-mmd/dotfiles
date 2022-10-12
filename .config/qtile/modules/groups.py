# -----------------------------------------------imports--------------------------------------------
from numpy import array
from libqtile.config import Group, Match

# -----------------------------------------------groups---------------------------------------------
def groups(my_groups):
    return array(
        [
            Group(my_groups[0], layout="monadtall"),
            Group(
                my_groups[1],
                layout="monadtall",
                matches=[Match(wm_class=["qutebrowser"])],
            ),
            Group(
                my_groups[2],
                layout="monadtall",
                matches=[Match(wm_class=["virt-manager"])],
            ),
            Group(my_groups[3], layout="monadtall", matches=[Match(wm_class=["mpv"])]),
            Group(
                my_groups[4],
                layout="monadtall",
                matches=[Match(wm_class=["nextcloud"])],
            ),
            Group(
                my_groups[5], layout="monadtall", matches=[Match(wm_class=["emacs"])]
            ),
            Group(
                my_groups[6],
                layout="monadtall",
                matches=[Match(wm_class=["telegram-desktop"])],
            ),
            Group(
                my_groups[7],
                layout="monadtall",
                matches=[Match(wm_class=["mailspring"])],
            ),
            Group(my_groups[8], layout="monadtall"),
        ]
    )
