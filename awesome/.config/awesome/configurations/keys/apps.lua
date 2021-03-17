local awful         = require('awful')
local gears         = require('gears')
local hotkeys_popup = require("awful.hotkeys_popup")

local apps     = require(P.config.apps)

awful.keyboard.append_global_keybindings({
    -- =========================== Launcher
    -- ================= Open default apps
    awful.key({ W }, "o",
        function ()
            awful.spawn(awful.screen.focused().selected_tag.default_app,
                { tag = mouse.screen.selected_tag })
        end,
        {description = "Open default app in current tag", group = "launcher"}),

    awful.key({ W, C }, "Return",
        function ()
            awful.spawn(awful.screen.focused().selected_tag.default_app,
                { tag = mouse.screen.selected_tag })
        end,
        {description = "Open default app in current tag", group = "launcher"}),

    -- ================= Terminal
    awful.key({ W }, "Return", 
        function () awful.spawn(apps.default.terminal) end,
        {description = "Open a terminal", group = "launcher"}),

    awful.key({ W, S }, "Return", 
        function () awful.spawn(apps.default.terminal_float) end,
        {description = "Open a Floating terminal", group = "launcher"}),

    awful.key({ W }, '\\',
        function() awesome.emit_signal('module::quake_terminal:toggle') end,
        {description = 'Open Quake Terminal', group = 'launcher'}),
    -- ================= Files Manager
    awful.key({ W }, "f", 
        function () awful.spawn(apps.default.file_manager) end,
        {description = "Open a File Manager", group = "launcher"}),

    awful.key({ W, S }, "f", 
        function () awful.spawn(apps.explorer_cmd) end,
        {description = "Open a terminal File Manager", group = "launcher"}),

    -- ========== Web Browser
    awful.key({ W }, "w", 
        function () awful.spawn(apps.default.web_browser) end,
        {description = "Open a Web browser", group = "launcher"}),

    -- ========= Text Editor
    awful.key({ W }, "e", 
        function () awful.spawn(apps.editor_cmd) end,
        {description = "Open a main text editor ( Neovim )", group = "launcher"}),

    awful.key({ W, S }, "e", 
        function () awful.spawn(apps.default.editor) end,
        {description = "Open a secondary text editor ( VSCode )", group = "launcher"}),

    -- ========= Music
    awful.key({ W, S }, "m", 
        function () awful.spawn(apps.default.t_music) end,
        {description = "Open a music player", group = "launcher"}),

    -- ========= Rofi
    awful.key({ W }, "r", 
        function () awful.spawn(apps.rofi.drun) end,
        {description = "Search app ", group = "launcher"}),

    awful.key({ W }, "c", 
        function () awful.spawn(apps.rofi.calc) end,
        {description = "Open rofi calculator", group = "launcher"}),

    awful.key({ C, A }, "Insert", 
        function () awful.spawn(apps.rofi.clipboard) end,
        {description = "Open greenclip clipboard manager", group = "launcher"}),

    -- ================== Lockscreen
    awful.key({ W, C }, "l", 
        function()
            awful.spawn(apps.default.lock, false)
        end,
        {description = "lockscreen", group = "launcher"})
})
