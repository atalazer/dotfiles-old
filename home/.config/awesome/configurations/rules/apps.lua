local awful = require("awful")
local ruled = require("ruled")

ruled.client.connect_signal("request::rules", function()
    -- Image viewers
    ruled.client.append_rule({
        id = "image_viewers",
        rule_any = {
            class = {
                "feh",
                "Pqiv",
                "Sxiv",
                "Viewnior",
            },
        },
        properties = {
            titlebars_enabled = true,
            floating = true,
            placement = awful.placement.centered,
        },
    })

    -- Virtual Keyboard
    ruled.client.append_rule({
        id = "virtual_keyboard",
        rule_any = {
            class = {
                "Florence",
                "Onboard",
            },
        },
        properties = {
            focusable = false,
            skip_taskbar = true,
            skip_decoration = true,
            titlebars_enabled = false,
            floating = true,
            sticky = true,
            above = true,
            placement = awful.placement.restore,
        },
    })
end)
