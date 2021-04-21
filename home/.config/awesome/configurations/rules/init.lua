local awful = require("awful")
local ruled = require("ruled")
local beautiful = require("beautiful")

ruled.client.connect_signal("request::rules", function()
    -- All clients will match this rule.
    ruled.client.append_rule({
        id = "global",
        rule = {},
        properties = {
            border_width = 0,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap + awful.placement.no_offscreen,
        },
    })

    ruled.client.append_rule({
        id = "round_clients",
        rule_any = {
            type = {
                "normal",
                "dialog",
            },
        },
        except_any = {
            name = { "Discord Updater" },
        },
        properties = {
            shape = beautiful.client_shape_rounded,
            placement = awful.placement.centered + awful.placement.no_overlap + awful.placement.no_offscreen,
        },
    })

    -- Titlebar rules
    ruled.client.append_rule({
        id = "titlebars",
        rule_any = {
            type = {
                "normal",
                "dialog",
                "modal",
                "utility",
            },
        },
        properties = {
            titlebars_enabled = true,
        },
    })

    -- Dialogs
    ruled.client.append_rule({
        id = "dialog",
        rule_any = {
            type = { "dialog" },
            class = { "Wicd-client.py", "calendar.google.com" },
        },
        properties = {
            titlebars_enabled = true,
            floating = true,
            above = true,
            skip_decoration = true,
            placement = awful.placement.centered,
        },
    })

    -- Modals
    ruled.client.append_rule({
        id = "modal",
        rule_any = {
            type = { "modal" },
        },
        properties = {
            titlebars_enabled = true,
            floating = true,
            above = true,
            skip_decoration = true,
            placement = awful.placement.centered,
        },
    })

    -- Utilities
    ruled.client.append_rule({
        id = "utility",
        rule_any = {
            type = { "utility" },
        },
        properties = {
            titlebars_enabled = false,
            floating = true,
            skip_decoration = true,
            placement = awful.placement.centered,
        },
    })

    -- Splash
    ruled.client.append_rule({
        id = "splash",
        rule_any = {
            type = { "splash" },
            name = { "Discord Updater" },
        },
        properties = {
            titlebars_enabled = false,
            round_corners = false,
            floating = true,
            above = true,
            skip_decoration = true,
            placement = awful.placement.centered,
        },
    })

    -- Floating
    ruled.client.append_rule({
        id = "floating",
        rule_any = {
            role = {
                "_NET_WM_STATE_FULLSCREEN",
                "AlarmWindow",
                "ConfigManager",
                "pop-up",
                "GtkFileChooserDialog",
            },
            instance = {
                "file_progress",
                "Popup",
                "nm-connection-editor",
                "plugin-container",
                "exe",
                "Float",
                "Editor",
                "Files",
                "Music",
            },
            class = {
                "Mugshot",
                "Gcolor3",
                "Pulseeffects",
                "scrcpy",
            },
            name = {
                "Event Tester",
                "Open File",
                "Media viewer",
            },
        },
        properties = {
            titlebars_enabled = true,
            raise = true,
            floating = true,
            placement = awful.placement.centered,
        },
    })

    -- Fullscreen
    ruled.client.append_rule({
        id = "fullscreen",
        rule_any = {
            name = {
                "Firefox Developer Edition",
                "Home",
            },
        },
        properties = {
            floating = true,
            placement = awful.placement.maximize + awful.placement.no_overlap + awful.placement.no_offscreen,
        },
    })

end)

require(P.config.rules .. ".tags")
require(P.config.rules .. ".apps")
