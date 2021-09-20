-- Provides:
-- evil::temperature
--      temperature (integer - in Celcius)
local awful = require("awful")

local update_interval = 15

-- @NOTE: Please Change #temp_script based on your machine

-- local temp_script = [[
--     sh -c " sensors | grep Package | awk '{print $4}' | cut -c 2-3 "
-- ]]

local temp_script = [[
    sh -c "sensors | grep temp1 | sed -n 3p | awk '{print $2}' | cut -c 2-3"
]]

-- Periodically get temperature info
awful.widget.watch(temp_script, update_interval, function(widget, stdout)
    awesome.emit_signal("evil::temperature", tonumber(stdout))
end)
