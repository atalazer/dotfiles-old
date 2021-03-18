-- ===== User Configuration =====
RC = {}
RC.appearance = {
    profiles  = os.getenv("HOME")..'/.face',
    font      = "SF Pro Text Regular 9",
    -- font      = "JetBrainsMono Nerd Font 9",
    sys_icons = "Papirus-Dark",
    wallpaper = "/home/atalariq/.wallpaper/mechanical/raindrops-1_FHD.jpg",
}

local themes = {
    "xresources",
    "gtk",
}
RC.appearance.theme = themes[1] or 'default'

local bars        = {
    "tab",
    "online",
}
RC.appearance.bar = bars[1] or 'default'

local decorations = {
    "minimal",
}
RC.appearance.deco = decorations[1] or 'default'

local notif_style = {
    "simple"
}
RC.appearance.notif_style = notif_style[1] or 'default'

RC.settings = {
    -- Collision - Windows management ( Boolean )
    collision_enabled = true,

    -- Switcher - ALT-Tab Function
    switcher_enabled = true,
    switcher_mode = 'normal',
}

-- List of apps to start once on start-up
RC.autostart = {
    'picom -b', 
    '/lib/mate-polkit/polkit-mate-authentication-agent-1',
    'fusuma -d -c ~/.config/fusuma/config-awesome.yml',
    'mpd && mpDris2',
    -- 'keyboard-switch -s',
    'florence',
    -- 'kdeconnect-indicator',
    'xfce4-power-manager',
    'nm-applet',
    'clipit',
    -- [[
    -- xidlehook --not-when-fullscreen --not-when-audio --timer 900 "awesome-client '_G.show_lockscreen()'" ""
    -- ]]

    -- You can add more start-up applications here
}
if RC.appearance.theme == "xresources" then
    table.insert(RC.autostart, "wal -n -i ".. RC.appearance.wallpaper)
    table.insert(RC.autostart, "[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources")
else
    table.insert(RC.autostart, "[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources")
end

-- ===== Initialize =====
pcall(require, "luarocks.loader")
-- Theme handling library
local beautiful = require("beautiful")
-- Make dpi function global
-- Awesome Library
-- Load AwesomeWM libraries
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")

-- Path List
P = {
    appearance = {
        themes       = 'themes',
        bars         = 'components.bars',
        decorations  = 'components.decorations',
        notification = 'components.notification'
    },
    config = {
        apps   = 'configurations.apps',
        config = 'configurations.config',
        menu   = 'configurations.menu',
        keys   = 'configurations.keys',
        mouse  = 'configurations.mouse',
        tag    = 'configurations.tag',
        rules  = 'configurations.rules',
    },
    module = {
        autostart      = 'modules.autostart',
        error_handling = 'modules.error-handling',
        set_wallpaper  = 'modules.set-wallpaper',
        sloppy_focus   = 'modules.sloppy-focus',
        quake_terminal = 'modules.quake-terminal',
        collision      = 'modules.collision',
        switcher       = 'modules.switcher',
    },
    widget = {
        default = 'widgets.default',
        online  = 'widgets.online',
        sick    = 'widgets.sick',
    }
}
-- initialize modules
require(P.module.error_handling)

-- initialize theme and set wallpaper
beautiful.init(require(P.appearance.themes..'.'..RC.appearance.theme..'.theme'))
require(P.module.set_wallpaper)

require(string.format('%s.%s', P.appearance.bars, RC.appearance.bar))
require(string.format('%s.%s', P.appearance.decorations, RC.appearance.deco))
require(string.format('%s.%s', P.appearance.notification, RC.appearance.notif_style))

require(P.config.tag)
require(P.config.menu)
require(P.config.rules)

require(P.config.mouse)
require(P.config.keys)

require(P.module.autostart)
require(P.module.quake_terminal)
-- require(P.module.sloppy_focus)

-- Garbage collection
-- Enable for lower memory consumption
-- ===================================================================
collectgarbage("setpause", 100)
collectgarbage("setstepmul", 1000)
