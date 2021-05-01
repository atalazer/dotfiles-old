local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")

local add_group_rules = hotkeys_popup.widget.add_group_rules
local add_hotkeys = hotkeys_popup.widget.add_hotkeys
-- ================================================================== Firefox {{{
local firefox_rule = { class = { "firefox", "Firefox" } }

for group_name, group_data in pairs({
    ["Firefox: tabs"] = { color = x.color3, rule_any = firefox_rule },
}) do
    add_group_rules(group_name, group_data)
end

-- Table with all of our hotkeys
local firefox = {
    ["Firefox: tabs"] = {
        {
            modifiers = { "Mod1" },
            keys = {
                ["1..9"] = "go to tab",
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
}
-- }}}
add_hotkeys(firefox)

-- ================================================================== kitty {{{
local kitty_rule = { class = { "kitty", "Kitty" } }

for group_name, group_data in pairs({
    ["kitty"] = { color = x.color2, rule_any = kitty_rule },
    ["kitty: Tab"] = { color = x.color3, rule_any = kitty_rule },
    ["kitty: Window"] = { color = x.color4, rule_any = kitty_rule },
}) do
    add_group_rules(group_name, group_data)
end

local kitty = {
    ["kitty"] = {
        {
            modifiers = { "Ctrl", "Shift" },
            keys = {
                c = "copy to clipboard",
                v = "paste from clipboard",
                s = "copy to selection",
                ["="] = "increase font size",
                ["-"] = "decrease font size",
                ["Backspace"] = "restore font size",
                ["F6"] = "set font size to 16",
            },
        },
    },
    ["kitty: Tab"] = {
        {
            modifiers = { "Ctrl", "Shift" },
            keys = {
                t = "new tab",
                q = "close tab",
                l = "change layout",
                [","] = "set tab title",
                ["["] = "previous tab",
                ["]"] = "next tab",
                o = "move tab to previous",
                p = "move tab to next",
            },
        },
    },
    ["kitty: Window"] = {
        {
            modifiers = { "Ctrl", "Shift" },
            keys = {
                n = "new_os_window",
                w = "close_window",
                f = "move_window_forward",
                b = "move_window_backward",
                ["Enter"] = "new_window",
                ["Right"] = "next_window",
                ["Left"] = "previous_window",
                ["`"] = "move_window_to_top",
                ["1"] = "first_window",
                ["2"] = "second_window",
                ["3"] = "third_window",
                ["4"] = "fourth_window",
                ["5"] = "fifth_window",
                ["6"] = "sixth_window",
                ["7"] = "seventh_window",
                ["8"] = "eighth_window",
                ["9"] = "ninth_window",
                ["0"] = "tenth_window",
            },
        },
    },
}

-- }}}
add_hotkeys(kitty)

