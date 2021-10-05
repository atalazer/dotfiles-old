local awful = require("awful")
local beautiful = require("beautiful")

-- Bling Module
local bling = require("lib.bling")

-- This is to slave windows' positions in floating layout
-- Not Mine
-- https://github.com/larkery/awesome/blob/master/savefloats.lua
require("modules.savefloats")

-- Better mouse resizing on tiled
-- Not mine
-- https://github.com/larkery/awesome/blob/master/better-resize.lua
require("modules.better-resize")

local screen_width = awful.screen.focused().geometry.width
local screen_height = awful.screen.focused().geometry.height

bling.widget.task_preview.enable({
    height = screen_height * 0.275,
    width = screen_width * 0.275,
    placement_fn = function(c)
        -- awful.placement.top_left(c, {
        --     margins = {
        --         top = beautiful.wibar_height + beautiful.useless_gap / 2,
        --         left = screen_width * 0.05
        --     }
        -- })
        awful.placement.bottom(c, {
            margins = {
                bottom = beautiful.dock_height + beautiful.useless_gap /2,
            }
        })
    end
})

