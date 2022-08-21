-------------------------imports-----------------------------
local tagnames = {};

-------------------------tagnames----------------------------
function tagnames.pick_a_tagnames_style(style)
    local tagStyle = {
        named =
        {
            "term",
            "web",
            "vbox",
            "mpv",
            "nextcloud",
            "code",
            "whatsapp",
            "mail",
            "vcapps"
        },
        iconic =
        {
            "  ",
            "  ",
            "  ",
            "  ",
            "  ",
            "  ",
            "  ",
            "  "
        }
    }
    return tagStyle[style]
end

return tagnames
