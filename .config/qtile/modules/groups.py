# -----------------------------------------------imports--------------------------------------------
from libqtile.config import Group


# -----------------------------------------------groups---------------------------------------------
def groups(my_groups):
    groups = []
    for i, j in enumerate(my_groups, 1):
        groups.append(Group(name=str(i), layout="monadtall", label=j))
    return groups
