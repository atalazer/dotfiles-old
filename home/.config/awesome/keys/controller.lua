local awful = require("awful")
local gears = require("gears")
local apps = require("apps")

local keys = gears.table.join(
    -- ======================================================= Volume Control
    awful.key({}, "XF86AudioRaiseVolume", function()
        awful.spawn.with_shell(apps.controller.vol_up)
    end, { description = "Increase Volume", group = "controller" }),

    awful.key({}, "XF86AudioLowerVolume", function()
        awful.spawn.with_shell(apps.controller.vol_down)
    end, { description = "Decrease Volume", group = "controller" }),

    awful.key({}, "XF86AudioMute", function()
        awful.spawn.with_shell(apps.controller.vol_mute)
    end, { description = "(un)Mute Volume", group = "controller" }),

    -- ========================================================== Brightness Control
    awful.key({}, "XF86MonBrightnessUp", function()
        awful.spawn.with_shell(apps.controller.bn_up)
    end, { description = "Increase Brightness", group = "controller" }),

    awful.key({}, "XF86MonBrightnessDown", function()
        awful.spawn.with_shell(apps.controller.bn_down)
    end, { description = "Decrease Brightness", group = "controller" }),

    -- =========================================================== MPC Control
    awful.key({}, "XF86AudioStop", function()
        awful.spawn.with_shell(apps.controller.mus_s)
    end, { description = "Stop mpc", group = "controller" }),

    awful.key({}, "XF86AudioPlay", function()
        awful.spawn.with_shell(apps.controller.mus_t)
    end, { description = "Toggle Play/Pause mpc", group = "controller" }),

    awful.key({}, "XF86AudioNext", function()
        awful.spawn.with_shell(apps.controller.mus_n)
    end, { description = "Play Next Song mpc", group = "controller" }),

    awful.key({}, "XF86AudioPrev", function()
        awful.spawn.with_shell(apps.controller.mus_p)
    end, { description = "Play Previous Song mpc", group = "controller" }),

    -- ============================================================= Screenshot
    awful.key({}, "Print", function()
        awful.spawn.with_shell(apps.controller.shot_clip)
    end, { description = "Shot to Clipboard", group = "controller" }),

    awful.key({ W }, "Print", function()
        awful.spawn.with_shell(apps.controller.shot)
    end, { description = "Shot Screen", group = "controller" }),

    awful.key({ C }, "Print", function()
        awful.spawn.with_shell(apps.controller.shot_sleep)
    end, { description = "Shot after 3 sec", group = "controller" }),

    awful.key({ S }, "Print", function()
        awful.spawn.with_shell(apps.controller.shot_select)
    end, { description = "Shot selected", group = "controller" }),

    awful.key({ A }, "Print", function()
        awful.spawn.with_shell(apps.controller.shot_active)
    end, { description = "Shot Active Client", group = "controller" }),

    -- Screenkey toggle
    awful.key( { superkey }, "F12", apps.screenkey,
        {description = "raise volume", group = "controller"}),

    -- Microphone (V for voice)
    awful.key( { superkey }, "v",
        function()
            awful.spawn.with_shell("pactl set-source-mute @DEFAULT_SOURCE@ toggle")
        end,
        {description = "(un)mute microphone", group = "controller"}),

    -- Microphone overlay
    awful.key( { superkey, shiftkey }, "v",
        function()
            microphone_overlay_toggle()
        end,
        {description = "toggle microphone overlay", group = "controller"})

)

return keys
