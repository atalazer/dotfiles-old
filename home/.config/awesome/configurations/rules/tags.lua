local awful = require("awful")
local ruled = require("ruled")
local beautiful = require("beautiful")

local get_tag_name = function(index)
    t = awful.screen.focused().tags[index].name
    return t
end

ruled.client.connect_signal("request::rules", function()
    -- Terminal emulators
    ruled.client.append_rule({
        id = "terminals",
        rule_any = {
            class = {
                "Alacritty" , "kitty" , "Tym" ,
                "URxvt"     , "XTerm" , "st"
            },
        },
        properties = {
            tag = get_tag_name(1),
            switch_to_tags = true,
            titlebars_enabled = false,
            border_width = beautiful.border_width,
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
            placement = awful.placement.centered + awful.placement.no_overlap + awful.placement.no_offscreen,
        },
    })
    -- Browsers and chats
    ruled.client.append_rule({
        id = "internet",
        rule_any = {
            class = {
                "discord", "TelegramDesktop",
                "Navigator",
            },
        },
        properties = {
            tag = get_tag_name(2),
            switch_to_tags = true,
            titlebars_enabled = true,
            skip_decoration = false,
            placement = awful.placement.maximize + awful.placement.no_overlap + awful.placement.no_offscreen,
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
            tag = get_tag_name(3),
            switch_to_tags = true,
            titlebars_enabled = true,
            placement = awful.placement.maximize + awful.placement.no_overlap + awful.placement.no_offscreen,
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
            tag = get_tag_name(3),
            switch_to_tags = true,
            placement = awful.placement.maximize + awful.placement.no_overlap + awful.placement.no_offscreen,
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
            floating = true,
            placement = awful.placement.centered + awful.placement.no_overlap + awful.placement.no_offscreen,
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
            tag = get_tag_name(3),
            switch_to_tags = true,
            titlebars_enabled = true,
            floating = true,
            placement = awful.placement.centered + awful.placement.no_overlap + awful.placement.no_offscreen,
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
            -- tag = get_tag_name(4),
            -- switch_to_tags = true,
            titlebars_enabled = false,
            size_hints_honor = false,
            floating = true,
            skip_decoration = true,
            placement = awful.placement.centered
        },
    })
end)
