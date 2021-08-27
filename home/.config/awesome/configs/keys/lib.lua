local awful = require("awful")
local gears = require("gears")

local M = {}

M.keys = function(_group, _mod, _keys)
    local group = _group or ""
    local mod = _mod or {}
    local keys = _keys or {}

    local tables = gears.table.join()

    for key, opts in pairs(keys) do
        local action = opts[1]
        local description = opts[2] or ""

        tables = gears.table.join(
            tables,
            awful.key(mod, tostring(key), action, { description = description, group = group })
        )
    end
    return tables
end

return M
