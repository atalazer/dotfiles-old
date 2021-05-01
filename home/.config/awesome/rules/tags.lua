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
                -- "qutebrowser",
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

    -- Chatting {{{
    ruled.client.append_rule({
        rule_any = {
            class = {
                "discord",
                "TelegramDesktop",
                "Signal",
                "Slack",
                "TeamSpeak 3",
                "zoom",
                "weechat",
                "6cord",
            },
        },
        properties = { tag = awful.screen.focused().tags[3] }
    })
    -- }}}

    -- Games {{{
    ruled.client.append_rule({
        rule_any = {
            class = {
                "portal2_linux",
                "csgo_linux64",
                "dota2",
                "dontstarve_steam",
                "Wine",
            },
            instance = {
                "love.exe",
                "synthetik.exe",
                "pathofexile_x64steam.exe",
                "leagueclient.exe",
                "glyphclientapp.exe",
            },
        },
        properties = { 
            tag = awful.screen.focused().tags[4].name,
            switch_to_tags = false,
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

    -- Image editing {{{
    ruled.client.append_rule({
        rule_any = {
            class = {
                "Gimp",
                "Inkscape",
            },
        },
        properties = { 
            tag = awful.screen.focused().tags[7].name,
            switch_to_tags = true,
        },
    })
    -- }}}

    -- Miscellaneous {{{
    ruled.client.append_rule({
        rule_any = {
            class = {
                "torrent",
                "Transmission",
                "Deluge",
                "VirtualBox Manager",
                "KeePassXC",
            },
            instance = {
                "torrent",
                "qemu",
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
