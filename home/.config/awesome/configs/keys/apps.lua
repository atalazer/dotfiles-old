local awful = require("awful")
local gears = require("gears")

local apps = require("configs.apps")
local l = require("configs.keys.lib")

local keys = gears.table.join(
    -- ===================================== Prompt {{{
    l.keys("Apps: Prompt", { superkey }, {
        a = { "rofi_center", "Rofi Center" },
        c = { "rofi_calc", "Calculator" },
        d = { "rofi -show", "Rofi" },
        e = { "rofi_edit", "Edit Config" },
        g = { "rofi_global_menu", "Global Menu" },
        n = { apps.network, "Network Prompt" },
        p = { apps.password, "Password Prompt" },
        r = { "rofi_app_menu", "App Launcher" },
        t = { "rofi_translate -i", "Translate" },
        F12 = { apps.record, "Record Menu" },
        Insert = { apps.clipboard, "Clipboard Manager" },
        Print = { "shot -i", "Screenshot Menu" },
    }),

    l.keys("Apps: Prompt", { superkey, shiftkey }, {
        t = { "rofi_translate -c", "Translate From Clipboard" },
    }),

    -- }}}

    -- ===================================== GUI Apps {{{

    l.keys("Apps: GUI", {superkey}, {
        f = { "Thunar", "Open File Manager" },
        w = { apps.browser, "Open Browser" },
    }),

    -- }}}

    -- ===================================== Terminal {{{

    l.keys("Apps: CLI", {superkey}, {
        Return = { apps.terminal, "Open Terminal" },
    }),

    l.keys("Apps: CLI", {superkey, shiftkey}, {
        e = { apps.editor, "Editor" },
        f = { apps.file_manager, "File Manager" },
        m = { apps.music, "Music Player" },
        w = { apps.mail, "E-Mail Client" },
        ["Return"] = { function()
            awful.spawn(user.floating_terminal, { floating = true })
        end, "Open Floating Terminal" },
    }),

    -- }}}

    -- ===================================== Scratchpad {{{
    l.keys("Apps: Scratchpad", { superkey }, {
        i = { function()
            awesome.emit_signal("scratch::input")
        end, "Markdown Input"},
        ["\\"] = { function()
            awesome.emit_signal("scratch::term")
        end, "Ninja Terminal"},
    }),

    l.keys("Apps: Scratchpad", { superkey, shiftkey }, {
        f = { function()
            awesome.emit_signal("scratch::file")
        end, "File Manager"},
        m = { function()
            awesome.emit_signal("scratch::music")
        end, "Music Player"},
        -- w = { function()
        --     awesome.emit_signal("scratch::chat")
        -- end, "Chatting Apps"},
    })

    -- }}}
)

return keys
