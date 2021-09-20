local awful = require("awful")
local gears = require("gears")

local M = {}

M.keys = function(group, mod, keys)
    group = group or ""
    mod = mod or {}
    keys = keys or {}

    local tables = gears.table.join()

    for key, opts in pairs(keys) do
        local action = opts[1]
        local description = opts[2] or ""

        if type(action) == "string" then
            tables = gears.table.join(
                tables,
                awful.key(mod, tostring(key), function()
                    awful.spawn.with_shell(action)
                end, {
                    description = description,
                    group = group,
                })
            )
        else
            tables = gears.table.join(
                tables,
                awful.key(mod, tostring(key), action, { description = description, group = group })
            )
        end
    end
    return tables
end

return M
