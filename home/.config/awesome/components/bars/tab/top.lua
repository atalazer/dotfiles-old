local wibox = require("wibox")
local awful = require("awful")

-- Modules
require(P.widget.default)
local tasklist = require(P.widget.sick..".tasklist")

local M = {}

local bar = awful.wibar({position = "top", screen = s, height= 20})

function M.bar(s)
    -- Create the wibox
    -- Add widgets to the wibox
    bar:setup {
            layout = wibox.layout.align.horizontal,
            {
                layout = wibox.layout.fixed.horizontal,
                s.mypromptbox,
            },
            tasklist.widget(s),
            {
                layout = wibox.layout.fixed.horizontal,
                s.mylayoutbox,
            }
        }
    return bar
end

function M.visible()
    bar.visible = not bar.visible
end

return M
