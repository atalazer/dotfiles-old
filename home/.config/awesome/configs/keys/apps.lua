local awful = require("awful")
local gears = require("gears")

local keys = gears.table.join(

    -- ===================================== Prompt {{{

    -- Rofi / dmenu
    awful.key({ superkey }, "d", function()
        awful.spawn.with_shell("rofi -show")
    end, { description = "Launcher", group = "Apps: Prompt" }),

    -- Rofi Action Center
    awful.key({ superkey }, "a", function()
        awful.spawn.with_shell(apps.rofi.center)
    end, { description = "Action Center", group =  "Apps: Prompt" } ),

    -- Rofi App Center
    awful.key({ superkey }, "r", function()
        awful.spawn.with_shell(apps.rofi.app_menu)
    end, { description = "App Center", group =  "Apps: Prompt" } ),

    -- Rofi Global Menu
    awful.key({ superkey }, "g", function()
        awful.spawn.with_shell(apps.rofi.global_menu)
    end, { description = "Global Menu", group =  "Apps: Prompt" } ),

    -- Clipmenu
    awful.key({ superkey }, "Insert", function()
        awful.spawn(apps.clipboard)
    end, { description = "Clipboard manager", group = "Apps: Prompt" }),

    -- Rofi Screenshots
    awful.key({ superkey }, "Print", function()
        awful.spawn(apps.rofi.shot)
    end, { description = "Shot", group = "Apps: Prompt" }),

    -- Rofi Record
    awful.key({ superkey }, "F12", function()
        awful.spawn(apps.rofi.record)
    end, { description = "Record", group = "Apps: Prompt" }),

    -- Network dialog
    awful.key({ superkey }, "n",
        apps.network,
    { description = "Network", group = "Apps: Prompt" }),

    -- Password
    awful.key({ superkey }, "p",
        apps.password,
    { description = "Password", group = "Apps: Prompt" }),

    -- Quick edit file
    awful.key({ superkey }, "e", function()
        awful.spawn.with_shell(apps.rofi.edit)
    end, { description = "Edit file", group = "Apps: Prompt" }),

    -- Rofi Calculator
    awful.key({ superkey }, "c", function()
        awful.spawn.with_shell(apps.rofi.calc)
    end, { description = "Calculator", group =  "Apps: Prompt" } ),

    -- Rofi Todo
    awful.key({ superkey }, "/", function()
        awful.spawn.with_shell(apps.rofi.todo)
    end, { description = "Todo", group = "Apps: Prompt" }),

    -- Quick Translate
    awful.key({ superkey }, "t", function()
        awful.spawn.with_shell(apps.rofi.translate)
    end, { description = "Translate", group = "Apps: Prompt" }),

    -- Quick Translate
    awful.key({ superkey, shiftkey }, "t", function()
        awful.spawn.with_shell("rofi_translate -c")
    end, { description = "Translate(Clipboard)", group = "Apps: Prompt" }),

    -- Youtube Prompt ( ytfzf)
    awful.key({ superkey }, "y",
        apps.youtube,
        { description = "Youtube", group = "Apps: Prompt" }),

    -- }}}

    -- ===================================== GUI Apps {{{

    -- Web Browser
    awful.key({ superkey },"w",
        apps.browser,
    { description = "Browser", group = "Apps: GUI" }),

    -- File Manager
    awful.key({ superkey },"f", function()
        awful.spawn("thunar")
    end, { description = "File Manager", group = "Apps: GUI" }),

    -- }}}

    -- ===================================== Terminal {{{

    -- Spawn terminal
    awful.key({ superkey }, "Return", function()
        awful.spawn(user.terminal)
    end, { description = "Terminal", group = "Apps: Terminal" }),

    -- Spawn floating terminal
    awful.key({ superkey, shiftkey }, "Return", function()
        awful.spawn(user.floating_terminal, { floating = true })
    end, { description = "Floating terminal", group = "Apps: Terminal" }),

    -- Terminal Editor
    awful.key({ superkey, shiftkey },"e",
        apps.editor,
        { description = "Editor", group = "Apps: Terminal" }),

    -- Terminal file manager
    awful.key({ superkey, shiftkey }, "f",
        apps.file_manager,
        { description = "File Manager", group = "Apps: Terminal" }),

    -- Terminal e-mail client
    awful.key({ superkey, shiftkey }, "w",
        apps.mail,
        { description = "E-mail client", group = "Apps: Terminal" }),

    -- Terminal music client
    awful.key({ superkey, shiftkey }, "m",
        apps.music,
        { description = "Music client", group = "Apps: Terminal" }),

    -- }}}

    -- ===================================== Scratchpad {{{

    -- scratchpad
    awful.key({ superkey }, "\\", function()
        apps.scratchpad()
    end, { description = "Scratchpad", group = "Apps: Scratchpad" }),

    -- Markdown input scratchpad (I for input)
    awful.key({ superkey }, "i",
        apps.markdown_input,
        { description = "Markdown Input", group = "Apps: Scratchpad" })


-- }}}

)

return keys
