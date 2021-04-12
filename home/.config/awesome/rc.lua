-- ===== User Configuration =====
RC = {}
RC.appearance = {
    profiles = os.getenv("HOME") .. "/.face",
    font = "SF Pro Text Regular 9",
    -- font      = "JetBrainsMono Nerd Font 9",
    sys_icons = "Papirus-Dark",
    wallpaper = "/home/atalariq/.wallpaper/fate.png",
}

local themes = {
    "xresources",
    "gtk",
}
RC.appearance.theme = themes[1] or "default"

local bars = {
    "tab",
    "online",
}
RC.appearance.bar = bars[1] or "default"

local decorations = {
    "minimal",
}
RC.appearance.deco = decorations[1] or "default"

local notif_style = {
    "simple",
}
RC.appearance.notif_style = notif_style[1] or "default"

RC.settings = {
    -- Wal, color pallete generator based on wallpaper
    wal_enabled = true,
    -- wal_backend = os.getenv("WAL_BACKEND") or "wal",
    wal_backend = "haishoku",
    -- Collision - Windows management ( Boolean )
    collision_enabled = false,
    -- Switcher - ALT-Tab Function
    switcher_enabled = true,
    switcher_mode = "normal",
    -- Nice - MacOS like Titlebars ( and Its Rounded ) will override users titlebars config
    nice_enabled = false,
    -- Revelation, MacOS like expose
    revelation_enabled = false,

}

-- List of apps to start once on start-up
RC.autostart = {
    "/lib/mate-polkit/polkit-mate-authentication-agent-1",
    "picom -b --experimental-backends --config ~/.config/picom/picom-blur.conf",
    "fusuma -d -c ~/.config/fusuma/config-awesome.yml",
    "mpd && mpDris2",
    -- 'keyboard-switch -s',
    "florence",
    -- 'kdeconnect-indicator',
    "xfce4-power-manager",
    "nm-applet",
    "clipit",
    [[
        xidlehook --not-when-fullscreen --not-when-audio --timer 300 "betterlockscreen -l" ""
    ]],

-- You can add more start-up applications here
}
if RC.settings.wal_enabled == true then
    table.insert(RC.autostart, "wal --backend ".. RC.settings.wal_backend .." -n -i " .. RC.appearance.wallpaper)
    table.insert(RC.autostart, "xrdb -merge -I$HOME ~/.Xresources.d/color/wal ")
else
    table.insert(RC.autostart, "[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources")
end

-- ===== Initialize =====
pcall(require, "luarocks.loader")
-- Awesome Library
-- Load AwesomeWM libraries
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")

-- Theme handling library
local beautiful = require("beautiful")
local xrdb = beautiful.xresources.get_current_theme()
dpi = beautiful.xresources.apply_dpi
x = {
    --  xrdb variable
    background = xrdb.background,
    foreground = xrdb.foreground,
    black   = xrdb.color0,
    red     = xrdb.color1,
    green   = xrdb.color2,
    yellow  = xrdb.color3,
    blue    = xrdb.color4,
    magenta = xrdb.color5,
    cyan    = xrdb.color6,
    white   = xrdb.color7,
    grey    = xrdb.color8,
    color9  = xrdb.color9,
    color10 = xrdb.color10,
    color11 = xrdb.color11,
    color12 = xrdb.color12,
    color13 = xrdb.color13,
    color14 = xrdb.color14,
    color15 = xrdb.color15,
}
-- Path List
P = {
    appearance = {
        themes = "themes",
        bars = "components.bars",
        decorations = "components.decorations",
        notification = "components.notification",
    },
    config = {
        apps = "configurations.apps",
        config = "configurations.config",
        menu = "configurations.menu",
        keys = "configurations.keys",
        mouse = "configurations.mouse",
        tag = "configurations.tag",
        rules = "configurations.rules",
    },
    module = {
        autostart = "modules.autostart",
        error_handling = "modules.error-handling",
        set_wallpaper = "modules.set-wallpaper",
        sloppy_focus = "modules.sloppy-focus",
        quake_terminal = "modules.quake-terminal",
        mpd = {
            lyrics = "modules.mpd.lyrics"
        },
        collision = "modules.collision",
        nice = "modules.nice",
        revelation = "modules.revelation",
        switcher = "modules.switcher",
    },
    widget = {
        default = "widgets.default",
        online = "widgets.online",
        sick = "widgets.sick",
    },
}
-- Error handling
require(P.module.error_handling)

-- initialize theme and set wallpaper
beautiful.init(require(P.appearance.themes .. "." .. RC.appearance.theme .. ".theme"))
require(P.module.set_wallpaper)

-- Bars and Notification Appearance
require(string.format("%s.%s", P.appearance.bars, RC.appearance.bar))
require(string.format("%s.%s", P.appearance.notification, RC.appearance.notif_style))

-- Titlebars
if RC.settings.nice_enabled == true then
    nice = require(P.module.nice)
    nice({
        titlebar_height = 24,
        titlebar_radius = 12,
        titlebar_padding_right = 3,
        titlebar_padding_left = 3,
        titlebar_font = RC.appearance.font,
        titlebar_color = beautiful.border_normal,
        titlebar_items = {
            left = { "close", "minimize", "maximize" },
            middle = "title",
            right = {} or { "sticky", "ontop", "floating" },
        },
        no_titlebar_maximized = false,

        close_color    = "#ee4266",
        minimize_color = "#ffb400",
        maximize_color = "#4CBB17",
        floating_color = "#f6a2ed",
        ontop_color    = "#f6a2ed",
        sticky_color   = "#f6a2ed",

        button_size = 12,
        button_margin_horizontal = 2,
        button_margin_vertical = 0,
        button_margin_top = 2,
        button_margin_bottom = 0,
        button_margin_left = 1,
        button_margin_right = 1,

        mb_move = nice.MB_LEFT,
        mb_resize = nice.MB_RIGHT,
        mb_contextmenu = nice.MB_MIDDLE,
        mb_win_shade_rollup = nice.MB_SCROLL_DOWN,
        mb_win_shade_rolldown = nice.MB_SCROLL_UP,

        tooltips_enabled = true,
        tooltip_messages = {
            close = "Close",
            minimize = "Minimize",
            maximize_active = "Unmaximize",
            maximize_inactive = "Maximize",
            floating_active = "Enable tiling mode",
            floating_inactive = "Enable floating mode",
            ontop_active = "Don't keep above other windows",
            ontop_inactive = "Keep above other windows",
            sticky_active = "Disable sticky mode",
            sticky_inactive = "Enable sticky mode",
        },
        context_menu_theme = {
            bg_focus = beautiful.bg_focus,
            bg_normal = beautiful.bg_normal,
            border_color = beautiful.border_normal,
            border_width = 0,
            fg_focus = beautiful.fg_focus,
            fg_normal = beautiful.fg_normal,
            font = RC.appearance.font,
            height = 25,
            width = 200,
        },
    })
else
    require(string.format("%s.%s", P.appearance.decorations, RC.appearance.deco))
end

-- Initialize Tag, Menu, and Rules
require(P.config.tag)
require(P.config.menu)
require(P.config.rules)

-- handling mousebinds and keybinds
require(P.config.keys)
require(P.config.mouse)

-- handling revelation modules
if RC.settings.revelation_enabled == true then
    revelation = require(P.module.revelation)
    revelation.init({
        tag_name = "--",
        exact = awful.rules.match,
        -- charorder = "kluipyhmfdsatgvcewqzx123456780",
        charorder = "kl;'m,./ip[]",
    })
    awful.keyboard.append_global_keybindings({
        awful.key({ W, A }, "/", function()
            revelation(
                {rule = { class = "Florence"},is_excluded = true,},
                {rule = { class = "lyricsQuake"},is_excluded = true,},
                {rule = { class = "quakeTerminal"},is_excluded = true,}
            )
        end, { description = "Expose", group = "tag" }),
    })
end
-- initialize modules
require(P.module.autostart)
require(P.module.quake_terminal)
require(P.module.mpd.lyrics)
-- require(P.module.sloppy_focus)

-- Garbage collection
-- Enable for lower memory consumption
-- ===================================================================
collectgarbage("setpause", 150)
collectgarbage("setstepmul", 1200)
