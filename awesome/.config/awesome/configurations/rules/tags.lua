local awful = require("awful")
local gears = require("gears")
local ruled = require("ruled")
local beautiful = require("beautiful")

ruled.client.connect_signal("request::rules", function()
    -- Terminal emulators
    ruled.client.append_rule({
        id = "terminals",
        rule_any = {
            class = {
                "Alacritty",
                "kitty",
                "Tym",
                "URxvt",
                "XTerm",
            },
        },
        properties = {
            tag = "1",
            switch_to_tags = true,
            titlebars_enabled = false,
            size_hints_honor = false,
        },
    })

    -- Development
    ruled.client.append_rule({
        id = "development",
        rule_any = {
            class = {
                "Tk",
            },
        },
        properties = {
            floating = true,
            focus = awful.client.focus.filter,
            raise = true,
            placement = awful.placement.centered,
        },
    })
    -- Browsers and chats
    ruled.client.append_rule({
        id = "internet",
        rule_any = {
            class = {
                "discord",
                "TelegramDesktop",
                "firefox",
            },
        },
        properties = {
            tag = "2",
            switch_to_tags = true,
            titlebars_enabled = true,
            placement = awful.placement.centered,
        },
    })
    -- File managers
    ruled.client.append_rule({
        id = "files",
        rule_any = {
            class = {
                "Files",
                "Thunar",
                "Engrampa",
                "Nemo",
                "nemo",
            },
        },
        properties = {
            tag = "3",
            switch_to_tags = true,
            titlebars_enabled = true,
            placement = awful.placement.no_overlap + awful.placement.no_offscreen,

        },
    })
    -- Docs
    ruled.client.append_rule({
        id = "docs",
        rule_any = {
            class = {
                "wps",
                "libreoffice",
                "Zathura",
                "Atril",
            },
        },
        properties = {
            tag = "3",
            switch_to_tags = true,
            titlebars_enabled = false,
        },
    })
    -- Multimedia
    ruled.client.append_rule({
        id = "multimedia",
        rule_any = {
            class = {
                "mpv",
                "Audacious",
            },
        },
        properties = {
            titlebars_enabled = true,
            size_hints_honor = false,
            skip_decoration = true,
            floating = true,
            placement = awful.placement.centered,
        },
    })
    -- Graphics
    ruled.client.append_rule({
        id = "graphics",
        rule_any = {
            class = {
                "Inkscape",
            },
        },
        properties = {
            tag = "3",
            switch_to_tags = true,
        },
    })
    -- Games
    ruled.client.append_rule({
        id = "games",
        rule_any = {
            class = {
                "osu!",
                "opsu!",
                "itch",
            },
        },
        properties = {
            -- tag = "4",
            -- switch_to_tags = true,
            titlebars_enabled = false,
            size_hints_honor = false,
            floating = true,
            skip_decoration = true,
            placement = awful.placement.centered,
        },
    })
end)
