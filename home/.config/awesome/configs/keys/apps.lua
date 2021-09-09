local awful = require("awful")
local gears = require("gears")

local apps = require("configs.apps")
local l = require("configs.keys.lib")

local keys = gears.table.join(
    -- ===================================== Prompt {{{
    l.keys("Apps: Prompt", { superkey }, {
        a = { "rofi-center", "Rofi Center" },
        c = { "rofi-calc", "Calculator" },
        d = { "rofi -show", "Rofi" },
        e = { "rofi-edit", "Edit Config" },
        g = { "rofi-spotlight", "Global Menu" },
        n = { apps.network, "Network Prompt" },
        p = { apps.password, "Password Prompt" },
        r = { "rofi-app", "App Launcher" },
        t = { "rofi-translate -i", "Translate" },
        F12 = { apps.record, "Record Menu" },
        Insert = { apps.clipboard, "Clipboard Manager" },
        Print = { "shot -i", "Shot Menu" },
    }),

    l.keys("Apps: Prompt", { superkey, shiftkey }, {
        t = { "rofi-translate -c", "Translate From Clipboard" },
        Print = { "shot -o", "Shot Image to Text" },
        Insert = { "rofi-translate -m", "Translate from Image" }
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
