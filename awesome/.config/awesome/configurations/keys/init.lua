local awful         = require('awful')
local gears         = require('gears')
local hotkeys_popup = require("awful.hotkeys_popup")

W = 'Mod4'
A = 'Mod1'
C = "Control"
S = "Shift"

require(P.config.keys..'.client')
require(P.config.keys..'.tags')
require(P.config.keys..'.layout')
require(P.config.keys..'.apps')
require(P.config.keys..'.controller')

local exit_screen_show = require("modules.exit-screen")

-- ========================================= awesome
awful.keyboard.append_global_keybindings({
    awful.key({ W, C }, "r",
        awesome.restart,
    {description = "reload awesome", group = "awesome"}),

    awful.key({ W, S }, "e", 
        function()
            -- awesome.emit_signal('module::exit_screen:show')
            exit_screen_show()
        end,
    {description = "quit awesome", group = "awesome"}),

    awful.key({ W }, "Escape", 
        function()
            -- awesome.emit_signal('module::exit_screen:show')
            exit_screen_show()
        end,
    {description = "quit awesome", group = "awesome"}),

    awful.key({ }, "XF86PowerOff", 
        function()
            -- awesome.emit_signal('module::exit_screen:show')
            exit_screen_show()
        end,
    {description = "quit awesome", group = "awesome"}),
    --awful.key({ w }, "space", 
        --function () mymainmenu:show() end,
    --{description = "show main menu", group = "awesome"}),

    awful.key({ W }, "F1",      
        hotkeys_popup.show_help,
    {description="show help", group="awesome"}),

})

  -- ============================== prompt
awful.keyboard.append_global_keybindings({
  awful.key({ W }, ";", 
    function () awful.screen.focused().mypromptbox:run() end,
    {description = "run prompt", group = "launcher"}),

})
