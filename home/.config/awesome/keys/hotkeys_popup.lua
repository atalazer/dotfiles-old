local awful = require("awful")

-- Show Help Setup {{{
local popup =
    require("awful.hotkeys_popup").widget.new({
        hide_without_description = false,
        merge_duplicates = true,
        width = awful.screen.focused().geometry.width * 0.9,
        height = awful.screen.focused().geometry.height * 0.9,
        labels = {
            Control               = "Ctrl",
            Shift                 = "Shift",
            Mod1                  = "Alt" or "",
            ISO_Level3_Shift      = "AltG",
            Mod4                  = "  ",
            Insert                = "Ins",
            Delete                = "Del",
            Escape                = "Esc",
            Next                  = " ",
            Prior                 = "",
            Home                  = "Home",
            End                   = "End",
            Up                    = "",
            Down                  = "",
            Left                  = "",
            Right                 = "",
            space                 = "SPC" or "_",
            Tab                   = "",
            Backspace             = "",
            Return                = "",
            Print                 = "",
            -- plus                  = "",
            -- minus                 = "",
            -- grave                 = "`",
            XF86MonBrightnessUp   = "",
            XF86MonBrightnessDown = "",
            XF86AudioRaiseVolume  = "",
            XF86AudioLowerVolume  = "",
            XF86AudioMute         = "",
            XF86AudioPlay         = "" or "" or "",
            XF86AudioPrev         = "",
            XF86AudioNext         = "",
            XF86AudioStop         = "",
            XF86PowerOff          = "",
        },
})
--}}}

-- ================================================================== Firefox {{{
local firefox_rule = { class = { "firefox", "Firefox" } }

for group_name, group_data in pairs({
    ["Firefox: Navigation"] = { color = x.color3, rule_any = firefox_rule },
    ["Firefox: Tabs"] = { color = x.color3, rule_any = firefox_rule },
    ["Firefox: Tools"] = { color = x.color3, rule_any = firefox_rule },
    ["Firefox: Search"] = { color = x.color3, rule_any = firefox_rule },
}) do
    popup:add_group_rules(group_name, group_data)
end

-- Table with all of our hotkeys
popup:add_hotkeys({
    ["Firefox: Navigation"] = {
        {
            modifiers = { altkey },
            keys = {
                Home = "Go Homepage",
                Left = "History Back",
                Right = "History Forward",
            }
        },
        {
            modifiers = { ctrlkey },
            keys = {
                ["["] = "History Back",
                ["]"] = "History Forward",
                r = "Reload",
                F5 = "Reload(Override cache)",
                o = "Open File",
            }

        },
        {
            modifiers = { ctrlkey, shiftkey },
            keys = { r = "Reload(Override cache)" }

        },
        {
            modifiers = {},
            keys = {
                F5 = "Reload",
                Esc = "Stop"
            }
        }
    },
    ["Firefox: Tabs"] = {
        {
            modifiers = { altkey },
            keys = { ["1..9"] = "Go to tab" },
        },
        {
            modifiers = { ctrlkey },
            keys = {
                t = "New tab",
                w = "Close tab",
                Tab = "Next tab",
                PgDn = "Next tab",
                PgUp = "Previous tab",
            },
        },
        {
            modifiers = { ctrlkey, shiftkey },
            keys = {
                Tab = "Previous tab",
                PgDn = "Move Next",
                PgUp = "Move Previous",
            },
        },
    },
    ["Firefox: Tools"] = {
        {
            modifiers = {},
            keys = { F12 = "Dev Tools" }
        },
        {
            modifiers = { ctrlkey, shiftkey},
            keys = {
                y = "Downloads",
                a = "Add-ons",
                i = "Dev Tools",
                k = "Web Console",
                c = "Inspector",
                e = "Network",
                m = "Responsive View",
                j = "Browser Console",
                s = "Screenshot"
            }
        },
        {
            modifiers = { shiftkey },
            keys = {
                F7 = "Style Editor",
                F5 = "Profiler"
            }
        },
        {
            modifiers = { ctrlkey },
            keys = {
                u = "Page Source",
                i = "Page Info",
            }
        }
    },
    ["Firefox: Search"] = {
        {
            modifiers = { altkey },
            keys = {
                Up = "Switch Search Engine",
                Down = "Switch Search Engine",
            }
        },
        {
            modifiers = { ctrlkey },
            keys = {
                f = "Find in This Page",
                g = "Find Again",
                k = "Focus Address/Search Bar",
                j = "Focus Address/Search Bar",
                Up = "Switch Default Search Engine",
                Down = "Switch Default Search Engine",
            }
        },
        {
            modifiers = { ctrlkey, shiftkey },
            keys = {
                g = "Find Previous",
            }
        },
        {
            modifiers = { shiftkey },
            keys = {
                F3 = "Find Previous"
            }
        },
        {
            modifiers = {},
            keys = {
                ["/"] = "Quick Find",
                ["`"] = "Quick Find Link only",
                F3 = "Find Again"
            }
        }
    }
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

local kitty_mod = { ctrlkey, shiftkey}
popup:add_hotkeys({    
    ["kitty"] = {
        {
            modifiers = kitty_mod,
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
            modifiers = kitty_mod,
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
            modifiers = kitty_mod,
            keys = {
                n = "New OS Window",
                w = "Close",
                f = "Move Forward",
                b = "Move Backward",
                ["Enter"] = "New",
                ["Right"] = "Next",
                ["Left"] = "Previous",
                ["`"] = "Move to top",
                ["0..9"] = "Go To Window",
            },
        },
    },
})
-- }}}

return {
    popup = popup
}
