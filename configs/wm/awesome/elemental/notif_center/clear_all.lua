local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")

local dpi = require("beautiful").xresources.apply_dpi
local clickable_container = require("noodle.clickable_container")

local HOME = os.getenv("HOME")
local PATH_TO_ICONS = HOME .. "/.config/awesome/elemental/notif_center/icons/"

-- Delete button imagebox
local delete_imagebox = wibox.widget({
    {
        image = PATH_TO_ICONS .. "delete" .. ".svg",
        resize = true,
        fg = x.foreground or beautiful.fg_normal,
        bg = x.background or beautiful.bg_normal,
        forced_height = dpi(20),
        forced_width = dpi(20),
        widget = wibox.widget.imagebox,
    },
    layout = wibox.layout.fixed.horizontal,
})

local delete_button = clickable_container(wibox.container.margin(delete_imagebox, dpi(7), dpi(7), dpi(7), dpi(7)))
delete_button:buttons(gears.table.join(awful.button({}, 1, nil, function()
    _G.reset_notifbox_layout()
end)))

local delete_button_wrapped = wibox.widget({
    {
        delete_button,
        bg = x.background or beautiful.bg_normal,
        fg = x.foreground or beautiful.fg_normal,
        shape = gears.shape.circle,
        widget = wibox.container.background,
    },
    layout = wibox.layout.fixed.horizontal,
})

return delete_button_wrapped
