local awful = require("awful")
local ruled = require("ruled")

ruled.client.connect_signal("request::rules", function()
    -- Terminal {{{
    ruled.client.append_rule({
        rule_any = {
            instance = { "Alacritty", "kitty" },
        },
        properties = {
            tag = awful.screen.focused().tags[1].name,
            switch_to_tags = true,
        },
    })
    -- }}}

    -- Browser {{{
    ruled.client.append_rule({
        rule_any = {
            class = {
                "firefox",
                "Nightly",
            },
            instance = {
                "qutebrowser",
            },
        },
        except_any = {
            role = { "GtkFileChooserDialog" },
            instance = { "Toolkit" },
            type = { "dialog" },
        },
        properties = {
            tag = awful.screen.focused().tags[2].name,
            switch_to_tags = true,
        },
    })
    -- }}}

    -- Mail {{{
    ruled.client.append_rule({
        rule_any = {
            class = { "mail" },
            instance = { "mail" },
        },
        properties = {
            tag = awful.screen.focused().tags[3],
            switch_to_tags = true,
        },
    })
    -- }}}

    -- Chatting {{{
    ruled.client.append_rule({
        rule_any = {
            class = {
                "TelegramDesktop",
                "KotatogramDesktop",
                "whatsdesk",
            },
            name = {
                "Mozilla Firefox (Private Browsing)",
            },
        },
        properties = {
            tag = awful.screen.focused().tags[3],
            switch_to_tags = true,
        },
    })
    -- }}}

    -- File Manager {{{
    ruled.client.append_rule({
        rule_any = {
            class = { "Nemo", "Thunar" },
        },
        properties = {
            tag = awful.screen.focused().tags[3].name,
            switch_to_tags = true,
        },
    })
    -- }}}

    -- Office {{{
    ruled.client.append_rule({
        rule_any = {
            class = { "libreoffice", "DesktopEditors", "Wps" },
            instance = { "libreoffice", "DesktopEditors", "wps" },
        },
        properties = {
            tag = awful.screen.focused().tags[3].name,
            switch_to_tags = true,
        },
    })
    -- }}}

    -- Image editing {{{
    ruled.client.append_rule({
        rule_any = {
            class = {
                "Gimp",
                "Inkscape",
            },
        },
        properties = {
            tag = awful.screen.focused().tags[3].name,
            switch_to_tags = true,
        },
    })
    -- }}}

    -- Games {{{
    ruled.client.append_rule({
        rule_any = {
            class = {
                "osu!",
                "opsu",
                "opsu!",
            },
            instance = {
                "osu!",
                "opsu",
                "opsu!",
            },
        },
        properties = {
            tag = awful.screen.focused().tags[4].name,
            switch_to_tags = true,
        },
    })
    -- }}}

    -- Game clients/launchers {{{
    ruled.client.append_rule({
        rule_any = {
            class = { "Steam" },
            name = { "Steam" },
        },
        properties = {
            tag = awful.screen.focused().tags[5].name,
            switch_to_tags = true,
        },
    })
    -- }}}

    -- Miscellaneous {{{
    ruled.client.append_rule({
        rule_any = {
            class = {
                "htop",
                "monitoring",
            },
            instance = {
                "htop",
                "monitoring",
            },
        },
        except_any = {
            type = { "dialog" },
        },
        properties = {
            tag = awful.screen.focused().tags[10].name,
            switch_to_tags = false,
        },
    })
    -- }}}
end)
