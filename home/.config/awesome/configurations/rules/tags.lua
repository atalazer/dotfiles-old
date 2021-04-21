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
                "URxvt"     , "XTerm" , "St"
            },
        },
        exect_any = {
            instance = {
                'Float', 'Editor', 'Files', 'Music',
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
            raise = true,
        },
    })
    -- Browsers and chats
    ruled.client.append_rule({
        id = "internet",
        rule_any = {
            class = {
                "TelegramDesktop",
                "firefox",
                "firefoxdevedition",
            },
        },
        properties = {
            tag = get_tag_name(2),
            switch_to_tags = true,
            titlebars_enabled = true,
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
        },
    })
    -- Docs
    ruled.client.append_rule({
        id = "docs",
        rule_any = {
            class = {
                "wps",
                "libreoffice",
                "DesktopEditors",
                "Zathura",
                "Atril",
            },
        },
        properties = {
            tag = get_tag_name(3),
            switch_to_tags = true,
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
            ontop = true,
            focus = awful.client.focus.filter,
            raise = true,
            titlebars_enabled = false,
            size_hints_honor = false,
            floating = true,
            skip_decoration = true,
            placement = awful.placement.maximize,
        },
    })
end)
