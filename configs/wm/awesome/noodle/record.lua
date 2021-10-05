local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

local helpers = require("helpers")
local apps = require("configs.apps")
local clickable_container = require("noodle.clickable_container")

local record = wibox.widget({
    markup = "",
    font = beautiful.widget_font_name .. "16",
    align = "center",
    valign = "center",
    widget = wibox.widget.textbox,
})

local record_button = wibox.widget({
        {
            record,
            margins = beautiful.widget_margin or dpi(3),
            widget = wibox.container.margin,
        },
    widget = clickable_container
})
record_button:buttons(gears.table.join(awful.button({}, 1, apps.record)))

awesome.connect_signal("script::record", function(is_record)
    if is_record == true then
        record:set_markup(helpers.colorize_text("", beautiful.red))
    else
        record:set_markup(helpers.colorize_text("", beautiful.foreground))
    end
end)

return record_button
