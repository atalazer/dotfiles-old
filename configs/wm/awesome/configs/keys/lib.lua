local awful = require("awful")
local gears = require("gears")

local M = {}

M.run = function(cmd)
    awful.spawn.with_shell(cmd)
end

M.set_keymap = function(group, keys)
    group = group or ""
    keys = keys or {}

    local tables = gears.table.join()

    for map, opt in pairs(keys) do
        local modifiers = {}
        local mods = map:match("(.*)|")
        local key = map:match("|(.*)")

        if mods then
            for mod in mods:gmatch(".") do
                if mod:match("W") then
                    table.insert(modifiers, "Mod4")
                end
                if mod:match("A") then
                    table.insert(modifiers, "Mod1")
                end
                if mod:match("S") then
                    table.insert(modifiers, "Shift")
                end
                if mod:match("C") then
                    table.insert(modifiers, "Control")
                end
            end
        else
            key = map
        end

        local action = opt[1]
        local description = opt[2] or ""

        if type(action) == "function" then
            tables = gears.table.join(
                tables,
                awful.key(modifiers, tostring(key), action, { description = description, group = group })
            )
        else
            tables = gears.table.join(
                tables,
                awful.key(modifiers, tostring(key), function()
                    awful.spawn.with_shell(action)
                end, {
                    description = description,
                    group = group,
                })
            )
        end
    end
    return tables
end

return M
