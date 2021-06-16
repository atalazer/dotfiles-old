local awful = require("awful")
local ruled = require("ruled")

ruled.client.connect_signal("request::rules", function()
    -- Fixed terminal geometry for floating terminals {{{
    ruled.client.append_rule({
        rule_any = {
            class = {
                "Alacritty",
                "Termite",
                "kitty",
                "st-256color",
                "st",
                "URxvt",
            },
        },
        properties = {
            width = screen_width * 0.50,
            height = screen_height * 0.50,
            titlebars_enabled = false,
            placement = centered_client_placement,
        },
    })
    -- }}}

    -- Video Player {{{
    ruled.client.append_rule({
        rule = { class = "mpv", "vlc" },
        properties = {
            floating = true,
            raise = true,
            titlebars_enabled = true,
            width = screen_width * 0.7,
            height = screen_height * 0.75,
            placement = centered_client_placement,
        },
    })
    -- }}}

    -- Image viewers {{{
    ruled.client.append_rule({
        rule_any = {
            class = { "feh", "Sxiv", "Viewnior" },
            name = { "Media viewer" },
        },
        properties = {
            floating = true,
            raise = true,
            titlebars_enabled = true,
            placement = centered_client_placement,
            width = screen_width * 0.70,
            height = screen_height * 0.60,
        },
    })
    -- }}}

    -- Image viewers {{{
    ruled.client.append_rule({
        rule_any = {
            class = { "Okular", "Zathura", "Evince" },
        },
        properties = { floating = true },
    })
    -- }}}

    -- File managers {{{
    ruled.client.append_rule({
        rule_any = {
            class = {
                "Nemo", "Thunar", "file",
            },
            instance = { "file" },
        },
        except_any = {
            type = { "dialog" },
        },
        properties = {
            titlebars_enabled = true,
            floating = true,
            width = screen_width * 0.8,
            height = screen_height * 0.8,
            placement = centered_client_placement,
        },
    })
    -- }}}

    -- File Archive {{{
    ruled.client.append_rule({
        rule_any = {
            class = { "Engrampa", "File-roller" },
        },
        properties = {
            titlebars_enabled = true,
            floating = true,
            placement = centered_client_placement,
        },
    })
    -- }}}

    -- File chooser dialog {{{
    ruled.client.append_rule({
        rule_any = {
            role = { "GtkFileChooserDialog" },
            name = { "Open File" },
        },
        properties = { floating = true, width = screen_width * 0.60, height = screen_height * 0.60 },
    })
    -- }}}

    -- Color Picker {{{
    ruled.client.append_rule({
        rule_any = {
            class = { "Gcolor3", "Gcolor2", "Gpick" },
            instance = { "gcolor3", "gcolor2", "gpick" },
            name = { "Color Picker" },
        },
        properties = { floating = true, titlebars_enabled = false },
    })
    -- }}}

    -- Dragon drag and drop utility {{{
    ruled.client.append_rule({
        rule_any = {
            class = { "Dragon-drag-and-drop", "Dragon" },
        },
        properties = {
            floating = true,
            ontop = true,
            sticky = true,
            placement = centered_client_placement,
        },
    })
    -- }}}

    -- Password Manager {{{
    ruled.client.append_rule({
        rule_any = { class = { "KeePassXC" } },
        properties = {
            floating = true,
            width = screen_width * 0.8,
            height = screen_height * 0.8,
            placement = centered_client_placement,
        },
    })
    -- }}}

    -- Pavucontrol {{{
    ruled.client.append_rule({
        rule_any = { class = { "Pavucontrol" } },
        properties = { floating = true, width = screen_width * 0.45, height = screen_height * 0.8 },
    })
    -- }}}

    -- Scratchpad {{{
    ruled.client.append_rule({
        rule_any = {
            instance = {
                "scratchpad",
                "markdown_input",
            },
            class = {
                "scratchpad",
                "markdown_input",
            },
        },
        properties = {
            floating = true,
            minimized = true,
            width = screen_width * 0.7,
            height = screen_height * 0.75,
            placement = centered_client_placement,
        },
    })
    -- }}}

    -- System Monitoring {{{
    ruled.client.append_rule({
        rule_any = {
            instance = { "htop", "monitoring" },
            class = { "htop", "monitoring" },
        },
        properties = {
            skip_taskbar = true,
            floating = true,
            raise = true,
            width = screen_width * 0.8,
            height = screen_height * 0.85,
            placement = centered_client_placement,
        },
    })
    -- }}}

    -- E-mail {{{
    ruled.client.append_rule({
        rule_any = {
            instance = { "email" },
            class = { "email" },
        },
        properties = {
            titlebars_enabled = true,
            floating = true,
            width = screen_width * 0.7,
            height = screen_height * 0.75,
            placement = centered_client_placement,
        },
    })
    -- }}}

    -- Music clients {{{
    ruled.client.append_rule({
        rule_any = {
            class = { "music" },
            instance = { "music" },
        },
        properties = {
            floating = true,
            width = screen_width * 0.45,
            height = screen_height * 0.50,
            placement = centered_client_placement,
        },
    })
    -- }}}

    -- Visualizer {{{
    ruled.client.append_rule({
        rule_any = { class = { "Visualizer" }, instance = { "Visualizer" } },
        properties = {
            ontop = false,
            focusable = false,
            floating = true,
            sticky = true,
            below = true,
            skip_taskbar = true,
            titlebars_enabled = false,
            width = screen_width * 0.7,
            height = screen_height * 0.2,
            opacity = 0.6,
        },
        callback = function(c)
            awful.placement.bottom(c)
        end,
    })
    -- }}}

    -- Steam guard {{{
    ruled.client.append_rule({
        rule = { name = "Steam Guard - Computer Authorization Required" },
        properties = { floating = true },
    })
    -- }}}
end)
