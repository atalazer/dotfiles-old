-- Default notification library
local naughty = require("naughty")
local ruled = require("ruled")
local awful = require("awful")

local beautiful = require("beautiful")
local dpi = require("beautiful.xresources").apply_dpi

naughty.config = {
    defaults = {
        title        = "Notification",
        position     = "top_right",
        timeout      = 5,
        ontop        = true,
        screen       = awful.screen.focused(),
        padding      = dpi(5),
        margin       = dpi(8) or beautiful.notification_margin,
        icon_size    = beautiful.notification_icon_size,
        border_width = beautiful.notification_border_width,
        width        = beautiful.notification_width,
    },
    padding = dpi(8),
    spacing = dpi(8),
    icon_dirs = {
        '/usr/share/icons/Tela',
        '/usr/share/icons/Tela-blue-dark',
        '/usr/share/icons/Papirus/',
        '/usr/share/icons/la-capitaine-icon-theme/',
        '/usr/share/icons/gnome/',
        '/usr/share/icons/hicolor/',
        '/usr/share/pixmaps/'
    },
    icon_formats = { 'svg', 'png', 'jpg', 'gif' },
}
-- XDG icon lookup
naughty.connect_signal(
    'request::icon',
    function(n, context, hints)
        if context ~= 'app_icon' then return end

        local path = menubar.utils.lookup_icon(hints.app_icon) or
            menubar.utils.lookup_icon(hints.app_icon:lower())

        if path then
            n.icon = path
        end
    end
)

ruled.notification.connect_signal('request::rules', function()
    -- All notifications will match this rule.
    ruled.notification.append_rule {
        rule = {},
        properties = {
            screen = awful.screen.preferred,
            implicit_timeout = 5
        }
    }
end)

naughty.connect_signal("request::display", function(n)
    naughty.layout.box {notification = n}
end)

