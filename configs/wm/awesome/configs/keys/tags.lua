local awful = require("awful")
local gears = require("gears")

local l = require("configs.keys.lib")
local utils = {
    tags = {
        view = {
            next = function() awful.tag.viewnext() end,
            prev = function() awful.tag.viewprev() end,
        },
        move = {
            next = function()
                local screen = awful.screen.focused()
                local ctag = screen.selected_tag
                local tag = screen.tags[ctag.index + 1]
                local c = client.focus
                if not c then return end
                if tag then if c then c:move_to_tag(tag) tag:view_only() end end
            end,
            prev = function()
                local screen = awful.screen.focused()
                local ctag = screen.selected_tag
                local tag = screen.tags[ctag.index - 1]
                local c = client.focus
                if not c then return end
                if tag then if c then c:move_to_tag(tag) tag:view_only() end end
            end,
        }
    },
    gaps = {
        increase = function() awful.tag.incgap(5, nil) end,
        decrease = function() awful.tag.incgap(-5, nil) end,
    },
    screen = {
        next = function() awful.screen.focus_relative(1) end,
        prev = function() awful.screen.focus_relative(-1) end,
    }
}

local keys = gears.table.join(
    l.set_keymap("Tag: Gaps", {
        ["W|minus"] = { utils.gaps.increase, "Increase Current Tag Gaps" },
        ["WS|minus"] = { utils.gaps.decrease, "Decrease Current Tag Gaps" },
    }),

    l.set_keymap("Tag: Move", {
        ["W|j"] = { utils.tags.view.next, "Go To Next Tag" },
        ["W|k"] = { utils.tags.view.prev, "Go To Previous Tag" },
        ["WS|j"] = { utils.tags.move.next, "Move To Next Tag" },
        ["WS|k"] = { utils.tags.move.prev, "Move To Previous Tag" },
        ["W|q"] = { awful.tag.history.restore, "Restore" }
    }),

    -- ================= Tag Moves {{{
    awful.key({
        modifiers = { superkey },
        keygroup = "numrow",
        description = "Go To Tag",
        group = "Tag: Move",
        on_press = function(index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                tag:view_only()
            end
        end,
    }),

    awful.key({
        modifiers = { superkey, shiftkey },
        keygroup = "numrow",
        description = "Move Focused Client To Tag",
        group = "Tag: Move",
        on_press = function(index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:move_to_tag(tag)
                end
            end
        end,
    }),

    awful.key({
        modifiers = { superkey, ctrlkey },
        keygroup = "numrow",
        description = "Toggle Tag",
        group = "Tag: Move",
        on_press = function(index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                awful.tag.viewtoggle(tag)
            end
        end,
    })

    -- }}}
)

return keys
