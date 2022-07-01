-------------imports---------------------
local awful = require("awful");
local easykey = {};

---------------------Ezkey---------------------
local function split(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local split_string = {}
    for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
        table.insert(split_string, str)
    end
    return split_string
end

local function check_if_number(key)
    if (pcall(tonumber(key))) then
        return tostring(key)
    else
        return key
    end
end

local modifier_keys = {
    C = "Control",
    M = "Mod4",
    A = "Mod1",
    S = "Shift",
}

local function Ezkey_to_key_convertor(keychord)
    local splited_string = split(keychord, "-");
    local last = check_if_number(splited_string[#splited_string]);
    table.remove(splited_string, #splited_string);
    print(tostring(splited_string[3]), last)
    local key_table = {};
    for i in ipairs(splited_string) do
        table.insert(key_table, modifier_keys[ splited_string[i] ])
    end
    return key_table, last, 3
end

function easykey.EzKey(keychord, callback, desc, grp)
    local keyTable, last = Ezkey_to_key_convertor(keychord)
    return awful.key(keyTable,
        last,
        callback,
        {
            description = desc,
            group = grp
        }
    );
end

function easykey.EzButton(keychord, callback)
    local keyTable, last = Ezkey_to_key_convertor(keychord)
    return awful.button(keyTable,
        last,
        callback
    );
end

return easykey
