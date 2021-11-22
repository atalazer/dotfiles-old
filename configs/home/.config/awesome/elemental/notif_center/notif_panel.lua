local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")

local helpers = require("helpers")
local dpi = require("beautiful").xresources.apply_dpi

local notif_center = require("elemental.notif_center.notif_center")

local right_panel = function(screen)
    local panel_width = beautiful.notif_center_width or dpi(350)
    local panel = wibox({
        ontop = true,
        type = "dock",
        screen = screen,
        width = panel_width,
        height = screen.geometry.height,
        x = screen.geometry.width - panel_width,
        bg = beautiful.notif_center_bg or "#00000000",
        fg = beautiful.notif_center_fg or x.foreground,
        opacity = beautiful.notif_center_opacity or 1,
    })

    if beautiful.notif_center_position == "right" then
        awful.placement.top_right(panel)
        panel.shape = helpers.prrect(beautiful.sidebar_border_radius, true, false, false, true)
    else
        awful.placement.top_left(panel)
        panel.shape = helpers.prrect(beautiful.sidebar_border_radius, false, true, true, false)
    end
    awful.placement.maximize_vertically(panel, { honor_workarea = true, margins = { top = beautiful.useless_gap * 2 } })

    panel:struts({
        right = 0,
    })

    openPanel = function()
        panel_visible = true
        panel.visible = true
        panel:emit_signal("opened")
    end

    closePanel = function()
        panel_visible = false
        panel.visible = false
        panel:emit_signal("closed")
    end

    -- Hide this panel when app dashboard is called.
    function panel:HideDashboard()
        closePanel()
    end

    -- You can use this function in your keybindings
    -- Just add this in your global keys:
    -- _G.screen.primary.right_panel:toggle()
    function panel:toggle()
        panel_visible = not panel_visible
        if panel_visible then
            openPanel()
        else
            closePanel()
        end
    end

    -- Hide sidebar when mouse leaves
    if user.notif.hide_on_mouse_leave then
        panel:connect_signal("mouse::leave", function()
            closePanel()
        end)
    end

    -- Activate sidebar by moving the mouse at the edge of the screen
    if user.notif.show_on_mouse_screen_edge then
        local activator_width = beautiful.activator_width or dpi(2)
        local activator_height = sidebar.height * (beautiful.activator_height or 0.3)

        local activator = wibox({
            bg = beautiful.activator_bg or x.color8,
            shape = helpers.rrect(activator_width / 2),
            opacity = beautiful.activator_opacity or 0.3,
            y = (screen.geometry.height - activator_height) / 2,
            visible = true,
            ontop = true,
            below = true,
            screen = screen,
            type = "utility",
        })

        if beautiful.notif_center_position == "right" then
            activator.x = screen.geometry.width - activator_width
            activator.width = activator_width
            activator.height = activator_height
        else
            activator.width = activator_width
            activator.height = activator_height
        end

        local timer = gears.timer({
            timeout = beautiful.activator_timeout or 0.3,
            call_now = false,
            autostart = false,
            callback = function(self)
                openPanel()
                self:stop()
            end,
        })

        activator:connect_signal("mouse::enter", function()
            if timer.started then
                timer:again()
            else
                timer:start()
            end
        end)

        activator:connect_signal("mouse::leave", function()
            if timer.started then
                timer:stop()
            end
        end)

        -- We have set the notif_activator to be ontop, but we do not want it to be
        -- above fullscreen clients
        local no_notif_activator_ontop = function(c)
            if c.fullscreen then
                activator.ontop = false
            else
                activator.ontop = true
            end
        end
        client.connect_signal("focus", no_notif_activator_ontop)
        client.connect_signal("unfocus", no_notif_activator_ontop)
        client.connect_signal("property::fullscreen", no_notif_activator_ontop)
    end

    panel:setup({
        expand = "none",
        layout = wibox.layout.fixed.vertical,
        {
            notif_center,
            margins = dpi(15),
            widget = wibox.container.margin,
        },
    })

    return panel
end

return right_panel
