local awful = require("awful")
-- local beautiful = require("beautiful")
-- local dpi = beautiful.xresources.apply_dpi
local bling = require("lib.bling")
local rubato = require("lib.rubato") -- Totally optional, only required if you are using animations.

local screen_width = awful.screen.focused().geometry.width
local screen_height = awful.screen.focused().geometry.height

local anim_plus = rubato.timed({
    pos = 1010,
    rate = 60,
    easing = rubato.quadratic,
    intro = 0.1,
    duration = 0.3,
    awestore_compat = true,       -- This option must be set to true.
})

local anim_min = rubato.timed({
    pos = -980,
    rate = 60,
    easing = rubato.quadratic,
    intro = 0.1,
    duration = 0.3,
    awestore_compat = true,       -- This option must be set to true.
})
local term_scratch = bling.module.scratchpad:new({
    command = "scratchpad" or "kitty --name scracthpad",
    rule = { instance = "scratchpad" },
    sticky = false,
    autoclose = false,
    floating = true,
    geometry = {
        x = screen_width * 0.15,
        y = screen_height * 0.175,
        width = screen_width * 0.7,
        height = screen_height * 0.65,
    },
    reapply = true,
    rubato = {
        y = anim_min,
    },
})
awesome.connect_signal("scratch::term", function()
    term_scratch:toggle()
end)

local music_scratch = bling.module.scratchpad:new({
    command = user.music_client or "kitty --name music -e ncmpcpp",
    rule = { instance = "music" },
    sticky = true,
    autoclose = false,
    floating = true,
    reapply = true,
    geometry = {
        x = screen_width * 0.075,
        y = screen_height * 0.15,
        width = screen_width * 0.85,
        height = screen_height * 0.7,
    },
    rubato = {
        y = anim_plus,
    },
})
awesome.connect_signal("scratch::music", function()
    music_scratch:toggle()
end)

local input_scratch = bling.module.scratchpad:new({
    command = "kitty --name markdown_input -e nvim /tmp/scratchpad.md",
    rule = { instance = "markdown_input" },
    sticky = false,
    autoclose = false,
    floating = true,
    reapply = true,
    geometry = {
        x = screen_width * 0.125,
        y = screen_height * 0.15,
        width = screen_width * 0.75,
        height = screen_height * 0.7,
    },
    rubato = {
        x = anim_min,
    },
})
awesome.connect_signal("scratch::input", function()
    input_scratch:toggle()
end)

local file_scratch = bling.module.scratchpad:new({
    command = "kitty --name file_scratch -e nnn",
    rule = { instance = "file_scratch" },
    sticky = false,
    autoclose = false,
    floating = true,
    reapply = true,
    geometry = {
        x = screen_width * 0.15,
        y = screen_height * 0.15,
        width = screen_width * 0.7,
        height = screen_height * 0.7,
    },
    rubato = {
        x = anim_plus,
    },
})
awesome.connect_signal("scratch::file", function()
    file_scratch:toggle()
end)
