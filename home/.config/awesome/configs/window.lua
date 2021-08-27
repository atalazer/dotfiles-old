local awful = require("awful")
local gears = require("gears")
local gfs = gears.filesystem
local beautiful = require("beautiful")
local awestore = require("awestore")

-- Bling Module
local bling = require("bling")

local config = {
    animations = {
        fade_in = false,
    },
}

-- This is to slave windows' positions in floating layout
-- Not Mine
-- https://github.com/larkery/awesome/blob/master/savefloats.lua
require("modules.savefloats")

-- Better mouse resizing on tiled
-- Not mine
-- https://github.com/larkery/awesome/blob/master/better-resize.lua
require("modules.better-resize")

if config.animations.fade_in == true then
    client.connect_signal("request::manage", function(c)
        -- Fade in animation (fade out is in keys)
        local fade_in = awestore.tweened(0, {
            duration = beautiful.fade_duration or 250,
            easing = awestore.easing.linear,
        })
        local unsub = fade_in:subscribe(function(o)
            if c and c.valid then
                c.opacity = o / 100
            end
        end)
        fade_in:set(100)
        fade_in.ended:subscribe(function()
            unsub()
        end)
    end)
end
