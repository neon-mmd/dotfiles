# -----------------------------------------------------imports-------------------------------------
from libqtile.layout.floating import Floating
from libqtile.config import Click, Drag, Match
from libqtile.lazy import lazy


# -----------------------------------------------------widgets-------------------------------------
def mouse_behavior(mod):
    return [
        Drag(
            [mod],
            "Button1",
            lazy.window.set_position_floating(),
            start=lazy.window.get_position(),
        ),
        Drag(
            [mod],
            "Button3",
            lazy.window.set_size_floating(),
            start=lazy.window.get_size(),
        ),
        Click([mod], "Button2", lazy.window.bring_to_front()),
    ]


def program_behaviour():
    return [
        *Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
        Match(title="brave"),  # web browser
        Match(title="pinentry-gtk-2"),
        Match(title="Pinentry-gtk-2"),
    ]
