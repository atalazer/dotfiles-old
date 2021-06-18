local awful = require("awful")
local ruled = require("ruled")
local beautiful = require("beautiful")

local decorations = require("decorations")

ruled.client.connect_signal("request::rules", function()

    -- All clients will match this rule {{{
    ruled.client.append_rule({
        id = "global",
        rule = {},
        properties = {
            size_hints_honor = false,
            honor_workarea = true,
            honor_padding = true,
            maximized = false,
            raise = true,
            focus = awful.client.focus.filter,
            keys = keys.clientkeys,
            buttons = keys.clientbuttons,
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            -- titlebars_enabled = beautiful.titlebars_enabled,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap + awful.placement.no_offscreen ,
        },
    })
    -- }}}

    -- Dialogs {{{
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
            placement = centered_client_placement ,
        },
    })
    -- }}}

    -- Modals {{{
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
            placement = centered_client_placement,
        },
    })
    -- }}}

    -- Utilities {{{
    ruled.client.append_rule({
        id = "utility",
        rule_any = {
            type = { "utility" },
        },
        properties = {
            titlebars_enabled = false,
            floating = true,
            skip_decoration = true,
            placement = centered_client_placement,
        },
    })
    -- }}}

    -- Splash {{{
    ruled.client.append_rule({
        id = "splash",
        rule_any = {
            type = { "splash" },
        },
        properties = {
            titlebars_enabled = false,
            round_corners = false,
            floating = true,
            above = true,
            skip_decoration = true,
            placement = centered_client_placement,
        },
        callback = function(c)
            decorations.hide(c)
        end,
    })
    -- }}}

    -- Floating {{{
    ruled.client.append_rule({
        id = "floating",
        rule_any = {
            instance = {
                "file_progress",
                "Popup",
                "plugin-container",
                "exe",
            },
            role = {
                "pop-up",
                "GtkFileChooserDialog",
                "conversation",
            },
        },
        properties = {
            titlebars_enabled = true,
            raise = true,
            floating = true,
            placement = centered_client_placement,
        },
    })
    -- }}}

end)

require("configs.rules.apps")
require("configs.rules.tags")

