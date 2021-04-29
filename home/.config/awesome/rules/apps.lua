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

    -- File chooser dialog {{{
    ruled.client.append_rule({ 
        rule_any = { role = { "GtkFileChooserDialog" } },
        properties = { floating = true, width = screen_width * 0.55, height = screen_height * 0.65 },
    })
    -- }}}

    -- Pavucontrol {{{
    ruled.client.append_rule({ 
        rule_any = { class = { "Pavucontrol" } },
        properties = { floating = true, width = screen_width * 0.45, height = screen_height * 0.8 },
    })
    -- }}}

    -- Galculator {{{
    ruled.client.append_rule({ 
        rule_any = { class = { "Galculator" } },
        except_any = { type = { "dialog" } },
        properties = { floating = true, width = screen_width * 0.2, height = screen_height * 0.4 },
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

    -- Screenruler {{{
    ruled.client.append_rule({ 
        rule_any = { class = { "Screenruler" } },
        properties = { border_width = 0, floating = true, ontop = true, titlebars_enabled = false },
        callback = function(c)
            awful.placement.centered(c, { honor_padding = true, honor_workarea = true })
        end,
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
            width = screen_width * 0.7,
            height = screen_height * 0.75,
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
            skip_taskbar = false,
            floating = true,
            width = screen_width * 0.7,
            height = screen_height * 0.75,
        },
    })
    -- }}}

    -- Music clients (usually a terminal running ncmpcpp) {{{
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
        },
    })
    -- }}}

    -- Image viewers {{{
    ruled.client.append_rule({ 
        rule_any = {
            class = {
                "feh",
                "Sxiv",
            },
        },
        properties = {
            floating = true,
            width = screen_width * 0.7,
            height = screen_height * 0.75,
        },
        callback = function(c)
            awful.placement.centered(c, { honor_padding = true, honor_workarea = true })
        end,
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

    -- MPV {{{
    ruled.client.append_rule({ 
        rule = { class = "mpv" },
        properties = {},
        callback = function(c)
            -- Make it floating, ontop and move it out of the way if the current tag is maximized
            if awful.layout.get(awful.screen.focused()) == awful.layout.suit.max then
                c.floating = true
                c.ontop = true
                c.width = screen_width * 0.30
                c.height = screen_height * 0.35
                awful.placement.bottom_right(c, {
                    honor_padding = true,
                    honor_workarea = true,
                    margins = { bottom = beautiful.useless_gap * 2, right = beautiful.useless_gap * 2 },
                })
            end

            -- Restore `ontop` after fullscreen is disabled
            -- Sorta tries to fix: https://github.com/awesomeWM/awesome/issues/667
            c:connect_signal("property::fullscreen", function()
                if not c.fullscreen then
                    c.ontop = true
                end
            end)
        end,
    })
    -- }}}

end)
