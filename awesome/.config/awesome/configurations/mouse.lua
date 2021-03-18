local awful = require('awful')

local W = 'Mod4'
local A = 'Mod1'
local C = "Control"
local S = "Shift"

awful.mouse.append_global_mousebindings({
    awful.button({}, 3, function () mymainmenu:toggle() end),
    awful.button({}, 4, awful.tag.viewprev),
    awful.button({}, 5, awful.tag.viewnext),
})

client.connect_signal("request::default_mousebindings", function()
    awful.mouse.append_client_mousebindings({
        awful.button({ }, 1, function (c)
            c:activate { context = "mouse_click" }
        end),
        awful.button({ W, C }, 1, function (c)
            c:activate { context = "mouse_click", action = "mouse_move"  }
        end),
        awful.button({ W, S }, 1, function (c)
            c:activate { context = "mouse_click", action = "mouse_resize"}
        end),
    })
end)

