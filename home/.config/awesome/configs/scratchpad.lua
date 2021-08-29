local awful = require("awful")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local bling = require("bling")
local awestore = require("awestore") -- Totally optional, only required if you are using animations.

local screen_width = awful.screen.focused().geometry.width
local screen_height = awful.screen.focused().geometry.height

local anim_plus = awestore.tweened(1300, {
    duration = 300,
    easing = awestore.easing.cubic_in_out,
})

local anim_min = awestore.tweened(-1300, {
    duration = 300,
    easing = awestore.easing.cubic_in_out,
})

local term_scratch = bling.module.scratchpad:new({
    command = "scratchpad" or "kitty --name scracthpad",
    rule = { instance = "scratchpad" },
    sticky = false,
    autoclose = false,
    floating = true,
    geometry = {
        x = screen_width * .15,
        y = screen_height * .175,
        width = screen_width * .7,
        height = screen_height * .65,
    },
    reapply = true,
    awestore = {
        y = anim_min
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
    geometry = {
        x = screen_width * .075,
        y = screen_height * .15,
        width = screen_width * .85,
        height = screen_height * .7,
    },
    reapply = true,
    awestore = {
        y = anim_plus
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
        x = screen_width * .125,
        y = screen_height * .15,
        width = screen_width * .75,
        height = screen_height * 0.7,
    },
    awestore = {
        x = anim_min
    },
})
awesome.connect_signal("scratch::input", function()
    input_scratch:toggle()
end)

local file_scratch = bling.module.scratchpad:new({
    command = "kitty --name file_scratch -e nnn_wrapper" or "thunar --class=scratch --name=file_scratch",
    rule = {instance = "file_scratch"},
    sticky = false,
    autoclose = false,
    floating = true,
    reapply = true,
    geometry = {
        x = screen_width * .15,
        y = screen_height * .15,
        width = screen_width * .7,
        height = screen_height * 0.7,
    },
    awestore = {
        x = anim_plus
    },
})
awesome.connect_signal("scratch::file", function()
    file_scratch:toggle()
end)

local chat_scratch = bling.module.scratchpad:new({
    command = "qutebrowser --qt-arg name chat https://web.whatsapp.com https://web.telegram.org/z https://gmail.com",
    rule = {instance = "chat"},
    sticky = false,
    autoclose = false,
    floating = true,
    reapply = true,
    geometry = {
        x = screen_width * .05,
        y = screen_height * .05,
        width = screen_width * .9,
        height = screen_height * .9,
    },
    awestore = {
        x = anim_plus,
        y = anim_min
    },
})
awesome.connect_signal("scratch::chat", function()
    chat_scratch:toggle()
end)

