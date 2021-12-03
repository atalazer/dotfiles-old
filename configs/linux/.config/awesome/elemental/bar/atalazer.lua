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
        forced_weight = dpi(20),
        forced_height = dpi(20),
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
        widget_template = {
            {
                {
                    {
                        id = "text_role",
                        widget = wibox.widget.textbox,
                    },
                    layout = wibox.layout.fixed.horizontal,
                },
                right = dpi(3),
                left = dpi(3),
                widget = wibox.container.margin,
            },
            id = "background_role",
            widget = wibox.container.background,
            create_callback = function(self, c3, index, objects)
                self:connect_signal("mouse::enter", function()
                    self.bg = beautiful.bg_focus
                    if #c3:clients() > 0 then
                        awesome.emit_signal("bling::tag_preview::update", c3)
                        awesome.emit_signal("bling::tag_preview::visibility", s, true)
                    end
                end)
                self:connect_signal("mouse::leave", function()
                    self.bg = beautiful.bg_normal
                    awesome.emit_signal("bling::tag_preview::visibility", s, false)
                end)
            end,
        },
    })

    -- Tasklist widget
    s.tasklist = awful.widget.tasklist({
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags,
        buttons = keys.tasklist_buttons,
        bg = beautiful.wibar_bg,
        style = { bg = beautiful.background },
        layout = { spacing = dpi(8), layout = wibox.layout.fixed.horizontal },
        widget_template = {
            {
                {
                    {
                        awful.widget.clienticon,
                        top = dpi(1),
                        bottom = dpi(1),
                        layout = wibox.container.margin,
                    },
                    -- helpers.horizontal_pad(5),
                    -- {id = "text_role", widget = wibox.widget.textbox},
                    layout = wibox.layout.fixed.horizontal,
                },
                top = dpi(4),
                bottom = dpi(4),
                left = dpi(10),
                right = dpi(10),
                widget = wibox.container.margin,
            },
            id = "background_role",
            widget = wibox.container.background,
            create_callback = function(self, c, index, clients)
                self:connect_signal("mouse::enter", function()
                    awesome.emit_signal("bling::task_preview::visibility", s, true, c)
                end)
                self:connect_signal("mouse::leave", function()
                    awesome.emit_signal("bling::task_preview::visibility", s, false, c)
                end)
            end,
        },
    })

    -- Create a system tray widget
    s.systray = wibox.widget({
        visible = true,
        base_size = beautiful.systray_icon_size or dpi(16),
        horizontal = true,
        screen = "primary",
        widget = wibox.widget.systray,
    })

    s.tray_toggler = require("noodle.tray_toggle")
    s.toggler = require("noodle.toggler")
    s.search = require("noodle.search")
    s.battery = require("noodle.battery")()
    s.network = require("noodle.network")()
    local clock = require("noodle.clock")(s)
    local record = require("noodle.record")
    local launcher =  awful.widget.launcher({
        image = beautiful.awesome_icon,
        menu = require("elemental.menu")
    })

    -- Create the wibox
    s.bar = awful.wibar({
        position = "top",
        screen = s,
        width = s.geometry.width,
        height = beautiful.wibar_height or dpi(30),
        x = s.geometry.x,
        y = s.geometry.y,
        bg = beautiful.wibar_bg or beautiful.bg_normal,
        fg = beautiful.wibar_fg or beautiful.fg_normal,
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
            spacing = dpi(3),
            helpers.horizontal_pad(5),
            {
                launcher,
                margins = dpi(5),
                widget = wibox.container.margin,
            },
            s.taglist,
            s.promptbox,
        },
        s.tasklist,
        {
            layout = wibox.layout.fixed.horizontal,
            spacing = dpi(3),
            {
                s.systray,
                margins = dpi(5),
                widget = wibox.container.margin,
            },
            s.tray_toggler,
            record,
            s.battery,
            s.network,
            s.search,
            s.toggler,
            clock,
            {
                s.layoutbox,
                margins = dpi(5),
                widget = wibox.container.margin,
            },
            helpers.horizontal_pad(5),
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

    s.dock:connect_signal("mouse::leave", function() autohide()
    end)
    s.dock_activator:connect_signal("mouse::leave", function() autohide() end)
end)

-- Every bar theme should provide these fuctions
dock_toggle = function()
    local s = awful.screen.focused()
    if s.dock then
        s.dock.visible = not s.dock.visible
    end
end

-- Toggle wibar
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
        awesome.emit_signal("systray:toggle")
    elseif s.traybox then
        s.traybox.visible = not s.traybox.visible
    end
end

