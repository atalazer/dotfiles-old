local awful = require("awful")

local keys = {}

-- Mod keys
superkey = "Mod4"
altkey = "Mod1"
ctrlkey = "Control"
shiftkey = "Shift"

keys.global = require(... ..".global")
keys.apps = require(... ..".apps")
keys.controller = require(... ..".controller")
keys.layout = require(... ..".layout")
keys.tags = require(... ..".tags")

keys.button = require(... ..".button")
keys.client = require(... ..".client")
keys.desktopbuttons = require(... ..".desktop")

keys.init = function()
    awful.mouse.append_global_mousebindings({
        keys.desktopbuttons
    })

    awful.keyboard.append_global_keybindings({
        keys.global,
        keys.apps,
        keys.controller,
        keys.layout,
        keys.tags,
        keys.client.globals
    })

    client.connect_signal("request::default_keybindings", function()
        awful.keyboard.append_client_keybindings({
            keys.client.clientkeys
        })
    end)

    client.connect_signal("request::default_mousebindings", function()
        awful.mouse.append_client_mousebindings(
            {
                keys.button.client
            })
    end)
end

keys.tasklist_buttons = keys.button.tasklist
keys.taglist_buttons = keys.button.taglist
keys.titlebar_buttons = keys.button.titlebar

return keys
