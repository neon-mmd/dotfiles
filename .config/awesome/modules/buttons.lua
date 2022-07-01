----------------------imports-----------------
local awful         = require("awful");
local gears         = require("gears");
local mytable       = awful.util.table or gears.table -- 4.{0,1} compatibility
local easykey       = require("modules.Ezkey")
local buttons = {};

----------------------buttons-----------------
function buttons.define_tag_buttons()
    return mytable.join(
        easykey.EzButton("1", function(t) t:view_only() end),
        easykey.EzButton("M-1",
            function(t)
                if client.focus then
                    client.focus:move_to_tag(t)
                end
            end),
        easykey.EzButton("3", awful.tag.viewtoggle),
        easykey.EzButton("M-3",
            function(t)
                if client.focus then
                    client.focus:toggle_tag(t)
                end
            end),
        easykey.EzButton("4", function(t) awful.tag.viewnext(t.screen) end),
        easykey.EzButton("5", function(t) awful.tag.viewprev(t.screen) end)
)
end

function buttons.define_task_buttons()
    return mytable.join(
    easykey.EzButton("1",
        function(c)
            if c == client.focus then
                c.minimized = true
            else
                c:emit_signal("request::activate", "tasklist", { raise = true })
            end
        end),
    easykey.EzButton("3", function() awful.menu.client_list({ theme = { width = 250 } }) end),
    easykey.EzButton("4", function() awful.client.focus.byidx(1) end),
    easykey.EzButton("5", function() awful.client.focus.byidx(-1) end)
)
end

function buttons.define_client_buttons()
    return mytable.join(
        easykey.EzButton("M-3", function(c)
            c:emit_signal("request::activate", "mouse_click", { raise = true })
        end),
        easykey.EzButton("M-1", function(c)
            c:emit_signal("request::activate", "mouse_click", { raise = true })
            awful.mouse.client.move(c)
        end),
        easykey.EzButton("M-3", function(c)
            c:emit_signal("request::activate", "mouse_click", { raise = true })
            awful.mouse.client.resize(c)
        end)
)
end

return buttons
