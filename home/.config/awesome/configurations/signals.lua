local beautiful = require("beautiful")
local awful = require("awful")
local gears = require("gears")

-- Rounded Client {{{
local function shapemanager(c)
    c.shape = function(cr, w, h)
        if not c.fullscreen and not c.maximized and c.round_corners then
            gears.shape.rounded_rect(cr, w, h, beautiful.border_radius or 10)
        else
            gears.shape.rounded_rect(cr, w, h, 0)
        end
    end
end

client.connect_signal("manage", function(c)
    if
        awesome.startup
        and not c.size_hints.user_position
        and not c.size_hints.program_position
    then
        awful.placement.no_offscreen(c)
    end
    shapemanager(c)
end)

client.connect_signal("request::geometry", function(c)
    shapemanager(c)
end)
client.connect_signal("request::activate", function(c)
    shapemanager(c)
end)
-- }}}

