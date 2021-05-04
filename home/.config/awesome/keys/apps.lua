local awful = require("awful")
local gears = require("gears")
local apps = require("apps")

local keys = gears.table.join(

    -- ===================================== Prompt {{{

    -- Rofi / dmenu
    awful.key({ superkey }, "d", function()
        awful.spawn.with_shell("rofi -matching fuzzy -show combi")
    end, { description = "rofi launcher", group = "launcher" }),

    -- Pomodoro timer
    awful.key({ superkey }, "slash", function()
        awful.spawn.with_shell("pomodoro")
    end, { description = "pomodoro", group = "launcher" }),

    -- Network dialog: nmapplet rofi frontend
    awful.key({ superkey }, "F11", function()
        awful.spawn("networkmanager_dmenu")
    end, { description = "spawn network dialog", group = "launcher" }),

    -- clipmenu
    awful.key({ superkey }, "Insert", function()
        awful.spawn("env CM_HISTLENGTH=20 CM_LAUNCHER=rofi clipmenu")
    end, { description = "spawn clipboard manager", group = "launcher" }),

    -- Quick edit file
    awful.key({ superkey }, "e", function()
        awful.spawn.with_shell("rofi_edit")
    end, { description = "quick edit file", group = "launcher" }),

    -- }}}

    -- ===================================== GUI Apps {{{

    -- browser
    awful.key(
        { superkey },
        "w",
        apps.browser,
        { description = "browser", group = "launcher" }
    ),

    -- }}}

    -- ===================================== Terminal {{{

    -- Spawn terminal
    awful.key({ superkey }, "Return", function()
        awful.spawn(user.terminal)
    end, { description = "open a terminal", group = "launcher" }),

    -- Spawn floating terminal
    awful.key({ superkey, shiftkey }, "Return", function()
        awful.spawn(user.floating_terminal, { floating = true })
    end, { description = "spawn floating terminal", group = "launcher" }),

    -- Terminal Editor
    awful.key({ superkey, shiftkey },"e",
        apps.editor,
        { description = "editor", group = "launcher" }),

    -- Terminal file manager
    awful.key({ superkey, shiftkey }, "f",
        apps.file_manager,
        { description = "file manager", group = "launcher" }),

    -- Terminal e-mail client
    awful.key({ superkey, shiftkey }, "w",
        apps.mail,
        { description = "email client", group = "launcher" }),

    -- Terminal music client
    awful.key({ superkey, shiftkey }, "m",
        apps.music,
        { description = "music client", group = "launcher" }),

    -- Process monitor
    awful.key({ superkey, shiftkey }, "p",
        apps.process_monitor,
        { description = "process monitor", group = "launcher" }),

    -- }}}

    -- ===================================== Scratchpad {{{

    -- scratchpad
    awful.key({ superkey }, "\\", function()
        apps.scratchpad()
    end, { description = "scratchpad", group = "launcher" }),

    -- Markdown input scratchpad (I for input)
    awful.key({ superkey, shiftkey }, "i",
        apps.markdown_input,
        { description = "markdown scratchpad", group = "launcher" })

-- }}}

)

return keys
