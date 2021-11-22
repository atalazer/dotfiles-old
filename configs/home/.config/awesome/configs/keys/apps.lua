local awful = require("awful")
local gears = require("gears")

local apps = require("configs.apps")
local l = require("configs.keys.lib")

local keys = gears.table.join(
    -- ===================================== Prompt {{{
    l.set_keymap("Apps: Prompt", {
        ["W|a"] = { "rofi-center", "Rofi Center" },
        ["W|c"] = { "rofi-calc", "Calculator" },
        -- ["W|c"] = { "rofi-cheatsheets", "Cheatsheets" },
        ["W|d"] = { "rofi -show", "Rofi" },
        ["W|e"] = { "rofi-edit", "Edit Config" },
        ["W|g"] = { "rofi-spotlight", "Global Menu" },
        ["W|m"] = { "rofi-mpv -f", "Search Video and Play It" },
        ["W|n"] = { apps.network, "Network Prompt" },
        ["W|p"] = { apps.password, "Password Prompt" },
        ["W|r"] = { "rofi-app", "App Launcher" },
        ["W|t"] = { "rofi-translate -i", "Translate" },
        ["W|F12"] = { apps.record, "Record Menu" },
        ["W|Insert"] = { apps.clipboard, "Clipboard Manager" },
        ["WS|t"] = { "rofi-translate -c", "Translate From Clipboard" },
        ["WS|Print"] = { "shot -o", "Shot Image to Text" },
        ["WS|Insert"] = { "rofi-translate -m", "Translate from Image" },
    }),

    -- }}}

    -- ===================================== GUI Apps {{{

    l.set_keymap("Apps: GUI", {
        ["W|f"] = { "Thunar", "Open File Manager" },
        ["W|w"] = { apps.browser, "Open Browser" },
    }),

    -- }}}

    -- ===================================== Terminal {{{

    l.set_keymap("Apps: CLI", {
        ["W|Return"] = { apps.terminal, "Open Terminal" },
        ["WS|e"] = { apps.editor, "Editor" },
        ["WS|f"] = { apps.file_manager, "File Manager" },
        ["WS|m"] = { apps.music, "Music Player" },
        ["WS|w"] = { apps.mail, "E-Mail Client" },
        ["WS|Return"] = {
            function()
                awful.spawn(user.floating_terminal, { floating = true })
            end,
            "Open Floating Terminal",
        },
    }),

    -- }}}

    -- ===================================== Scratchpad {{{
    l.set_keymap("Apps: Scratchpad", {
        ["W|i"] = { function() awesome.emit_signal("scratch::input") end, "Markdown Input", },
        ["W|\\"] = { function() awesome.emit_signal("scratch::term") end, "Ninja Terminal", },
        ["WS|f"] = { function() awesome.emit_signal("scratch::file") end, "File Manager", },
        ["WS|m"] = { function() awesome.emit_signal("scratch::music") end, "Music Player", },
        -- ["WS|w"]= { function() awesome.emit_signal("scratch::chat") end, "Chatting Apps"},
    })

    -- }}}
)

return keys
