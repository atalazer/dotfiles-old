local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")

local helpers = require("helpers")
local dpi = require("beautiful").xresources.apply_dpi
local HOME = os.getenv("HOME")

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
        shape = helpers.prrect(beautiful.sidebar_border_radius, true, false, false, true),
        opacity = beautiful.notif_center_opacity or 1
    })

    if beautiful.notif_center_position == "right" then
        awful.placement.top_right(panel)
    else
        awful.placement.top_left(panel)
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
        local activator_width = dpi(24)
        local activator_height = screen.geometry.height * 0.3
        local offset_x = dpi(20)

        local notif_activator = wibox({
            bg = x.color8,
            shape = helpers.rrect(activator_width/2),
            x = screen.geometry.width - activator_width + offset_x,
            y = (screen.geometry.height - activator_height) / 2,
            width = activator_width,
            height = activator_height,
            visible = true,
            ontop = true,
            opacity = beautiful.activator_opacity or 0.3,
            below = true,
            screen = screen,
        })

        notif_activator:connect_signal("mouse::enter", function()
            openPanel()
        end)

        -- We have set the notif_activator to be ontop, but we do not want it to be
        -- above fullscreen clients
        local no_notif_activator_ontop = function(c)
            if c.fullscreen then
                notif_activator.ontop = false
            else
                notif_activator.ontop = true
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
            require("elemental.notif_center.notif_center"),
            margins = dpi(15),
            widget = wibox.container.margin,
        },
    })

    return panel
end

return right_panel
