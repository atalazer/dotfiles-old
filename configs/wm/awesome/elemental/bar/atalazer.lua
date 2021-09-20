local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")

local helpers = require("helpers")
local keys = require("configs.keys")
local apps = require("configs.apps")

local dock_autohide_delay = beautiful.activator_timeout or 0.3 -- seconds
local dock = require("noodle.dock")
local dock_placement = function(w)
    return awful.placement.bottom(w)
end

awful.screen.connect_for_each_screen(function(s)
    -- Create a promptbox for each screen
    s.promptbox = awful.widget.prompt()

    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.layoutbox = awful.widget.layoutbox({
        screen = s,
        buttons = {
            awful.button({}, 1, function()
                awful.layout.inc(1)
            end),
            awful.button({}, 3, function()
                awful.layout.inc(-1)
            end),
            awful.button({}, 4, function()
                awful.layout.inc(-1)
            end),
            awful.button({}, 5, function()
                awful.layout.inc(1)
            end),
        },
    })

    -- Create a taglist widget
    s.taglist = awful.widget.taglist({
        screen = s,
        filter = awful.widget.taglist.filter.all,
        buttons = keys.taglist_buttons,
        style = {
            bg_focus = "#00000000",
            bg_urgent = "#00000000",
            bg_occupied = "#00000000",
            bg_empty = "#00000000",
            bg_volatile = "#00000000",

            fg_focus = x.color6,
            fg_urgent = x.color3,
            fg_occupied = x.color5,
            fg_empty = x.color8,
            fg_volatile = x.color9,
        },
    })

    -- Create a system tray widget
    s.systray = wibox.widget({
        visible = false,
        base_size = dpi(20),
        horizontal = true,
        screen = "primary",
        widget = wibox.widget.systray,
    })

    s.tray_toggler = require("noodle.tray_toggle")

    local clock = require("noodle.clock")(s)
    s.battery = require("noodle.battery")()
    s.network = require("noodle.network")()

    s.record_status = awful.widget.watch(
        "bash -c 'file=/tmp/recordicon; if [[ ! -f $file ]]; then touch $file && echo \"NOREC\" > $file; fi; cat $file'",
        1,
        function(widget, stdout)
            if stdout:match("NOREC") then
                widget:set_markup(helpers.colorize_text(" ", beautiful.foreground))
            else
                widget:set_markup(helpers.colorize_text(" ", beautiful.red))
            end
        end
    )
    s.record_status:buttons(gears.table.join(awful.button({}, 1, apps.record)))

    -- Create the wibox
    s.bar = awful.wibar({
        position = "top",
        screen = s,
        width = s.geometry.width,
        height = beautiful.bar_height or dpi(30),
        x = s.geometry.x,
        y = s.geometry.y,
        bg = beautiful.bar_bg or beautiful.bg_normal,
        fg = beautiful.bar_fg or beautiful.fg_normal,
    })

    s.bar:connect_signal("mouse::enter", function()
        local w = mouse.current_wibox
        if w then
            w.cursor = "left_ptr"
        end
    end)

    -- Add widgets to the wibox
    s.bar.widget = {
        layout = wibox.layout.align.horizontal,
        expand = "none",
        {
            layout = wibox.layout.fixed.horizontal,
            spacing = dpi(5),
            s.taglist,
            s.record_status,
            s.promptbox,
        },
        clock,
        {
            layout = wibox.layout.fixed.horizontal,
            spacing = dpi(5),
            {
                s.systray,
                margins = beautiful.bar_widget_margin or dpi(3),
                widget = wibox.container.margin,
            },
            s.tray_toggler,
            s.network,
            s.battery,
            s.layoutbox,
        },
    }

    -- Create the dock wibox
    s.dock = awful.popup({
        -- Size is dynamic, no need to set it here
        visible = false,
        bg = "#00000000",
        ontop = true,
        type = "dock",
        placement = dock_placement,
        widget = dock,
    })
    dock_placement(s.dock)

    local popup_timer
    local autohide = function()
        if popup_timer then
            popup_timer:stop()
            popup_timer = nil
        end
        popup_timer = gears.timer.start_new(dock_autohide_delay, function()
            popup_timer = nil
            s.dock.visible = false
        end)
    end

    -- Initialize wibox activator
    s.dock_activator = wibox({
        screen = s,
        height = beautiful.activatir_width or dpi(3),
        bg = beautiful.activator_bg or x.color8,
        shape = helpers.rrect(beautiful.border_radius),
        opacity = beautiful.activator_opacity or 0.3,
        visible = not s.dock.visible,
        ontop = true,
    })
    awful.placement.bottom(s.dock_activator)
    s.dock_activator:connect_signal("mouse::enter", function()
        s.dock.visible = true
        if popup_timer then
            popup_timer:stop()
            popup_timer = nil
        end
    end)

    -- We have set the dock_activator to be ontop, but we do not want it to be
    -- above fullscreen clients
    local function no_dock_activator_ontop(c)
        if c.fullscreen then
            s.dock_activator.ontop = false
        else
            s.dock_activator.ontop = true
        end
    end
    client.connect_signal("focus", no_dock_activator_ontop)
    client.connect_signal("unfocus", no_dock_activator_ontop)
    client.connect_signal("property::fullscreen", no_dock_activator_ontop)

    local function adjust_dock()
        -- Reset position every time the number of dock items changes
        dock_placement(s.dock)

        -- Adjust activator width every time the dock wibox width changes
        s.dock_activator.width = s.dock.width + dpi(250)
        -- And recenter
        awful.placement.bottom(s.dock_activator)
    end

    adjust_dock()
    s.dock:connect_signal("property::width", adjust_dock)

    s.dock:connect_signal("mouse::enter", function()
        if popup_timer then
            popup_timer:stop()
            popup_timer = nil
        end
    end)

    s.dock:connect_signal("mouse::leave", function()
        autohide()
    end)
    s.dock_activator:connect_signal("mouse::leave", function()
        autohide()
    end)

    -- -- Create the tray box
    -- s.traybox = wibox({
    --     screen = s,
    --     width = dpi(150),
    --     height = beautiful.wibar_height,
    --     bg = "#00000000",
    --     visible = false,
    --     ontop = true,
    -- })
    -- s.traybox:setup({
    --     {
    --         {
    --             nil,
    --             s.systray,
    --             expand = "none",
    --             layout = wibox.layout.align.horizontal,
    --         },
    --         margins = dpi(5),
    --         widget = wibox.container.margin,
    --     },
    --     bg = beautiful.bg_systray,
    --     shape = helpers.rrect(beautiful.border_radius),
    --     widget = wibox.container.background,
    -- })
    -- awful.placement.bottom_right(s.traybox, { margins = beautiful.useless_gap * 2 })
    -- s.traybox:buttons(gears.table.join(awful.button({}, 2, function()
    --     s.traybox.visible = false
    -- end)))
end)

awesome.connect_signal("elemental::dismiss", function()
    local s = mouse.screen
    s.dock.visible = false
end)

-- Every bar theme should provide these fuctions
dock_toggle = function()
    local s = awful.screen.focused()
    if s.dock then
        s.dock.visible = not s.dock.visible
    end
end

-- Toggle mywibar

bar_toggle = function()
    local s = awful.screen.focused()
    if s.bar then
        s.bar.visible = not s.bar.visible
    end
end

-- Toggle tray
tray_toggle = function()
    local s = awful.screen.focused()
    if s.systray then
        -- s.systray.visible = not s.systray.visible
        awesome.emit_signal("widget::systray:toggle")
    elseif s.traybox then
        s.traybox.visible = not s.traybox.visible
    end
end
