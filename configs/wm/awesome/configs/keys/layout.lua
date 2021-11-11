local awful = require("awful")
local gears = require("gears")

local helpers = require("helpers")
local l = require("configs.keys.lib")

local utils = {
    master = {
        increase = function() awful.tag.incnmaster(1, nil, true) end,
        decrease = function() awful.tag.incnmaster(-1, nil, true) end,
    },
    columns = {
        increase = function() awful.tag.incncol(1, nil, true) end,
        decrease = function() awful.tag.incncol(-1, nil, true) end,
    },
    layout = {
        next = function() awful.layout.inc(1) end,
        prev = function() awful.layout.inc(-1) end,
        max = function()
            -- Single tap: Set max layout
            -- Double tap: Also disable floating for ALL visible clients in the tag
            awful.layout.set(awful.layout.suit.max)
            helpers.single_double_tap(nil, function()
                local clients = awful.screen.focused().clients
                for _, c in pairs(clients) do
                    c.floating = false
                end
            end)
        end,
        tilled = function ()
            -- Single tap: Set tiled layout
            -- Double tap: Also disable floating for ALL visible clients in the tag
            awful.layout.set(awful.layout.suit.tile)
            helpers.single_double_tap(nil, function()
                local clients = awful.screen.focused().clients
                for _, c in pairs(clients) do
                    c.floating = false
                end
            end)
        end,
        floating = function()
            awful.layout.set(awful.layout.suit.floating)
        end
    },
}

local keys = gears.table.join(
    l.set_keymap("Layout", {
        ["WA|h"] = { utils.master.decrease, "Decrease the number of master" },
        ["WA|l"] = { utils.master.increase, "Increase the number of master" },
        ["WA|Left"] = { utils.master.decrease, "Decrease the number of master" },
        ["WA|Right"] = { utils.master.increase, "Increase the number of master" },

        ["WA|k"] = { utils.columns.decrease, "Decrease the number of columns" },
        ["WA|j"] = { utils.columns.increase, "Increase the number of columns" },
        ["WA|Down"] = { utils.columns.decrease, "Decrease the number of columns" },
        ["WA|Up"] = { utils.columns.increase, "Increase the number of columns" },

        ["W|space"] = { utils.layout.next, "Select Next Layout" },
        ["WS|space"] = { utils.layout.prev, "Select Prev Layout" },

        ["WA|f"] = { utils.layout.floating, "Set Floating Layout" },
        ["WA|t"] = { utils.layout.tilling, "Set Tilling Layout" },
        ["WA|m"] = { utils.layout.max, "Set Max Layout" },
    })
)

return keys
