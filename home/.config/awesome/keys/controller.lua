local awful = require("awful")
local gears = require("gears")
local apps = require("apps")

local keys = gears.table.join(
    -- ======================================================= Volume Control
    awful.key({}, "XF86AudioRaiseVolume", function()
        awful.spawn.with_shell(apps.controller.vol_up)
    end, { description = "Increase Volume", group = "Apps: Controller" }),

    awful.key({}, "XF86AudioLowerVolume", function()
        awful.spawn.with_shell(apps.controller.vol_down)
    end, { description = "Decrease Volume", group = "Apps: Controller" }),

    awful.key({}, "XF86AudioMute", function()
        awful.spawn.with_shell(apps.controller.vol_mute)
    end, { description = "(un)Mute Volume", group = "Apps: Controller" }),

    -- ========================================================== Brightness Control
    awful.key({}, "XF86MonBrightnessUp", function()
        awful.spawn.with_shell(apps.controller.bn_up)
    end, { description = "Increase Brightness", group = "Apps: Controller" }),

    awful.key({}, "XF86MonBrightnessDown", function()
        awful.spawn.with_shell(apps.controller.bn_down)
    end, { description = "Decrease Brightness", group = "Apps: Controller" }),

    -- =========================================================== MPC Control
    awful.key({}, "XF86AudioStop", function()
        awful.spawn.with_shell(apps.controller.mus_s)
    end, { description = "Stop mpc", group = "Apps: Controller" }),

    awful.key({}, "XF86AudioPlay", function()
        awful.spawn.with_shell(apps.controller.mus_t)
    end, { description = "Toggle Play/Pause mpc", group = "Apps: Controller" }),

    awful.key({}, "XF86AudioNext", function()
        awful.spawn.with_shell(apps.controller.mus_n)
    end, { description = "Play Next Song mpc", group = "Apps: Controller" }),

    awful.key({}, "XF86AudioPrev", function()
        awful.spawn.with_shell(apps.controller.mus_p)
    end, { description = "Play Previous Song mpc", group = "Apps: Controller" }),

    -- ============================================================= Screenshot
    awful.key({ S }, "Print", function()
        awful.spawn.with_shell(apps.controller.shot_select)
    end, { description = "Shot Select", group = "Apps: Controller" }),

    awful.key({ A }, "Print", function()
        awful.spawn.with_shell(apps.controller.shot_active)
    end, { description = "Shot Active Client", group = "Apps: Controller" })

)

return keys
