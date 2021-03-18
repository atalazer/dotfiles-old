local wibox = require("wibox")
local awful = require("awful")
local beautiful = require("beautiful")

local dpi = beautiful.xresources.apply_dpi
local margin = wibox.container.margin

local function text_wrapper(widget, left, right, top, bottom)
    left   = left   or 0
    right  = right  or 6
    top    = top    or 4
    bottom = bottom or 4

    return margin(widget, dpi(left), dpi(right), dpi(top), dpi(bottom))
end

local function icon_wrapper(icon, left, right, top, bottom)
    left   = left   or 4
    right  = right  or 4
    top    = top    or 4
    bottom = bottom or 4

    return margin(icon, dpi(left), dpi(right), dpi(top), dpi(bottom))
end
-- Modules
require(P.widget.default)
local taglist    = require(P.widget.sick..".taglist")
local systray    = require(P.widget.sick..".systray")
local memory     = require(P.widget.sick..".memory")
local cpu        = require(P.widget.sick..".cpu")
local netspeed   = require(P.widget.sick..".netspeed")
local clock      = require(P.widget.sick..".clock")
local temp       = require(P.widget.sick..".temp")
local volume     = require(P.widget.sick..".volume")
local hddtemp    = require(P.widget.sick..".hddtemp")
local brightness = require(P.widget.sick..".brightness")
local mpd        = require(P.widget.sick..".mpd")



local M = {}

local bar = awful.wibar({position = "bottom", screen = s, height= 23})

function M.bar(s)
    -- Create the wibox
    -- Add widgets to the wibox
    bar:setup {
        layout = wibox.layout.align.horizontal,
        {
            -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            -- taglist.widget(s),
            s.mytaglist,
            icon_wrapper(mpd.icon, 5, 5, 5, 5),
            text_wrapper(mpd.widget, 0, 0, 0, 2),
        },
        {
            layout = wibox.layout.fixed.horizontal,
        },
        {
            layout = wibox.layout.fixed.horizontal,

            icon_wrapper(netspeed.network_icon, 5, 5, 5, 5),
            text_wrapper(netspeed.ssid, 0, 0, 0, 3),
            icon_wrapper(netspeed.down_icon),
            text_wrapper(netspeed.down),
            icon_wrapper(netspeed.up_icon),
            text_wrapper(netspeed.up),

            icon_wrapper(temp.icon),
            text_wrapper(temp.widget),

            icon_wrapper(hddtemp.icon, 5, 0, 5, 5),
            text_wrapper(hddtemp.widget.sda),

            -- icon_wrapper(hddtemp.icon, 5, 0, 5, 5),
            --[[ icon_wrapper(hddtemp.icon),
            text_wrapper(hddtemp.widget.sdb), --]]

            icon_wrapper(cpu.icon),
            text_wrapper(cpu.widget),

            icon_wrapper(memory.icon),
            text_wrapper(memory.widget),

            icon_wrapper(brightness.icon, 5, 5, 5, 5),
            text_wrapper(brightness.widget),

            icon_wrapper(volume.icon),
            text_wrapper(volume.widget),

            icon_wrapper(clock.icon, 5, 5, 5, 5),
            text_wrapper(clock.widget),

            wibox.widget.systray(),
            -- margin(systray.widget, dpi(0), dpi(2), dpi(4), dpi(4)),
        }
    }
    return bar
end

function M.visible()
    bar.visible = not bar.visible
end 

return M
