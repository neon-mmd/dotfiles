----------------------imports-------------------
local themes = {};

----------------------themes--------------------
function themes.pick_a_theme(colorscheme_name)
    local colorscheme = {
        ["tomorrow-night"] = {
            ["bg"] = "#1d1f21",
            ["fg"] = "#c5c8c6",
            ["1"] = "#cc6666",
            ["2"] = "#b5bd68",
            ["3"] = "#f0c674",
            ["4"] = "#81a2be",
            ["5"] = "#b294bb",
            ["6"] = "#8abeb7",
            ["7"] = "#ffffff"
        },
        ["dracula"] = {
            ["bg"] = "#44475a",
            ["fg"] = "#8be9fd",
            ["1"] = "#ff5555",
            ["2"] = "#50fa7b",
            ["3"] = "#ffb86c",
            ["4"] = "#bd93f9",
            ["5"] = "#ff79c6",
            ["6"] = "#94a3a5",
            ["7"] = "#ffffff"
        }
    }
    return colorscheme[colorscheme_name]
end

return themes
