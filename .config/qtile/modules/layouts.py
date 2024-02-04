# --------------------------------------------layouts-----------------------------------------
from libqtile.layout import MonadTall, Max


# --------------------------------------------layouts-----------------------------------------
def layout_creation(colors):
    return [
        # layout.Columns(border_focus_stack=['#d75f5f', '#8f3d3d'], border_width=4),
        MonadTall(
            margin=5,
            border_focus=colors["fg"],
            border_normal=colors["bg"],
            border_width=5,
        ),
        Max(),
        # layout.Stack(num_stacks=2),
        # layout.Bsp(),
        # layout.Matrix(),
        # layout.MonadWide(),
        # layout.RatioTile(),
        # layout.Tile(),
        # layout.TreeTab(),
        # layout.VerticalTile(),
        # layout.Zoomy(),
    ]
