local awful = require("awful")

local switcher = require(P.module.switcher .. "." .. RC.settings.switcher_mode) or "normal"
-- ========================================= Client Related
-- ================= ALT TAB
if RC.settings.switcher_enabled == true then
    awful.keyboard.append_global_keybindings({
        awful.key({ A }, "Tab", function()
            switcher.switch(1, "Mod1", "Alt_L", "Shift", "Tab")
        end, { description = "Next Client", group = "client" }),

        awful.key({ A, S }, "Tab", function()
            switcher.switch(-1, "Mod1", "Alt_L", "Shift", "Tab")
        end, { description = "Previous Client", group = "client" }),
    })
end

awful.keyboard.append_global_keybindings({
    --awful.key({ W, C }, "j",
    --function () awful.screen.focus_relative( 1) end,
    --{description = "focus the next screen", group = "screen"}),

    --awful.key({ W, C }, "k",
    --function () awful.screen.focus_relative(-1) end,
    --{description = "focus the previous screen", group = "screen"}),

    awful.key({ W }, "j", function()
        awful.client.focus.byidx(1)
    end, { description = "focus next by index", group = "client" }),

    awful.key({ W }, "k", function()
        awful.client.focus.byidx(-1)
    end, { description = "focus previous by index", group = "client" }),

    awful.key({ W, S }, "j", function()
        awful.client.swap.byidx(1)
    end, { description = "swap with next client by index", group = "client" }),

    awful.key({ W, S }, "k", function()
        awful.client.swap.byidx(-1)
    end, { description = "swap with previous client by index", group = "client" }),

    awful.key(
        { W },
        "u",
        awful.client.urgent.jumpto,
        { description = "jump to urgent client", group = "client" }
    ),

    awful.key({ W, C }, "n", function()
        local c = awful.client.restore()
        -- Focus restored client
        if c then
            c:emit_signal("request::activate", "key.unminimize", { raise = true })
        end
    end, { description = "restore minimized", group = "client" }),
})

client.connect_signal("request::default_keybindings", function()
    awful.keyboard.append_client_keybindings({
        awful.key({ A }, "F12", function(c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end, { description = "Toggle fullscreen", group = "client" }),

        awful.key({ A }, "F4", function(c)
            c:kill()
        end, { description = "Close", group = "client" }),

        awful.key({ A }, "F6", function(c)
            awful.titlebar.toggle(c, ("top" or "left"))
        end, { description = "Close", group = "client" }),

        awful.key(
            { W, C },
            "space",
            awful.client.floating.toggle,
            { description = "Toggle floating", group = "client" }
        ),

        awful.key({ W, C }, "Return", function(c)
            c:swap(awful.client.getmaster())
        end, { description = "move to master", group = "client" }),

        awful.key({ W }, "o", function(c)
            c:move_to_screen()
        end, { description = "move to screen", group = "client" }),

        awful.key({ A }, "F7", function(c)
            c.ontop = not c.ontop
        end, { description = "toggle keep on top", group = "client" }),

        awful.key({ A }, "F3", function(c)
            c.minimized = true
        end, { description = "minimize", group = "client" }),

        awful.key({ A }, "F5", function(c)
            c.maximized = not c.maximized
            c:raise()
        end, { description = "(un)maximize", group = "client" }),

    })
end)
