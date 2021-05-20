local awful = require("awful")

-- Show Help Setup {{{
local popup =
    require("awful.hotkeys_popup").widget.new({
        hide_without_description = true,
        merge_duplicates = true,
        width = awful.screen.focused().geometry.width * 0.8,
        height = awful.screen.focused().geometry.height * 0.8,
        labels = {
            Control               = "C",
            Shift                 = "S",
            Mod1                  = "A",
            ISO_Level3_Shift      = "Ag",
            Mod4                  = "W",
            Insert                = "INS",
            Delete                = "DEL",
            Backspace             = "BS",
            Next                  = "NEXT>",
            Prior                 = "<PREV",
            Escape                = "ESC",
            Tab                   = "TAB",
            space                 = "SPC",
            Return                = "RET",
            XF86MonBrightnessUp   = "B+",
            XF86MonBrightnessDown = "B-",
            XF86AudioRaiseVolume  = "V+",
            XF86AudioLowerVolume  = "V-",
            XF86AudioMute         = "-V-",
            XF86AudioPlay         = "||",
            XF86AudioPrev         = "<|",
            XF86AudioNext         = "|>",
            XF86AudioStop         = "[]",
        },
})
--}}}

-- ================================================================== Firefox {{{
local firefox_rule = { class = { "firefox", "Firefox" } }

for group_name, group_data in pairs({
    ["Firefox: Tabs"] = { color = x.color3, rule_any = firefox_rule },
}) do
    popup:add_group_rules(group_name, group_data)
end

-- Table with all of our hotkeys
popup:add_hotkeys({
    ["Firefox: Tabs"] = {
        {
            modifiers = { "Mod1" },
            keys = {
                ["1-9"] = "go to tab",
            },
        },
        {
            modifiers = { "Ctrl" },
            keys = {
                t = "new tab",
                w = "close tab",
                ["Tab"] = "next tab",
            },
        },
        {
            modifiers = { "Ctrl", "Shift" },
            keys = {
                ["Tab"] = "previous tab",
            },
        },
    },
})
-- }}}

-- ================================================================== kitty {{{
local kitty_rule = { class = { "kitty" }, instance = { "kitty" } }

for group_name, group_data in pairs({
    ["Kitty"] = { color = x.color2, rule_any = kitty_rule },
    ["Kitty: Tab"] = { color = x.color3, rule_any = kitty_rule },
    ["Kitty: Window"] = { color = x.color4, rule_any = kitty_rule },
}) do
    popup:add_group_rules(group_name, group_data)
end

popup:add_hotkeys({    
    ["kitty"] = {
        {
            modifiers = { "Ctrl", "Shift" },
            keys = {
                c = "Copy to clipboard",
                v = "Paste from clipboard",
                s = "Copy to selection",
                ["="] = "Increase font size",
                ["-"] = "Decrease font size",
                ["Backspace"] = "Restore font size",
                ["F6"] = "Set font size to 16",
            },
        },
    },
    ["kitty: Tab"] = {
        {
            modifiers = { "Ctrl", "Shift" },
            keys = {
                t = "New tab",
                q = "Close tab",
                l = "Change layout",
                [","] = "Set tab title",
                ["["] = "Previous tab",
                ["]"] = "Next tab",
                o = "Move tab to previous",
                p = "Move tab to next",
            },
        },
    },
    ["kitty: Window"] = {
        {
            modifiers = { "Ctrl", "Shift" },
            keys = {
                n = "New OS Window",
                w = "Close",
                f = "Move Forward",
                b = "Move Backward",
                ["Enter"] = "New",
                ["Right"] = "Next",
                ["Left"] = "Previous",
                ["`"] = "Move to top",
                ["0-9"] = "Go To Window",
            },
        },
    },
})
-- }}}

return {
    popup = popup
}
