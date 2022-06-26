# ------------------------------------------imports-------------------------------------------
from libqtile.widget import TextBox

# -----------------------------------------Custom-functions----------------------------------


def color_picker(colorscheme_name):
    color_collection = {
        "tomorrow-night":
            {
                "bg": "#1d1f21",
                "fg": "#c5c8c6",
                "1": "#cc6666",
                "2": "#b5bd68",
                "3": "#f0c674",
                "4": "#81a2be",
                "5": "#b294bb",
                "6": "#8abeb7",
                "7": "#ffffff"
            },
        "dracula":
            {
                "bg": "#44475a",
                "fg": "#8be9fd",
                "1": "#ff5555",
                "2": "#50fa7b",
                "3": "#ffb86c",
                "4": "#bd93f9",
                "5": "#ff79c6",
                "6": "#94a3a5",
                "7": "#ffffff"
            }
    }

    return color_collection[colorscheme_name]


def dmenu_select_according_to_theme(colors):
    return "dmenu_run -i -fn 'Nerd Fonts' -nb " + colors["bg"] + " -nf " + colors["fg"] + " -sb " + colors["2"] + " -sf " + colors["4"]


def group_selector(group_type):
    my_groups = {
        "named":
        [
            "term",
            "web",
            "virt",
            "mpv",
            "cloud",
            "code",
            "chat",
            "mail",
            "vc"
        ],
        "iconic":
        [
            "",
            "",
            "",
            "",
            "",
            "",
            "﬐",
            "",
            ""
        ]
    }
    return my_groups[group_type]


def unicode(unicodeChar, color1, color2):
    return TextBox(text=unicodeChar,
                   padding=0,
                   fontsize=23,
                   background=color1,
                   foreground=color2
                   )
