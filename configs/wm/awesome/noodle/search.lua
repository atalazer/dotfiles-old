local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

local apps = require("configs.apps")
local helpers = require("helpers")
local clickable_container = require("noodle.clickable_container")

local search_cmd = function()
    if apps.search then
        apps.search()
    else
        awful.spawn.with_shell("rofi-spotlight")
    end
end

local search = wibox.widget({
    font = "icomoon bold 10",
    align = "center",
    valign = "center",
    widget = wibox.widget.textbox,
})
search.markup = helpers.colorize_text("", beautiful.wibar_fg or x.color3)

local search_button = wibox.widget({
        {
            search,
            margins = beautiful.widget_margin or dpi(3),
            widget = wibox.container.margin,
        },
    widget = clickable_container
})
search_button:buttons(gears.table.join(awful.button({}, 1, search_cmd)))

return search_button
