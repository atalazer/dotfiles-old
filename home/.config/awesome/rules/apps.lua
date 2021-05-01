local awful = require("awful")
local beautiful = require("beautiful")
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
            width = screen_width * 0.45,
            height = screen_height * 0.6,
            titlebars_enabled = false
        },
    })
    -- }}}

    -- Video Player {{{
    ruled.client.append_rule({ 
        rule = { class = "mpv" },
        properties = { 
            floating = true,
            raise = true,
            titlebars_enabled = true,
            width = screen_width * 0.7,
            height = screen_height * 0.75,
            placement = centered_client_placement,
        }
    })
    -- }}}

    -- Image viewers {{{
    ruled.client.append_rule({ 
        rule_any = {
            class = {
                "feh",
                "Sxiv",
                "Viewnior", "viewnior",
            },
        },
        properties = {
            floating = true,
            raise = true,
            titlebars_enabled = true,
            placement = centered_client_placement,
            width = screen_width * 0.7,
            height = screen_height * 0.75,
        },
    })
    -- }}}

    -- File managers {{{
    ruled.client.append_rule({ 
        rule_any = {
            class = {
                "Nemo",
                "Thunar",
            },
        },
        except_any = {
            type = { "dialog" },
        },
        properties = { floating = true, width = screen_width * 0.45, height = screen_height * 0.55 },
    })
    -- }}}

    -- File chooser dialog {{{
    ruled.client.append_rule({ 
        rule_any = { role = { "GtkFileChooserDialog" } },
        properties = { floating = true, width = screen_width * 0.55, height = screen_height * 0.65 },
    })
    -- }}}

    -- Dragon drag and drop utility{{{
    ruled.client.append_rule({ 
        rule_any = {
            class = {
                "Dragon-drag-and-drop",
                "Dragon",
            },
        },
        properties = {
            floating = true,
            ontop = true,
            sticky = true,
            width = screen_width * 0.3,
        },
        callback = function(c)
            awful.placement.bottom_right(c, {
                honor_padding = true,
                honor_workarea = true,
                margins = { bottom = beautiful.useless_gap * 2, right = beautiful.useless_gap * 2 },
            })
        end,
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
            skip_taskbar = true,
            floating = true,
            ontop = false,
            minimized = true,
            sticky = false,
            raise = true,
            width = screen_width * 0.7,
            height = screen_height * 0.75,
            placement = centered_client_placement,
        },
    })
    -- }}}

    -- System Monitoring {{{
    ruled.client.append_rule({ 
        rule_any = {
            instance = {"htop", "monitoring"},
            class = {"htop", "monitoring"},
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
            raise = true,
            skip_taskbar = false,
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
            class = {
                "music",
            },
            instance = {
                "music",
            },
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
        rule_any = { class = { "Visualizer" } },
        properties = {
            floating = true,
            maximized_horizontal = true,
            sticky = true,
            ontop = false,
            skip_taskbar = true,
            below = true,
            focusable = false,
            height = screen_height * 0.40,
            opacity = 0.6,
            titlebars_enabled = false,
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
