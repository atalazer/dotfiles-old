local awful = require("awful")
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup.widget")
local popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")

-- ========== Popup {{{
popup.widget.default_widget = popup.widget.new({
  hide_without_description = true,
  merge_duplicates = true,
  width = beautiful.hotkeys_popup_width or awful.screen.focused().geometry.width * 0.9,
  height =  beautiful.hotkeys_popup_height or awful.screen.focused().geometry.height * 0.9,
  labels =  beautiful.hotkeys_popup_labels or {
    Control               = "Ctrl",
    Shift                 = "Sft",
    Mod1                  = "Alt" or "",
    ISO_Level3_Shift      = "AltG",
    Mod4                  = "Sup",
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
    space                 = "SPC",
    Tab                   = "Tab",
    Backspace             = "BS",
    Return                = "Enter",
    Print                 = "Print",
    XF86MonBrightnessUp   = "",
    XF86MonBrightnessDown = "",
    XF86AudioRaiseVolume  = "",
    XF86AudioLowerVolume  = "",
    XF86AudioMute         = "",
    XF86AudioPlay         = "懶",
    XF86AudioPrev         = "",
    XF86AudioNext         = "",
    XF86AudioStop         = "",
    XF86PowerOff          = "",
  },
})

--}}}

-- ========== Firefox {{{
local firefox_rule = { class = { "firefox", "Firefox" } }

for group_name, group_data in pairs({
  ["A:Firefox::Navigation"] = { color = x.color3, rule_any = firefox_rule },
  ["A:Firefox::Tabs"] = { color = x.color3, rule_any = firefox_rule },
  ["A:Firefox::Tools"] = { color = x.color3, rule_any = firefox_rule },
  ["A:Firefox::Search"] = { color = x.color3, rule_any = firefox_rule },
}) do
  hotkeys_popup.add_group_rules(group_name, group_data)
end

-- Table with all of our hotkeys
hotkeys_popup.add_hotkeys({
  ["A:Firefox::Navigation"] = {
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
  ["A:Firefox::Tabs"] = {
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
  ["A:Firefox::Tools"] = {
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
  ["A:Firefox::Search"] = {
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

-- ========== kitty {{{
local kitty_rule = { class = { "kitty" }, instance = { "kitty" } }

for group_name, group_data in pairs({
  ["A:Kitty"] = { color = x.color2, rule_any = kitty_rule },
  ["A:Kitty::Tab"] = { color = x.color3, rule_any = kitty_rule },
  ["A:Kitty::Window"] = { color = x.color4, rule_any = kitty_rule },
}) do
  hotkeys_popup.add_group_rules(group_name, group_data)
end

local kitty_mod = { ctrlkey, shiftkey}
hotkeys_popup.add_hotkeys({
  ["A:kitty"] = {
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
  ["A:kitty::Tab"] = {
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
  ["A:kitty::Window"] = {
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

-- ========== Qutebrowser {{{
local qutebrowser_rule = { class = { "qutebrowser" }, instance = { "qutebrowser" } }

for group_name, group_data in pairs({
  ["A:Qutebrowser"] = { color = x.color2, rule_any = qutebrowser_rule },
}) do
  hotkeys_popup.add_group_rules(group_name, group_data)
end

hotkeys_popup.add_hotkeys({
  ["A:Qutebrowser"] = {
    {
      modifiers = {},
      keys = {
        d = "Close Tab",
        f = "Show Hint",
        yd = "Yank Domain",
        yy = "Yank URL",
        yi = "Yank Inline",
        yt = "Yank Title",
        o = "Open URL In Current Tab",
        O = "Open URL In New Tab",
      },
    },
  },
})
-- }}}

-- vim: set ft=lua ts=2 sw=2 foldenable foldmethod=marker:
