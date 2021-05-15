local awful = require("awful")
local gears = require("gears")
local apps = require("apps")

local keys = gears.table.join(

    -- ===================================== Prompt {{{

    -- Rofi / dmenu
    awful.key({ superkey }, "d", function()
        awful.spawn.with_shell("rofi -matching fuzzy -show combi")
    end, { description = "rofi launcher", group = "launcher" }),

    -- Rofo Action Center
    awful.key({ superkey }, "F12", function()
        awful.spawn.with_shell(apps.rofi.center)
    end, { description = "Rofi Action Center", group =  "launcher" } ),
    
    -- Rofo App Center
    awful.key({ superkey }, "r", function()
        awful.spawn.with_shell(apps.rofi.app_menu)
    end, { description = "App Center", group =  "launcher" } ),
    
    -- Rofo Global Menu
    awful.key({ superkey, shiftkey }, "r", function()
        awful.spawn.with_shell(apps.rofi.global_menu)
    end, { description = "Global Menu", group =  "launcher" } ),
    
    -- Clipmenu
    awful.key({ superkey }, "Insert", function()
        awful.spawn(apps.clipboard)
    end, { description = "Clipboard manager", group = "launcher" }),

    -- Rofi Screenshots
    awful.key({ W }, "Print", function()
        awful.spawn.with_shell(apps.rofi.shot)
    end, { description = "Shot", group = "launcher" }),

    -- Rofi Todo
    awful.key({ superkey }, "/", function()
        awful.spawn.with_shell(apps.rofi.tofo)
    end, { description = "Todo", group = "launcher" }),

    -- Network dialog
    awful.key({ superkey }, "F11",
        apps.network,
    { description = "Network dialog", group = "launcher" }),

    -- Password
    awful.key({ superkey }, "F10",
        apps.password,
    { description = "Password dialog", group = "launcher" }),

    -- Quick edit file
    awful.key({ superkey }, "e", function()
        awful.spawn.with_shell(apps.rofi.edit)
    end, { description = "Quick edit file", group = "launcher" }),

    -- Quick Translate
    awful.key({ superkey }, "t", function()
        awful.spawn.with_shell(apps.rofi.translate)
    end, { description = "Quick Translate", group = "launcher" }),

    -- }}}

    -- ===================================== GUI Apps {{{

    -- browser
    awful.key({ superkey },"w",
        apps.browser,
    { description = "Browser", group = "launcher" }),

    -- }}}

    -- ===================================== Terminal {{{

    -- Spawn terminal
    awful.key({ superkey }, "Return", function()
        awful.spawn(user.terminal)
    end, { description = "Terminal", group = "launcher" }),

    -- Spawn floating terminal
    awful.key({ superkey, shiftkey }, "Return", function()
        awful.spawn(user.floating_terminal, { floating = true })
    end, { description = "Floating terminal", group = "launcher" }),

    -- Terminal Editor
    awful.key({ superkey, shiftkey },"e",
        apps.editor,
        { description = "Terminal Editor", group = "launcher" }),

    -- Terminal file manager
    awful.key({ superkey, shiftkey }, "f",
        apps.file_manager,
        { description = "Terminal File Manager", group = "launcher" }),

    -- Terminal e-mail client
    awful.key({ superkey, shiftkey }, "w",
        apps.mail,
        { description = "Terminal E-mail client", group = "launcher" }),

    -- Terminal music client
    awful.key({ superkey, shiftkey }, "m",
        apps.music,
        { description = "Terminal Music client", group = "launcher" }),

    -- Process monitor
    awful.key({ superkey, shiftkey }, "p",
        apps.process_monitor,
        { description = "Terminal Process monitor", group = "launcher" }),

    -- }}}

    -- ===================================== Scratchpad {{{

    -- scratchpad
    awful.key({ superkey }, "\\", function()
        apps.scratchpad()
    end, { description = "Scratchpad", group = "launcher" }),

    -- Markdown input scratchpad (I for input)
    awful.key({ superkey, shiftkey }, "i",
        apps.markdown_input,
        { description = "Markdown scratchpad", group = "launcher" })

-- }}}

)

return keys
