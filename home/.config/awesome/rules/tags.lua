local awful = require("awful")
local ruled = require("ruled")

ruled.client.connect_signal("request::rules", function()
    -- Terminal {{{
    ruled.client.append_rule({
        rule_any = {
            instance = {
                "Alacritty",
                "Termite",
                "kitty",
                "st-256color",
                "st",
                "URxvt",
            },
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
        properties = { tag = awful.screen.focused().tags[3] },
    })
    -- }}}

    -- Chatting {{{
    ruled.client.append_rule({
        rule_any = {
            class = { "TelegramDesktop" },
        },
        properties = { tag = awful.screen.focused().tags[3] },
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
            class = { "libreoffice", "DesktopEditors" },
            instance = { "libreoffice", "DesktopEditors" },
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
                "osu!", "opsu", "opsu!"
            },
            instance = {
                "osu!", "opsu", "opsu!"
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
            class = {
                "Steam",
                "battle.net.exe",
                "Lutris",
            },
            name = {
                "Steam",
            },
        },
        properties = {
            tag = awful.screen.focused().tags[5].name,
            switch_to_tags = false,
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
