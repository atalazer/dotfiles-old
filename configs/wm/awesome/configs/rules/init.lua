local awful = require("awful")
local ruled = require("ruled")
local beautiful = require("beautiful")

-- local keys = require("configs.keys")
local decorations = require("decorations")

-- Global variable
-- Required by apps and tags rules
-- ===== internet related
browser_class = { "firefox", "Nightly", "Brave-browser" }
browser_instance = { "qutebrowser", "brave-browser", "Navigator" }
chatting_class = { "TelegramDesktop", "KotatogramDesktop", "whatsdesk" }
-- ===== documents/media related
pdf_viewer_class = { "Okular", "Zathura", "Evince" }
image_editor_class = { "Gimp", "Inkscape", }
image_viewer_class = { "feh", "Sxiv", "Viewnior" }
video_player_class = { "mpv", "vlc", "MPlayer" }
office_class = { "DesktopEditors", "Wps", "obsidian" }
office_instance = { "libreoffice", "DesktopEditors", "wps", "obsidian" }
-- ===== others
terminal_instance = { "Alacritty", "kitty" }
terminal_class = { "Alacritty", "kitty", }
file_manager_class = { "Nemo", "Thunar", "file" }
file_archive_class = { "Engrampa", "File-roller" }
password_manager_class = { "KeePassXC" }
game_class = { "osu!", "opsu", "opsu!" }
game_instance = { "osu!", "opsu", "opsu!" }

ruled.client.connect_signal("request::rules", function()
    -- All clients will match this rule {{{
    ruled.client.append_rule({
        id = "global",
        rule = {},
        properties = {
            -- maximized = false,
            -- floating = true,
            -- titlebars_enabled = true,
            raise = true,
            focus = awful.client.focus.filter,
            -- keys = keys.clientkeys,
            -- buttons = keys.clientbuttons,
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap + awful.placement.no_offscreen,
        },
    })
    -- }}}

    -- Normal {{{
    ruled.client.append_rule({
        id = "normal",
        rule_any = {
            type = { "normal" },
        },
        properties = {
            titlebars_enabled = true,
            floating = true,
            placement = centered_client_placement,
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
            placement = centered_client_placement,
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
                "pinentry",
            },
            class = {
                "Sxiv",
                "SimpleScreenRecorder",
                "Anki",
                "lxappearance",
                "Lxappearance",
            },
            name = {
                "Event Tester", -- xev.
                "Open File", -- file picker
                "Media viewer", -- new telegram image viewer
            },
            role = {
                "GtkFileChooserDialog", -- file picker
                "pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
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

    -- Urgent - Dialogs {{{
    ruled.client.append_rule({
        rule_any = {
            type = { "dialog" },
        },
        callback = function(c)
            c:connect_signal("property::urgent", function()
                if c.urgent then
                    c:jump_to()
                end
            end)
        end,
    })
    -- }}}
end)

require("configs.rules.apps")
require("configs.rules.tags")
