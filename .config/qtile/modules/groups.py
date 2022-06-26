# -----------------------------------------------imports--------------------------------------------
from libqtile.config import Group, Match


# -----------------------------------------------groups---------------------------------------------
def groups(my_groups):
    return [
        Group(
            my_groups[0],
            layout='monadtall'
        ),
        Group(
            my_groups[1],
            layout='monadtall',
            matches=[Match(wm_class=["brave"])]
        ),
        Group(
            my_groups[2],
            layout='monadtall',
            matches=[Match(wm_class=["virt-manager"])]
        ),
        Group(
            my_groups[3],
            layout='monadtall'
        ),
        Group(
            my_groups[4],
            layout='monadtall'
        ),
        Group(
            my_groups[5],
            layout='monadtall',
            matches=[Match(wm_class=["emacs"])]
        ),
        Group(
            my_groups[6],
            layout='monadtall'
        ),
        Group(
            my_groups[7],
            layout='monadtall'
        ),
        Group(
            my_groups[8],
            layout='monadtall'
        )
    ]
