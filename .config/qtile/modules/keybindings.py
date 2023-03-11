# ---------------------------------------------imports-----------------------------------------------
from numpy import array
from libqtile.lazy import lazy
from libqtile.config import EzKey as Key
from modules.functions import dmenu_select_according_to_theme


# ---------------------------------------------keybindings--------------------------------------------

# modifier_keys = {
# 'M': 'mod4',
# 'A': 'mod1',
# 'S': 'shift',
# 'C': 'control',
# }


def define_keybindings(terminal, colors, font):
    yield array(
        [
            # Switch between windows
            Key("M-j", lazy.layout.up(), desc="Move focus up"),
            Key("M-k", lazy.layout.down(), desc="Move focus down"),
            # Swap windows
            Key("M-S-j", lazy.layout.shuffle_up(), desc="Move window up"),
            Key("M-S-k", lazy.layout.shuffle_down(), desc="Move window down"),
            # make window normal
            Key("M-n", lazy.layout.normalize(), desc="Reset all window sizes"),
            # launch the default terminal
            Key("M-<Return>", lazy.spawn(terminal), desc="Launch terminal"),
            # toggle between different layouts
            Key("M-<space>", lazy.next_layout(), desc="Toggle between layouts"),
            # close the current application
            Key("M-S-c", lazy.window.kill(), desc="Kill focused window"),
            # launch the web browser
            Key("M-b", lazy.spawn("qutebrowser"), desc="launch neon-browser"),
            # launch gnu emacs using emacsclient if available otherwise
            # launch default emacs
            Key("M-d", lazy.spawn("emacsclient -c -n -a 'emacs'"), desc="launch emacs"),
            # restart qtile session
            Key("M-C-r", lazy.restart(), desc="Restart Qtile"),
            # launch the logout application
            Key("M-S-q", lazy.spawn("neon-logout"), desc="Shutdown Qtile"),
            # launch virt-manager to manage virtual machines
            Key("M-v", lazy.spawn("virtualbox"), desc="launch virtualbox"),
            # launch common-websites script for opening my common websites
            # which I use on day to day basis
            Key("M-c", lazy.spawn("common-websites"), desc="common web links"),
            # launch article-viewer-convertor script to download an article
            # in readable format for later viewing
            Key(
                "M-i",
                lazy.spawn("article-viewer-convertor"),
                desc="download any file using aria2",
            ),
            # launch search-engines script to search through different search
            # engines and open it in the browser
            Key(
                "M-w", lazy.spawn("search-engines"), desc="search the web through dmenu"
            ),
            # launch themes-changer script to change the theme
            Key("M-S-t", lazy.spawn("themes-changer"), desc="theme changing script"),
            # launch flatpak-launcher script to launch flatpak applications
            Key("M-a", lazy.spawn("flatpak-launcher"), desc="launch flatpak apps"),
            # launch the file manager
            Key("M-p", lazy.spawn("pcmanfm"), desc="launch file manager"),
            # Launch the office suite application
            Key("M-o", lazy.spawn("onlyoffice-desktopeditors"), desc="launch office app"),
            # Launch dmenu
            Key(
                "M-r",
                lazy.spawn(tuple(dmenu_select_according_to_theme(colors, font))[0]),
                desc="run prompt",
            ),
            # close all notifications
            Key(
                "A-S-k",
                lazy.spawn("dunstctl close-all"),
                desc="close all notifications",
            ),
            # toggle touchpad on or off
            Key("A-S-t", lazy.spawn("touchpad"), desc="toggle touchpad"),
        ]
    )
