# ------------------------------------------imports-------------------------------------------
from libqtile.widget import TextBox, Battery
from subprocess import getoutput

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
            },
        "nord":
        {
            "bg" : "#2e3440",
            "fg" : "#d8dee9",
            "1" : "#3b4252",
            "2" : "#bf616a",
            "3" : "#a3be8c",
            "4" : "#ebcb8b",
            "5" : "#81a1c1",
            "6" : "#b48ead",
            "7" : "#ffffff"
        },
        "gruvbox-dark":
        {
            "bg" : "#282828",
            "fg" : "#ebdbb2",
            "1" : "#cc241d",
            "2" : "#98971a",
            "3" : "#d79921",
            "4" : "#458588",
            "5" : "#b16286",
            "6" : "#689d6a",
            "7" : "#ffffff"
        },
        "monokai":
        {
            "bg" : "#403e41",
            "fg" : "#fcfcfa",
            "1" : "#ff6188",
            "2" : "#a9dc76",
            "3" : "#ffd866",
            "4" : "#fc9867",
            "5" : "#ab9df2",
            "6" : "#78dce8",
            "7" : "#ffffff"
        },
        "oceanic-next":
        {
            "bg" : "#1b2b34",
            "fg" : "#d8dee9",
            "1" : "#343D46",
            "2" : "#ec5f67",
            "3" : "#99c794",
            "4" : "#fac863",
            "5" : "#6699cc",
            "6" : "#c594c5",
            "7" : "#ffffff"
        },
        "solarized-dark" :
        {
            "bg" : "#002b36",
            "fg" : "#839496",
            "1" : "#073642",
            "2" : "#dc322f",
            "3" : "#859900",
            "4" : "#b58900",
            "5" : "#268bd2",
            "6" : "#d33682",
            "7" : "#ffffff"
        },
        "solarized-light" :
        {
            "bg" : "#fdf6e3",
            "fg" : "#657b83",
            "1" : "#073642",
            "2" : "#dc322f",
            "3" : "#859900",
            "4" : "#b58900",
            "5" : "#268bd2",
            "6" : "#d33682",
            "7" : "#ffffff"
        }
    }

    return color_collection[colorscheme_name]


def dmenu_select_according_to_theme(colors, font):
    return "dmenu_run -i -fn '" + font + ":pixelsize=17' -nb " + colors["bg"] + " -nf " + colors["fg"] + " -sb " + colors["2"] + " -sf " + colors["4"]


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
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            ""
        ]
    }
    return my_groups[group_type]

def theme_style(direction, Type):
    face_direction = {
        "left" : 0,
        "right" : 1
    }
    styles = {
        "arrow" : ["\uE0B2", "\uE0B0"],
        "semi-circle" : ["\ue0b6", "\ue0b4"],
        "bottom-right-triangle" : ["\ue0ba", "\ue0b8"],
        "top-right-triangle" : ["\ue0be", "\ue0bc"],
        "vertical" : [" ", ""]
    }

    if Type == "arrow":
        return styles["arrow"][face_direction[direction]]
    elif Type == "semi-circle":
        return styles["semi-circle"][face_direction[direction]]
    elif Type == "bottom-right-triangle":
        return styles["bottom-right-triangle"][face_direction[direction]]
    elif Type == "top-right-triangle":
        return styles["top-right-triangle"][face_direction[direction]]
    else:
        return styles["vertical"][face_direction[direction]]

def unicode(color1, color2, direction, Type):

    padding_amount = 0
    
    if direction == "left":
        if Type == "arrow":
            padding_amount = 0
        elif Type == "semi-circle":
            padding_amount = 0
        elif Type == "bottom-right-triangle":
            padding_amount = 12
        elif Type == "top-right-triangle":
            padding_amount = 12
        else:
            padding_amount = 0
    else:
        if Type == "arrow":
            padding_amount = 0
        elif Type == "semi-circle":
            padding_amount = 0
        elif Type == "bottom-right-triangle":
            padding_amount = 0
        elif Type == "top-right-triangle":
            padding_amount = 0
        else:
            padding_amount = 0

    return TextBox(text=theme_style(direction, Type),
                   padding=padding_amount,
                   fontsize=23,
                   background=color1,
                   foreground=color2
                   )

def check_battery(colorbg, color2):
    if getoutput("acpi | grep 'Battery'") != '':
        return Battery(charge_char='',
                       discharge_char='',
                       notify_below=86,
                       update_interval=60,
                       background=color2,
                       foreground=colorbg,
                       format='{char} {percent:2.0%}'
                       )
    else:
        return TextBox(text='  ',
                       fontsize=20,
                       background=color2,
                       foreground=colorbg
                       ) 
