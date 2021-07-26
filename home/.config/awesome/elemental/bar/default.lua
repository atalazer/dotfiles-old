local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")

local helpers = require("helpers")
local keys = require("configs.keys")

local dock_autohide_delay = 0.5 -- seconds

local dock = require("noodle.dock")
local dock_placement = function(w)
    return awful.placement.bottom(w)
end

local clock_widget = wibox.widget.textclock("<span color='" .. x.foreground .. "'>%a, %I:%M %p</span>")

local calendar_popup = awful.widget.calendar_popup.month({
    start_sunday = false,
    spacing = dpi(3),
    font = beautiful.font,
    long_weekdays = false,
    margin = dpi(2),
    style_month   = { border_width = 2, padding = 10, border_color = beautiful.bg_focus },
    style_header  = { border_width = 0, bg_color = beautiful.bg_normal },
    style_weekday = { border_width = 0, bg_color = beautiful.bg_normal },
    style_normal  = { border_width = 0, bg_color = beautiful.bg_normal },
    style_focus   = { border_width = 0, bg_color = beautiful.bg_focus },
})

-- Attach calendar to clock_widget
calendar_popup:attach(clock_widget, "tc", { on_pressed = true, on_hover = false })

awful.screen.connect_for_each_screen(function(s)

    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox({
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
    s.mytaglist = awful.widget.taglist({
        screen = s,
        filter = awful.widget.taglist.filter.all,
        buttons = keys.taglist_buttons,
        style = {
            bg_focus    = "#00000000",
            bg_urgent   = "#00000000",
            bg_occupied = "#00000000",
            bg_empty    = "#00000000",
            bg_volatile = "#00000000",
            
            fg_focus    = x.color6,
            fg_urgent   = x.color3,
            fg_occupied = x.color5,
            fg_empty    = x.color8,
            fg_volatile = x.color9,
        }
    })

    -- Create a system tray widget
    s.systray = wibox.widget.systray()

    -- Create the wibox
    s.mywibox = awful.wibar({ 
        position = "top", 
        screen = s,
        height = dpi(18),
        bg = "#00000000",
    })

    s.record_status = awful.widget.watch("bash -c 'cat /tmp/recordicon'", 1, function(widget, stdout)
        if stdout:match("NOREC") then
            widget:set_markup(helpers.colorize_text(stdout, x.foreground))
        else
            widget:set_markup(helpers.colorize_text(stdout, x.color1))
        end
    end)

    s.separator = wibox.widget.textbox(" ")

    -- Add widgets to the wibox
    s.mywibox.widget = {
        layout = wibox.layout.align.horizontal,
		expand = 'none',
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
        },
        clock_widget,
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            s.record_status,
            s.separator,
            s.systray,
            s.separator,
            s.mylayoutbox,
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
    s.dock_activator = wibox({ screen = s, height = 1, bg = "#00000000", visible = true, ontop = true })
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

    s:connect_signal("removed", function(s)
        client.disconnect_signal("focus", no_dock_activator_ontop)
        client.disconnect_signal("unfocus", no_dock_activator_ontop)
        client.disconnect_signal("property::fullscreen", no_dock_activator_ontop)
    end)

    s.dock_activator:buttons(gears.table.join(
        awful.button({}, 4, function()
            awful.tag.viewprev()
        end),
        awful.button({}, 5, function()
            awful.tag.viewnext()
        end)
    ))

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

    -- Create the tray box
    s.traybox = wibox({
        screen = s,
        width = dpi(150),
        height = beautiful.wibar_height,
        bg = "#00000000",
        visible = false,
        ontop = true,
    })
    s.traybox:setup({
        {
            {
                nil,
                s.systray,
                expand = "none",
                layout = wibox.layout.align.horizontal,
            },
            margins = dpi(10),
            widget = wibox.container.margin,
        },
        bg = beautiful.bg_systray,
        shape = helpers.rrect(beautiful.border_radius),
        widget = wibox.container.background,
    })
    awful.placement.bottom_right(s.traybox, { margins = beautiful.useless_gap * 2 })
    s.traybox:buttons(gears.table.join(awful.button({}, 2, function()
        s.traybox.visible = false
    end)))
end)

awesome.connect_signal("elemental::dismiss", function()
    local s = mouse.screen
    s.dock.visible = false
end)

-- Every bar theme should provide these fuctions
function wibars_toggle()
    local s = awful.screen.focused()
    s.dock.visible = not s.dock.visible
end
function tray_toggle()
    local s = awful.screen.focused()
    s.traybox.visible = not s.traybox.visible
end
