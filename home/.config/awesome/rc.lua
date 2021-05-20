--[[
   ___       ___       ___       ___       ___       ___       ___
  /\  \     /\__\     /\  \     /\  \     /\  \     /\__\     /\  \
 /::\  \   /:/\__\   /::\  \   /::\  \   /::\  \   /::L_L_   /::\  \
/::\:\__\ /:/:/\__\ /::\:\__\ /\:\:\__\ /:/\:\__\ /:/L:\__\ /::\:\__\
\/\::/  / \::/:/  / \:\:\/  / \:\:\/__/ \:\/:/  / \/_/:/  / \:\:\/  /
  /:/  /   \::/  /   \:\/  /   \::/  /   \::/  /    /:/  /   \:\/  /
  \/__/     \/__/     \/__/     \/__/     \/__/     \/__/     \/__/

-- >> The file that binds everything together.
--]]


local themes = {
    "manta",        -- 1 --
    "lovelace",     -- 2 --
    "skyfall",      -- 3 --
    "ephemeral",    -- 4 --
    "amarena",      -- 5 --
}
-- Change this number to use a different theme
local theme = themes[5]
-- ===================================================================
-- Affects the window appearance: titlebar, titlebar buttons...
local decoration_themes = {
    "lovelace",       -- 1 -- Standard titlebar with 3 buttons (close, max, min)
    "skyfall",        -- 2 -- No buttons, only title
    "ephemeral",      -- 3 -- Text-generated titlebar buttons
}
local decoration_theme = decoration_themes[3]
-- ===================================================================
-- Statusbar themes. Multiple bars can be declared in each theme.
local bar_themes = {
    "manta",        -- 1 -- Taglist, client counter, date, time, layout
    "lovelace",     -- 2 -- Start button, taglist, layout
    "skyfall",      -- 3 -- Weather, taglist, window buttons, pop-up tray
    "ephemeral",    -- 4 -- Taglist, start button, tasklist, and more buttons
    "amarena",      -- 5 -- Minimal taglist and dock with autohide
}
local bar_theme = bar_themes[5]

-- ===================================================================
-- Affects which icon theme will be used by widgets that display image icons.
local icon_themes = {
    "linebit",        -- 1 -- Neon + outline
    "drops",          -- 2 -- Pastel + filled
}
local icon_theme = icon_themes[2]
-- ===================================================================
local notification_themes = {
    "lovelace",       -- 1 -- Plain with standard image icons
    "ephemeral",      -- 2 -- Outlined text icons and a rainbow stripe
    "amarena",        -- 3 -- Filled text icons on the right, text on the left
}
local notification_theme = notification_themes[3]
-- ===================================================================
local sidebar_themes = {
    "lovelace",       -- 1 -- Uses image icons
    "amarena",        -- 2 -- Text-only (consumes less RAM)
}
local sidebar_theme = sidebar_themes[2]
-- ===================================================================
local dashboard_themes = {
    "skyfall",        -- 1 --
    "amarena",        -- 2 -- Displays coronavirus stats
}
local dashboard_theme = dashboard_themes[2]
-- ===================================================================
local exit_screen_themes = {
    "lovelace",      -- 1 -- Uses image icons
    "ephemeral",     -- 2 -- Uses text-generated icons (consumes less RAM)
}
local exit_screen_theme = exit_screen_themes[2]
-- ===================================================================
-- User variables and preferences

local wallpaper = "/home/atalariq/.wallpaper/eyecandy/mountain-1_HD.jpg"

user = {
    font = "JetBrainsMono Nerd Font",
    fsize = "11",
    icon = "/home/atalariq/.icons/Papirus-Dark",

    -- >> Default applications <<
    -- Check apps.lua for more
    terminal = os.getenv("TERMINAL") or "kitty",
    floating_terminal = "kitty --name floating_terminal",
    browser = "firefox",
    file_manager = "kitty --name file -e nnn",
    editor = "kitty --name editor -e nvim",
    email_client = "kitty --name email -e neomutt",
    music_client = "kitty -o font_size=12 --name music -e ncmpcpp",

    -- >> Web Search <<
    web_search_cmd = "xdg-open https://duckduckgo.com/?q=",
    -- web_search_cmd = "xdg-open https://www.google.com/search?q=",
    
    -- Autostart apps
    autostart_debug = false,
    autostart = {
        [[
        xautolock -time 5 -locker "$(awesome-client 'lock_screen_show()' && systemctl suspend)" \
            -detectsleep -resetsaver \
            -notify 5 -notifier "notify-send 'Lockscreen' 'System will be suspended in 5s From now'"
        ]],
        "picom -b --experimental-backends --config ~/.config/picom/picom.conf",
        "fusuma -d -c ~/.config/fusuma/config-awesome.yml",
        "wal --backend colorthief -n -s -t -i " .. wallpaper ,
        "xrdb -load ~/.Xresources",
    },
    
    -- Enable rounded
    round_enabled = true,

    -- >> User profile <<
    profile_picture = os.getenv("HOME").."/.face",

    -- Directories with fallback values
    dirs = {
        downloads = os.getenv("XDG_DOWNLOAD_DIR") or "~/Downloads",
        documents = os.getenv("XDG_DOCUMENTS_DIR") or "~/Documents",
        music = os.getenv("XDG_MUSIC_DIR") or "~/Music",
        pictures = os.getenv("XDG_PICTURES_DIR") or "~/Pictures",
        videos = os.getenv("XDG_VIDEOS_DIR") or "~/Videos",
        -- Make sure the directory exists so that your screenshots
        -- are not lost
        screenshots = os.getenv("XDG_SCREENSHOTS_DIR") or "~/Pictures/Screenshots",
    },

    -- >> Sidebar <<
    sidebar = {
        hide_on_mouse_leave = true,
        show_on_mouse_screen_edge = true,
    },

    -- >> Lock screen <<
    -- This password will ONLY be used if you have not installed
    -- https://github.com/RMTT/lua-pam
    -- as described in the README instructions
    -- Leave it empty in order to unlock with just the Enter key.
    -- lock_screen_custom_password = "",
    lock_screen_custom_password = "awesome",

    -- >> Battery <<
    -- You will receive notifications when your battery reaches these
    -- levels.
    battery_threshold_low = 20,
    battery_threshold_critical = 10,

    -- >> Weather <<
    -- Get your key and find your city id at
    -- https://openweathermap.org/
    -- (You will need to make an account!)
    openweathermap_key = os.getenv("OPEN_WEATHER_MAP_API_KEY") or "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
    openweathermap_city_id = os.getenv("OPEN_WEATHER_MAP_CITY_ID") or "yyyyyyy",
    -- > Use "metric" for Celcius, "imperial" for Fahrenheit
    weather_units = "metric",

    -- >> Coronavirus <<
    -- Country to check for corona statistics
    -- Uses the https://corona-stats.online API
    coronavirus_country = os.getenv("COUNTRY") or "indonesia",

}
-- ===================================================================


-- Jit
pcall(function() jit.on() end)

-- Initialization
-- ===================================================================
-- Theme handling library
local beautiful = require("beautiful")
local xrdb = beautiful.xresources.get_current_theme()
-- Make dpi function global
dpi = beautiful.xresources.apply_dpi
-- Make xresources colors global
x = {
    background = xrdb.background,
    foreground = xrdb.foreground,
    color0     = xrdb.color0,
    color8     = xrdb.color8,
    color1     = xrdb.color1,
    color9     = xrdb.color9,
    color2     = xrdb.color2,
    color10    = xrdb.color10,
    color3     = xrdb.color3,
    color11    = xrdb.color11,
    color4     = xrdb.color4,
    color12    = xrdb.color12,
    color5     = xrdb.color5,
    color13    = xrdb.color13,
    color6     = xrdb.color6,
    color14    = xrdb.color14,
    color7     = xrdb.color7,
    color15    = xrdb.color15,
}

-- Load AwesomeWM libraries
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Default notification library
local naughty = require("naughty")

-- Load theme
local theme_dir = os.getenv("HOME") .. "/.config/awesome/themes/" .. theme .. "/"
beautiful.init(theme_dir .. "theme.lua")

-- Error handling and Autostart
-- ===================================================================
naughty.connect_signal("request::display_error", function(message, startup)
    naughty.notification {
        urgency = "critical",
        title   = "Oops, an error happened"..(startup and " during startup!" or "!"),
        message = message
    }
end)
require("autostart")

-- Features
-- ===================================================================
-- Initialize icons array and load icon theme
local icons = require("icons")
icons.init(icon_theme)

-- Keybinds and mousebinds
local keys = require("keys")

-- Load notification daemons and notification theme
local notifications = require("notifications")
notifications.init(notification_theme)

-- Load window decoration theme and custom decorations
local decorations = require("decorations")
decorations.init(decoration_theme)

-- Load helper functions
-- local helpers = require("helpers")

-- >> Elements - Desktop components
-- Statusbar(s)
require("elemental.bar."..bar_theme)

-- Exit screen
require("elemental.exit_screen."..exit_screen_theme)

-- Sidebar
require("elemental.sidebar."..sidebar_theme)

-- Dashboard (previously called: Start screen)
require("elemental.dashboard."..dashboard_theme)

-- Lock screen
-- Make sure to install lua-pam as described in the README or configure your
-- custom password in the 'user' section above
local lock_screen = require("elemental.lock_screen")
lock_screen.init()

-- App drawer
require("elemental.app_drawer")

-- Window switcher
require("elemental.window_switcher")

-- Toggle-able microphone overlay
-- require("elemental.microphone_overlay")

-- >> Daemons
-- Most widgets that display system/external info depend on evil.
-- Make sure to initialize it last in order to allow all widgets to connect to
-- their needed evil signals.
require("evil")

-- ===================================================================
-- ===================================================================

-- Get screen geometry
-- I am using a single screen setup and I assume that screen geometry will not
-- change during the session.
screen_width = awful.screen.focused().geometry.width
screen_height = awful.screen.focused().geometry.height

floating_client_placement = function(c)
    if
        awful.layout.get(mouse.screen) ~= awful.layout.suit.floating
        or #mouse.screen.clients == 1
    then
        return awful.placement.centered(c, { honor_padding = true, honor_workarea = true })
    end
    local p = awful.placement.no_overlap + awful.placement.no_offscreen
    return p(c, {
        honor_padding = true,
        honor_workarea = true,
        margins = beautiful.useless_gap * 2,
    })
end

centered_client_placement = function(c)
    return gears.timer.delayed_call(function()
        awful.placement.centered(c, { honor_padding = true, honor_workarea = true })
    end)
end

-- Layouts
-- ===================================================================
-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.floating,
    awful.layout.suit.max,
    --awful.layout.suit.spiral,
    -- awful.layout.suit.spiral.dwindle,
    --awful.layout.suit.tile.top,
    --awful.layout.suit.fair,
    --awful.layout.suit.fair.horizontal,
    --awful.layout.suit.tile.left,
    --awful.layout.suit.tile.bottom,
    --awful.layout.suit.max.fullscreen,
    --awful.layout.suit.corner.nw,
    --awful.layout.suit.magnifier,
    --awful.layout.suit.corner.ne,
    --awful.layout.suit.corner.sw,
    --awful.layout.suit.corner.se,
}

-- Wallpaper
-- ===================================================================
local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        -- local wallpaper = beautiful.wallpaper
        -- -- If wallpaper is a function, call it with the screen
        -- if type(wallpaper) == "function" then
        --     wallpaper = wallpaper(s)
        -- end

        -- >> Method 1: Built in wallpaper function
        -- gears.wallpaper.fit(wallpaper, s, true)
        -- gears.wallpaper.maximized(wallpaper, s, true)

        -- >> Method 2: Set theme's wallpaper with feh
        awful.spawn.with_shell("feh --bg-fill " .. wallpaper or os.getenv("HOME") .. "/.fehbg" )

        -- >> Method 3: Set last wallpaper with feh
        -- awful.spawn.with_shell(os.getenv("HOME") .. "/.fehbg")

    end
end

-- Set wallpaper
awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)
end)

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

-- Tags
-- ===================================================================
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
        l.floating
    }

    -- Tag names
    local tagnames = beautiful.tagnames or { 
        "1", "2", "3", "4", "5", 
        "6", "7", "8", "9", "10"
    }
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

-- Rules
-- ===================================================================
-- Rules to apply to new clients (through the "manage" signal).
require("rules")

-- Signals
-- ===================================================================
require("signals")

-- Show the dashboard on login
-- Add `touch /tmp/awesomewm-show-dashboard` to your ~/.xprofile in order to make the dashboard appear on login
local dashboard_flag_path = "/tmp/awesomewm-show-dashboard"
-- Check if file exists
awful.spawn.easy_async_with_shell("stat "..dashboard_flag_path.." >/dev/null 2>&1", function (_, __, ___, exitcode)
    if exitcode == 0 then
      -- Show dashboard
      if dashboard_show then dashboard_show() end
      -- Delete the file
      awful.spawn.with_shell("rm "..dashboard_flag_path)
    end
end)

-- Garbage collection
-- Enable for lower memory consumption
-- ===================================================================

-- collectgarbage("setpause", 160)
-- collectgarbage("setstepmul", 400)

collectgarbage("setpause", 150)
collectgarbage("setstepmul", 1000)
