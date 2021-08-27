local awful = require("awful")
local beautiful = require("beautiful")
-- local awestore = require("awestore")

-- Animations
-- ======================================
-- local anim_plus = awestore.tweened(1300, {
--     duration = 300,
--     easing = awestore.easing.cubic_in_out,
-- })

-- local anim_min = awestore.tweened(-1300, {
--     duration = 300,
--     easing = awestore.easing.cubic_in_out,
-- })

-- Layout per Tags
-- =======================================
awful.screen.connect_for_each_screen(function(s)
    -- Each screen has its own tag table.
    local l = awful.layout.suit -- Alias to save time :)
    -- Tag layouts
    local layouts = {
        l.tile,
        l.max,
        l.max,
        l.max,
        l.floating,
        l.floating,
        l.floating,
        l.floating,
        l.floating,
        l.floating,
    }

    -- Tag names
    local tagnames = beautiful.tagnames or { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10" }

    -- Create all tags at once (without seperate configuration for each tag)
    awful.tag(tagnames, s, layouts)

    -- Create tags with seperate configuration for each tag
    -- awful.tag.add(tagnames[1], {
    --     layout = layouts[1],
    --     screen = s,
    --     master_width_factor = 0.6,
    --     selected = true,
    -- })
    -- ...
end)

