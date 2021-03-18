
local awful         = require('awful')
local gears         = require('gears')
local hotkeys_popup = require("awful.hotkeys_popup")

local apps = require(P.config.apps)

awful.keyboard.append_global_keybindings({
    -- =========================== Volume Control
    awful.key({},'XF86AudioRaiseVolume',
        function ()
            awful.spawn(apps.controller.vol_up) 
        end,
    {description = "Increase Volume", group = "controller"}),
    awful.key({ A, S }, "Right",
        function ()
            awful.spawn(apps.controller.vol_up) 
        end,
    {description = "Increase Volume", group = "controller"}),
    
    awful.key({},'XF86AudioLowerVolume',
        function () 
            awful.spawn(apps.controller.vol_down) 
        end,
    {description = "Decrease Volume", group = "controller"}),
    awful.key({ A, S }, "Left",
        function () 
            awful.spawn(apps.controller.vol_down) 
        end,
    {description = "Decrease Volume", group = "controller"}),
    
    awful.key({},'XF86AudioMute',
        function () awful.spawn(apps.controller.vol_mute) end,
    {description = "(un)Mute Volume", group = "controller"}),
    awful.key({ A, S }, "/",
        function () awful.spawn(apps.controller.vol_mute) end,
    {description = "(un)Mute Volume", group = "controller"}),
    
    -- =========================== Brightness Control
    awful.key({ A, S }, ".",
        function () awful.spawn(apps.controller.bn_opt) end,
    {description = "Optimizing Brightness", group = "controller"}),

    awful.key({},'XF86MonBrightnessUp',
        function () 
            awful.spawn(apps.controller.bn_up) 
        end,
    {description = "Increase Brightness", group = "controller"}),
    awful.key({ A, S }, "Up",
        function () 
            awful.spawn(apps.controller.bn_up) 
        end,
    {description = "Increase Brightness", group = "controller"}),

    awful.key({},'XF86MonBrightnessDown',
        function () 
            awful.spawn(apps.controller.bn_down)
        end,
    {description = "Decrease Brightness", group = "controller"}),
    awful.key({ A, S }, "Down",
        function () 
            awful.spawn(apps.controller.bn_down)
        end,
    {description = "Decrease Brightness", group = "controller"}),

    -- =========================== MPC Control
    awful.key({ W }, "m", 
      function () awful.spawn(apps.controller.mus_c) end,
    {description = "Curent Music", group = "controller"}),
    
    awful.key({},'XF86AudioStop',
        function () awful.spawn(apps.controller.mus_s) end,
    {description = "Stop mpc", group = "controller"}),
    awful.key({ A, C }, "Up",
        function () awful.spawn(apps.controller.mus_s) end,
    {description = "Stop mpc", group = "controller"}),

    awful.key({},'XF86AudioPlay',
        function () awful.spawn(apps.controller.mus_t) end,
    {description = "Toggle Play/Pause mpc", group = "controller"}),
    awful.key({ A, C }, "Down",
        function () awful.spawn(apps.controller.mus_t) end,
    {description = "Toggle Play/Pause mpc", group = "controller"}),

    awful.key({},'XF86AudioNext',
        function () awful.spawn(apps.controller.mus_n) end,
    {description = "Play Next Song mpc", group = "controller"}),
    awful.key({ A, C }, "Right",
        function () awful.spawn(apps.controller.mus_n) end,
    {description = "Play Next Song mpc", group = "controller"}),

    awful.key({},'XF86AudioPrev',
        function () awful.spawn(apps.controller.mus_p) end,
    {description = "Play Previous Song mpc", group = "controller"}),
    awful.key({ A, C }, "Left",
        function () awful.spawn(apps.controller.mus_p) end,
    {description = "Play Previous Song mpc", group = "controller"}),
    
    -- Virtual keyboard
    awful.key({ W }, "`", 
      function () awful.spawn(apps.controller.vk_show) end,
    {description = "Show Virtual keyboard", group = "launcher"}),

    awful.key({ W, S }, "`", 
      function () awful.spawn(apps.controller.vk_hide) end,
    {description = "Hide Virtual keyboard", group = "launcher"}),
})
