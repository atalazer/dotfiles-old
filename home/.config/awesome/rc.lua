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
    "atalazer", -- 1 --
}
-- Change this number to use a different theme
local theme = themes[1]
-- ===================================================================
-- Affects the window appearance: titlebar, titlebar buttons...
local decoration_themes = {
    "atalazer", -- 1 -- Text-generated titlebar buttons
}
local decoration_theme = decoration_themes[1]
-- ===================================================================
-- Statusbar themes. Multiple bars can be declared in each theme.
local bar_themes = {
    "atalazer", -- 1 -- Minimal taglist and dock with autohide
}
local bar_theme = bar_themes[1]

-- ===================================================================
-- Affects which icon theme will be used by widgets that display image icons.
local icon_themes = {
    "linebit", -- 1 -- Neon + outline
    "drops", -- 2 -- Pastel + filled
}
local icon_theme = icon_themes[2]
-- ===================================================================
local notification_themes = {
    "atalazer", -- 1 -- Filled text icons on the right, text on the left
    "lovelace", -- 2 -- Plain with standard image icons
}
local notification_theme = notification_themes[1]
-- ===================================================================
local sidebar_themes = {
    "atalazer", -- 1 -- Text-only (consumes less RAM)
}
local sidebar_theme = sidebar_themes[1]
-- ===================================================================
local dashboard_themes = {
    "atalazer", -- 1 -- Displays coronavirus stats
}
local dashboard_theme = dashboard_themes[1]
-- ===================================================================
local exit_screen_themes = {
    "atalazer", -- 1 -- Uses text-generated icons (consumes less RAM)
}
local exit_screen_theme = exit_screen_themes[1]
-- ===================================================================
-- User variables and preferences

local wallpaper = os.getenv("HOME") .. "/.wallpaper/tokyonight-minimal.jpg"

user = {
    font = "JetBrainsMono Nerd Font",
    fsize = "11",
    icon = "Papirus",

    -- >> Default applications <<
    -- Check apps.lua for more
    terminal = os.getenv("TERMINAL") or "kitty",
    floating_terminal = "kitty --name floating_terminal",
    browser = os.getenv("BROWSER") or "firefox",
    file_manager = "kitty --name file -e nnn_wrapper",
    editor = "kitty --name editor -e nvim",
    email_client = "kitty --name email -e neomutt",
    music_client = "kitty -o font_size=12 --name music -e ncmpcpp-ueberzug",

    -- >> Web Search <<
    -- web_search_cmd = "xdg-open https://duckduckgo.com/?q=",
    web_search_cmd = "xdg-open https://www.google.com/search?q=",

    -- Autostart apps
    autostart_debug = false,
    autostart = {
        "pkill dunst",
        "picom --experimental-backends --config ~/.config/picom/picom-blur.conf",
        "fusuma -c ~/.config/fusuma/config.yml",
        "xrdb -load ~/.Xresources",
        "xautolock -time 15 -locker \"systemctl suspend && awesome-client 'lock_screen_show()'\" -detectsleep -resetsaver -notify 5 -notifier \"notify-send 'Lockscreen' 'System will be suspended in 5s From now'\"",
    },

    -- Enable rounded
    round_enabled = true,

    -- >> User profile <<
    profile_picture = os.getenv("HOME") .. "/.face",

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

    -- >> Notification Center <<
    notif = {
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

-- Initialization
-- ===================================================================
-- Theme handling library
local beautiful = require("beautiful")

-- Make dpi function global
dpi = beautiful.xresources.apply_dpi

-- Make xresources colors global
local xrdb = require("xcolors") or beautiful.xresources.get_current_theme()
x = {
    background = xrdb.background,
    foreground = xrdb.foreground,
    color0 = xrdb.color0,
    color8 = xrdb.color8,
    color1 = xrdb.color1,
    color9 = xrdb.color9,
    color2 = xrdb.color2,
    color10 = xrdb.color10,
    color3 = xrdb.color3,
    color11 = xrdb.color11,
    color4 = xrdb.color4,
    color12 = xrdb.color12,
    color5 = xrdb.color5,
    color13 = xrdb.color13,
    color6 = xrdb.color6,
    color14 = xrdb.color14,
    color7 = xrdb.color7,
    color15 = xrdb.color15,
}

-- Load AwesomeWM libraries
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
awful.util.shell = "sh"

-- Default notification library
local naughty = require("naughty")

-- Load theme
local theme_dir = os.getenv("HOME") .. "/.config/awesome/themes/" .. theme .. "/"
beautiful.init(theme_dir .. "theme.lua")

-- Error handling and Autostart
-- ===================================================================
naughty.connect_signal("request::display_error", function(message, startup)
    naughty.notification({
        urgency = "critical",
        title = "Oops, an error happened" .. (startup and " during startup!" or "!"),
        message = message,
    })
end)
require("configs.autostart")

-- Features
-- ===================================================================

-- Initialize icons array and load icon theme
local icons = require("icons")
icons.init(icon_theme)

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
require("elemental.bar." .. bar_theme)

-- Exit screen
require("elemental.exit_screen." .. exit_screen_theme)

-- Sidebar
require("elemental.sidebar." .. sidebar_theme)

-- Dashboard (previously called: Start screen)
require("elemental.dashboard." .. dashboard_theme)

-- Notification Center
require("elemental.notif_center")

-- Lock screen
-- Make sure to install lua-pam as described in the README or configure your
-- custom password in the 'user' section above
local lock_screen = require("elemental.lock_screen")
lock_screen.init()

-- App drawer
require("elemental.app_drawer")

-- Window switcher
require("elemental.window_switcher")

-- Scratchpad modules
require("configs.scratchpad")

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
    if awful.layout.get(mouse.screen) ~= awful.layout.suit.floating or #mouse.screen.clients == 1 then
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
require("configs.layouts")

-- Wallpaper
-- ===================================================================
local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        -- -- If wallpaper is a function, call it with the screen
        -- if type(wallpaper) == "function" then
        --     wallpaper = wallpaper(s)
        -- end

        -- >> Method 1: Built in wallpaper function
        -- gears.wallpaper.fit(wallpaper, s, true)
        -- gears.wallpaper.maximized(wallpaper, s, true)

        -- >> Method 2: Set theme's wallpaper with feh
        -- awful.spawn.with_shell("feh --bg-fill " .. beautiful.wallpaper)

        -- >> Method 3: Set last wallpaper with feh
        awful.spawn.with_shell(os.getenv("HOME") .. "/.fehbg")
    else
        -- awful.spawn.with_shell("feh --bg-fill " .. wallpaper or os.getenv("HOME") .. "/.fehbg")
        -- >> Method 3: Set last wallpaper with feh
        awful.spawn.with_shell(os.getenv("HOME") .. "/.fehbg")
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
-- Tags Configs
require("configs.tags")

-- Rules
-- ===================================================================
-- Rules to apply to new clients (through the "manage" signal).
require("configs.rules")

-- Signals
-- ===================================================================
require("configs.window")

-- Scratchpad modules
require("configs.scratchpad")

require("configs.signals")

-- Show the dashboard on login
-- Add `touch /tmp/awesomewm-show-dashboard` to your ~/.xprofile in order to make the dashboard appear on login
local dashboard_flag_path = "/tmp/awesomewm-show-dashboard"
-- Check if file exists
awful.spawn.easy_async_with_shell("stat " .. dashboard_flag_path .. " >/dev/null 2>&1", function(_, __, ___, exitcode)
    if exitcode == 0 then
        -- Show dashboard
        if dashboard_show then
            dashboard_show()
        end
        -- Delete the file
        awful.spawn.with_shell("rm " .. dashboard_flag_path)
    end
end)

-- Garbage collection
-- Enable for lower memory consumption
-- ===================================================================

-- collectgarbage("setpause", 160)
-- collectgarbage("setstepmul", 400)

collectgarbage("setpause", 110)
collectgarbage("setstepmul", 1000)
