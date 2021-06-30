local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")

local dpi = require("beautiful").xresources.apply_dpi
local HOME = os.getenv("HOME")

local right_panel = function(screen)
    local panel_width = dpi(350)
    local panel = wibox({
        ontop = true,
        type = "dock",
        screen = screen,
        width = panel_width,
        height = screen.geometry.height,
        x = screen.geometry.width - panel_width,
        bg = x.background,
        fg = x.foreground,
    })

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
    if user.notif.show_on_mouse_screen_edge or true then
        local activator_width = dpi(1)
        local notif_activator = wibox({
            x = screen.geometry.width - activator_width,
            width = activator_width,
            visible = true,
            ontop = false,
            opacity = 0,
            below = true,
            screen = screen,
            height = screen.geometry.height,
        })
        notif_activator:connect_signal("mouse::enter", function()
            openPanel()
        end)
    end

    panel:setup({
        expand = "none",
        layout = wibox.layout.fixed.vertical,
        {
            require("elemental.notif_center.subwidgets.notif_center"),
            margins = dpi(15),
            widget = wibox.container.margin,
        },
    })

    return panel
end

return right_panel
