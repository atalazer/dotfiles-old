-- vim: foldenable foldmethod=marker:
local awful = require("awful")
local ruled = require("ruled")
local beautiful = require("beautiful")

ruled.client.connect_signal("request::rules", function()
    -- Terminal {{{
    ruled.client.append_rule({
        rule_any = { instance = terminal_instance or { "Alacritty", "kitty", } },
        properties = {
            floating = false,
            titlebars_enabled = false,
        },
    })
    -- }}}

    -- Fixed terminal geometry for floating terminals {{{
    ruled.client.append_rule({
        rule_any = { class = terminal_class or { "Alacritty", "kitty", } },
        properties = {
            width = screen_width * 0.50,
            height = screen_height * 0.50,
            placement = centered_client_placement,
        },
    })
    -- }}}

    -- Browser{{{
    ruled.client.append_rule({
        rule_any = { class = browser_class or { "firefox", "Nightly", "Brave-browser" } },
        except_any = {
            role = { "GtkFileChooserDialog" },
            instance = { "Toolkit" },
            type = { "dialog" },
        },
        properties = {
            floating = true,
            placement = centered_client_placement,
        },
    })

    ruled.client.append_rule({
        rule_any = { instance = browser_instance or { "qutebrowser", "brave-browser" } },
        properties = {
            maximized = true,
            titlebars_enabled = false,
        },
    })
    -- }}}

    -- Picture in Picture {{{
    ruled.client.append_rule({
        rule_any = { name = { "Picture-in-Picture", }, },
        properties = {
            titlebars_enabled = false,
            floating = true,
            above = true,
            sticky = true,
            skip_decoration = true,
            placement = awful.placement.top_right,
        },
    })
    -- }}}

    -- Chatting {{{
    ruled.client.append_rule({
        rule_any = { class = chatting_class or { "TelegramDesktop", "KotatogramDesktop", "whatsdesk" }, },
        properties = {
            floating = true,
            titlebars_enabled = true,
            placement = centered_client_placement,
        },
    })
    -- }}}

    -- Urgent - Browser and Chatting {{{
    ruled.client.append_rule({
        rule_any = { class = browser_class or { "firefox", "Nightly", "qutebrowser" }, },
        callback = function(c)
            c:connect_signal("property::urgent", function()
                if c.urgent then
                    c:jump_to()
                end
            end)
        end,
    })
    -- }}}

    -- File managers {{{
    ruled.client.append_rule({
        rule_any = {
            class = file_manager_class or { "Nemo", "Thunar", "file", },
            instance = { "file" },
        },
        except_any = { type = { "dialog" } },
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
        rule_any = { class = file_archive_class or { "Engrampa", "File-roller" } },
        properties = {
            titlebars_enabled = true,
            floating = true,
            width = screen_width * 0.70,
            height = screen_height * 0.70,
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
        properties = {
            floating = true,
            width = screen_width * 0.60,
            height = screen_height * 0.60
        },
    })
    -- }}}

    -- Video Player {{{
    ruled.client.append_rule({
        rule_any = { class = video_player_class or { "mpv", "vlc", "MPlayer" } },
        properties = {
            floating = true,
            titlebars_enabled = true,
            width = screen_width * 0.5,
            height = screen_height * 0.5,
            placement = centered_client_placement,
        },
        callback = function(c)
            -- Make it floating, ontop and move it out of the way if the current tag is maximized
            if awful.layout.get(awful.screen.focused()) == awful.layout.suit.max then
                c.width = screen_width * 0.5
                c.height = screen_height * 0.5
                awful.placement.bottom_right(c, {
                    honor_padding = true,
                    honor_workarea = true,
                    margins = { bottom = beautiful.useless_gap * 2, right = beautiful.useless_gap * 2 },
                })
            end
            c:connect_signal("property::fullscreen", function()
                if not c.fullscreen then
                    c.ontop = true
                end
            end)
        end,
    })
    -- }}}

    -- Image viewers {{{
    ruled.client.append_rule({
        rule_any = {
            class = image_viewer_class or { "feh", "Sxiv", "Viewnior" },
            name = { "Media viewer" },
        },
        properties = {
            floating = true,
            raise = true,
            titlebars_enabled = true,
            placement = centered_client_placement,
            width = screen_width * 0.75,
            height = screen_height * 0.80,
        },
    })
    -- }}}

    -- Office {{{
    ruled.client.append_rule({
        rule_any = {
            class = office_class or { "DesktopEditors", "Wps", },
            instance = office_instance or { "libreoffice", "DesktopEditors", "wps", },
        },
        properties = {
            titlebars_enabled = false,
            floating = true,
            placement = centered_client_placement,
        },
        callback = function(c)
            awful.placement.maximize(c)
        end,
    })
    -- }}}

    -- PDF viewers {{{
    ruled.client.append_rule({
        rule_any = { class = pdf_viewer_class or { "zathura" } },
        properties = {
            floating = true,
            titlebars_enabled = true,
            placement = centered_client_placement,
            width = screen_width * 0.40,
            height = screen_height * 0.90,
        },
    })
    -- }}}

    -- Gucharmap {{{
    ruled.client.append_rule({
        rule_any = { class = { "Gucharmap" }, name = { "gucharmap" } },
        properties = {
            floating = true,
            raise = true,
            titlebars_enabled = true,
            placement = centered_client_placement,
            width = screen_width * 0.75,
            height = screen_height * 0.80,
        },
    })
    -- }}}

    -- Password Manager {{{
    ruled.client.append_rule({
        rule_any = { class = password_manager_class or { "KeePassXC" } },
        properties = {
            floating = true,
            width = screen_width * 0.8,
            height = screen_height * 0.8,
            placement = centered_client_placement,
        },
    })
    -- }}}

    -- Steam guard {{{
    ruled.client.append_rule({
        rule = { name = "Steam Guard - Computer Authorization Required" },
        properties = { floating = true },
    })
    -- }}}

    -- Color Picker {{{
    ruled.client.append_rule({
        rule_any = {
            class = { "Gcolor3", "Gcolor2", "Gpick" },
            name = { "Color Picker" },
        },
        properties = {
            floating = true,
            titlebars_enabled = false,
        },
    })
    -- }}}

    -- Dragon drag and drop utility {{{
    ruled.client.append_rule({
        rule_any = { class = { "Dragon-drag-and-drop", "Dragon" } },
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
        properties = {
            floating = true,
            width = screen_width * 0.45,
            height = screen_height * 0.8,
        },
    })
    -- }}}

    -- Screen Mirroring (scrcpy) {{{
    ruled.client.append_rule({
        rule_any = { class = { "QtScrcpy", "scrcpy" } },
        properties = {
            titlebars_enabled = true,
            floating = true,
            ontop = true,
        },
    })

    -- }}}

    -- Oomox {{{
    ruled.client.append_rule({
        rule_any = { class = { "Oomox" } },
        properties = {
            titlebars_enabled = false,
            floating = true,
            width = screen_width * 0.45,
            height = screen_height * 0.8,
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
            floating = true,
            width = screen_width * 0.8,
            height = screen_height * 0.85,
            placement = centered_client_placement,
        },
    })
    -- }}}

    -- Editor {{{
    ruled.client.append_rule({
        rule_any = {
            instance = { "emacs", "editor" },
            class = { "Emacs", "editor" },
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

    -- Scratchpad {{{
    ruled.client.append_rule({
        rule_any = {
            instance = { "scratchpad", "markdown_input" },
            class = { "scratchpad", "markdown_input" },
        },
        properties = {
            skip_taskbar = true,
            floating = true,
            width = screen_width * 0.7,
            height = screen_height * 0.75,
            placement = centered_client_placement,
        },
    })
    -- }}}
end)
