local theme_name = "atalazer"
local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local helpers = require("helpers")

local filesystem = gears.filesystem
local theme_assets = beautiful.theme_assets
-- local xresources = beautiful.xresources
-- local gtk_variable = beautiful.gtk.get_theme_variables

local themes_path = filesystem.get_themes_dir()
local theme_dir = filesystem.get_configuration_dir() .. "/themes/"
local layout_icon_path = theme_dir .. theme_name .. "/layout/"
local titlebar_icon_path = theme_dir .. theme_name .. "/titlebar/"
local tip = titlebar_icon_path --alias to save time/space

local theme = dofile(themes_path .. "default/theme.lua")

theme.background = x.background
theme.foreground = x.foreground
theme.black = x.color0
theme.red = x.color1
theme.green = x.color2
theme.yellow = x.color3
theme.blue = x.color4
theme.magenta = x.color5
theme.cyan = x.color6
theme.white = x.color7
theme.light_black = x.color8
theme.light_red = x.color9
theme.light_green = x.color10
theme.light_yellow = x.color11
theme.light_blue = x.color12
theme.light_magenta = x.color13
theme.light_cyan = x.color14
theme.light_white = x.color15

-- theme.wallpaper = os.getenv("HOME") .. "/.config/awesome/themes/" .. theme_name .. "/wallpaper.jpg"
theme.font_name = "Inter Regular "
theme.font = theme.font_name .. "11"
theme.font_bold_name = "Inter Bold "
theme.font_bold = theme.font_bold_name .. "11"
theme.font_mono_name = "FiraCode Nerd Font Mono "
theme.font_mono = theme.font_mono_name .. "12"
theme.icon_theme = user.icon or "Adwaita"
theme.transparent = "#00000000"

-- Background Colors
-- -------------------------------
theme.bg_normal = theme.background
theme.bg_dark = theme.background
theme.bg_focus = x.color0
theme.bg_urgent = x.color8
theme.bg_minimize = x.color8

-- Foreground Colors
-- -------------------------------
theme.fg_normal = theme.foreground
theme.fg_focus = x.color6
theme.fg_urgent = x.color9
theme.fg_minimize = x.color8

-- Gaps
-- -------------------------------
theme.useless_gap = dpi(5)
theme.screen_margin = dpi(2)

-- Borders
-- -------------------------------
theme.border_width = dpi(1)
theme.border_color = x.color0
theme.border_normal = x.background
theme.border_focus = x.background
theme.border_radius = dpi(8)

-- Systray
-- -------------------------------
theme.bg_systray = theme.background
theme.systray_icon_spacing = dpi(5)
theme.systray_icon_size = dpi(14)

-- Titlebars
-- -------------------------------
theme.titlebars_enabled = true
theme.titlebar_size = dpi(28)
theme.titlebar_title_enabled = true
theme.titlebar_font = theme.font_name .. "9"
theme.titlebar_title_align = "center"
theme.titlebar_position = "top"
theme.titlebar_bg_focus = x.color0
theme.titlebar_bg_normal = theme.background
theme.titlebar_fg_focus = theme.foreground
theme.titlebar_fg_normal = x.color8

-- Menu
-- -------------------------------
theme.menu_height = dpi(35)
theme.menu_width = dpi(180)
theme.menu_bg_normal = x.color0
theme.menu_fg_normal = x.color7
theme.menu_bg_focus = x.color8 .. "55"
theme.menu_fg_focus = x.color7
theme.menu_border_width = dpi(0)
theme.menu_border_color = x.color0

-- Tooltips
-- -------------------------------
theme.tooltip_bg = theme.background
theme.tooltip_fg = theme.foreground
theme.tooltip_border_color = theme.transparent
theme.tooltip_border_width = 0
theme.tooltip_gaps = dpi(5)
theme.tooltip_shape = function(cr, w, h)
    gears.shape.rounded_rect(cr, w, h, dpi(8))
end

-- Notifications
-- -------------------------------
theme.notification_position = "top_right"
theme.notification_title = "System Notification"
theme.notification_border_width = dpi(0)
theme.notification_border_radius = theme.border_radius
theme.notification_border_color = x.color0
theme.notification_bg = theme.background
theme.notification_fg = theme.foreground
theme.notification_font = theme.font
theme.notification_opacity = 1.00
theme.notification_icon_size = dpi(32)
theme.notification_height = dpi(200)
theme.notification_width = dpi(450)
theme.notification_max_height = dpi(200)
theme.notification_max_width = dpi(450)
theme.notification_margin = dpi(20)
theme.notification_padding = theme.screen_margin * 2
theme.notification_spacing = theme.screen_margin * 4

-- Hotkeys popup
-- -------------------------------
theme.hotkeys_font = theme.font_mono_name .. "10"
theme.hotkeys_description_font = theme.font_mono_name .. "9"
theme.hotkeys_bg = theme.background
theme.hotkeys_fg = theme.foreground
theme.hotkeys_label_bg = x.foreground
theme.hotkeys_label_fg = x.background
theme.hotkeys_border_color = x.color8
theme.hotkeys_modifiers_fg = x.color4
theme.hotkeys_border_width = dpi(1)
theme.hotkeys_group_margin = dpi(20)
theme.hotkeys_width = awful.screen.focused().geometry.width * 0.90
theme.hotkeys_height = awful.screen.focused().geometry.height * 0.90
theme.hotkeys_shape = function(cr, w, h)
    gears.shape.rounded_rect(cr, w, h, theme.border_radius)
end

-- Edge snap
-- -------------------------------
theme.snap_shape = gears.shape.rectangle
theme.snap_bg = theme.foreground
theme.snap_border_width = dpi(2)

-- =================================================== Others

-- Icon
-- -------------------------------
theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height, theme.bg_focus, theme.fg_focus)

-- Wibar(s)
-- Keep in mind that these settings could be ignored by the bar theme
-- -------------------------------
theme.wibar_position = "right"
theme.wibar_font = "Inter Medium 11"
theme.wibar_fg = theme.foreground
theme.wibar_bg = theme.background
--theme.wibar_opacity = 0.7
theme.wibar_border_color = x.color0
theme.wibar_border_width = dpi(0)
theme.wibar_border_radius = dpi(0)
theme.wibar_width = dpi(380)
theme.wibar_height = dpi(28)

-- Widgets
-- -------------------------------
theme.widget_margin = dpi(3)
theme.widget_fg = theme.fg_normal
theme.widget_font_name = "Inter Medium "
theme.widget_font = theme.widget_font_name .. "11"
theme.widget_border_width = dpi(2)
theme.widget_border_color = theme.background

-- Widget separator
-- -------------------------------
theme.separator_tethemet = "|"
theme.separator_fg = x.color8
theme.prefix_fg = x.color8

--Tasklist
-- -------------------------------
theme.tasklist_disable_icon = false
theme.tasklist_plain_task_name = false
theme.tasklist_font = theme.wibar_font
theme.tasklist_font_minimized = theme.tasklist_font
theme.tasklist_bg_focus = x.color0
theme.tasklist_fg_focus = theme.foreground
theme.tasklist_bg_normal = "#00000000"
theme.tasklist_fg_normal = theme.foreground .. "77"
theme.tasklist_bg_minimize = "#00000000"
theme.tasklist_fg_minimize = x.color8
theme.tasklist_bg_urgent = theme.background
theme.tasklist_fg_urgent = x.color3
theme.tasklist_align = "center"
theme.tasklist_spacing = dpi(2)

-- Dock
-- -------------------------------
theme.dock_item_font = "icomoon 15"
theme.dock_item_bg = x.background
theme.dock_item_size = dpi(50)
theme.dock_item_shape = helpers.squircle(1.7, 0)
theme.dock_item_margin = dpi(8)
theme.dock_indicator_spacing = dpi(8)
theme.dock_indicator_height = dpi(7)
theme.dock_height = theme.dock_item_size + theme.dock_indicator_height

-- Text Taglist (default)
-- -------------------------------
theme.taglist_disable_icon = false
theme.taglist_spacing = dpi(5)
theme.taglist_font = theme.wibar_font
theme.taglist_bg_focus = theme.background
theme.taglist_bg_occupied = theme.background
theme.taglist_bg_empty = theme.background
theme.taglist_bg_urgent = theme.background
theme.taglist_bg_volatile = theme.background
theme.taglist_fg_focus = x.color6
theme.taglist_fg_urgent = x.color3
theme.taglist_fg_occupied = x.color5
theme.taglist_fg_empty = x.color8
theme.taglist_fg_volatile = x.color9

-- Generate taglist squares:
local taglist_square_size = dpi(0)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.fg_focus)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, theme.fg_normal)

-- Prompt
-- -------------------------------
theme.prompt_fg = x.color11

-- Titlebar buttons
-- Define the images to load
-- -------------------------------
theme.titlebar_close_button_normal = tip .. "close_normal.svg"
theme.titlebar_close_button_focus = tip .. "close_focus.svg"
theme.titlebar_minimize_button_normal = tip .. "minimize_normal.svg"
theme.titlebar_minimize_button_focus = tip .. "minimize_focus.svg"
theme.titlebar_ontop_button_normal_inactive = tip .. "ontop_normal_inactive.svg"
theme.titlebar_ontop_button_focus_inactive = tip .. "ontop_focus_inactive.svg"
theme.titlebar_ontop_button_normal_active = tip .. "ontop_normal_active.svg"
theme.titlebar_ontop_button_focus_active = tip .. "ontop_focus_active.svg"
theme.titlebar_sticky_button_normal_inactive = tip .. "sticky_normal_inactive.svg"
theme.titlebar_sticky_button_focus_inactive = tip .. "sticky_focus_inactive.svg"
theme.titlebar_sticky_button_normal_active = tip .. "sticky_normal_active.svg"
theme.titlebar_sticky_button_focus_active = tip .. "sticky_focus_active.svg"
theme.titlebar_floating_button_normal_inactive = tip .. "floating_normal_inactive.svg"
theme.titlebar_floating_button_focus_inactive = tip .. "floating_focus_inactive.svg"
theme.titlebar_floating_button_normal_active = tip .. "floating_normal_active.svg"
theme.titlebar_floating_button_focus_active = tip .. "floating_focus_active.svg"
theme.titlebar_maximized_button_normal_inactive = tip .. "maximized_normal_inactive.svg"
theme.titlebar_maximized_button_focus_inactive = tip .. "maximized_focus_inactive.svg"
theme.titlebar_maximized_button_normal_active = tip .. "maximized_normal_active.svg"
theme.titlebar_maximized_button_focus_active = tip .. "maximized_focus_active.svg"
-- (hover)
-- -------------------------------
theme.titlebar_close_button_normal_hover = tip .. "close_normal_hover.svg"
theme.titlebar_close_button_focus_hover = tip .. "close_focus_hover.svg"
theme.titlebar_minimize_button_normal_hover = tip .. "minimize_normal_hover.svg"
theme.titlebar_minimize_button_focus_hover = tip .. "minimize_focus_hover.svg"
theme.titlebar_ontop_button_normal_inactive_hover = tip .. "ontop_normal_inactive_hover.svg"
theme.titlebar_ontop_button_focus_inactive_hover = tip .. "ontop_focus_inactive_hover.svg"
theme.titlebar_ontop_button_normal_active_hover = tip .. "ontop_normal_active_hover.svg"
theme.titlebar_ontop_button_focus_active_hover = tip .. "ontop_focus_active_hover.svg"
theme.titlebar_sticky_button_normal_inactive_hover = tip .. "sticky_normal_inactive_hover.svg"
theme.titlebar_sticky_button_focus_inactive_hover = tip .. "sticky_focus_inactive_hover.svg"
theme.titlebar_sticky_button_normal_active_hover = tip .. "sticky_normal_active_hover.svg"
theme.titlebar_sticky_button_focus_active_hover = tip .. "sticky_focus_active_hover.svg"
theme.titlebar_floating_button_normal_inactive_hover = tip .. "floating_normal_inactive_hover.svg"
theme.titlebar_floating_button_focus_inactive_hover = tip .. "floating_focus_inactive_hover.svg"
theme.titlebar_floating_button_normal_active_hover = tip .. "floating_normal_active_hover.svg"
theme.titlebar_floating_button_focus_active_hover = tip .. "floating_focus_active_hover.svg"
theme.titlebar_maximized_button_normal_inactive_hover = tip .. "maximized_normal_inactive_hover.svg"
theme.titlebar_maximized_button_focus_inactive_hover = tip .. "maximized_focus_inactive_hover.svg"
theme.titlebar_maximized_button_normal_active_hover = tip .. "maximized_normal_active_hover.svg"
theme.titlebar_maximized_button_focus_active_hover = tip .. "maximized_focus_active_hover.svg"

-- Dashboard
-- -------------------------------
theme.dashboard_bg = x.color0 .. "CC"
theme.dashboard_fg = x.color7

-- Sidebar
-- -------------------------------
theme.sidebar_bg = theme.background
theme.sidebar_fg = x.color7
theme.sidebar_opacity = 0.98
theme.sidebar_position = "left" -- left or right
theme.sidebar_width = dpi(300)
theme.sidebar_border_radius = dpi(30)

-- Notif Center
-- -------------------------------
theme.notif_center_bg = theme.background
theme.notif_center_fg = x.color7
theme.notif_center_opacity = 0.98
theme.notif_center_width = dpi(360)
theme.notif_center_border_radius = dpi(30)

-- Sidebar and Notif Center activator
-- -------------------------------
theme.activator_bg = x.color8
theme.activator_width = dpi(2)
theme.activator_height = 0.3
theme.activator_opacity = 0.5
theme.activator_timeout = 0.5

theme.notifbotheme_bg = x.color0

if theme.sidebar_position == "left" then
    theme.notif_center_position = "right"
else
    theme.notif_center_position = "left"
end

-- Exit screen
-- -------------------------------
theme.exit_screen_bg = x.color0 .. "CC"
theme.exit_screen_fg = x.color7
theme.exit_screen_font = theme.font_name .. "20"
theme.exit_screen_icon_size = dpi(180)

-- Lock screen
-- -------------------------------
theme.lock_screen_bg = x.color0 .. "CC"
theme.lock_screen_fg = x.color7

-- You can use your own layout icons like this:
-- -------------------------------
theme.layout_fairh = layout_icon_path .. "fairh.png"
theme.layout_fairv = layout_icon_path .. "fairv.png"
theme.layout_floating = layout_icon_path .. "floating.png"
theme.layout_magnifier = layout_icon_path .. "magnifier.png"
theme.layout_max = layout_icon_path .. "max.png"
theme.layout_fullscreen = layout_icon_path .. "fullscreen.png"
theme.layout_tilebottom = layout_icon_path .. "tilebottom.png"
theme.layout_tileleft = layout_icon_path .. "tileleft.png"
theme.layout_tile = layout_icon_path .. "tile.png"
theme.layout_tiletop = layout_icon_path .. "tiletop.png"
theme.layout_spiral = layout_icon_path .. "spiral.png"
theme.layout_dwindle = layout_icon_path .. "dwindle.png"
theme.layout_cornernw = layout_icon_path .. "cornernw.png"
theme.layout_cornerne = layout_icon_path .. "cornerne.png"
theme.layout_cornersw = layout_icon_path .. "cornersw.png"
theme.layout_cornerse = layout_icon_path .. "cornerse.png"

-- theme = theme_assets.recolor_layout(theme, theme.foreground)

-- Noodle widgets customization --
-- Desktop mode widget variables
-- Symbols     
-- -------------------------------
theme.desktop_mode_color_floating = x.color4
theme.desktop_mode_color_tile = x.color3
theme.desktop_mode_color_max = x.color1
theme.desktop_mode_text_floating = "f"
theme.desktop_mode_text_tile = "t"
theme.desktop_mode_text_max = "m"

-- Minimal tasklist widget variables
-- -------------------------------
theme.minimal_tasklist_visible_clients_color = x.color4
theme.minimal_tasklist_visible_clients_text = ""
theme.minimal_tasklist_hidden_clients_color = x.color7
theme.minimal_tasklist_hidden_clients_text = ""

-- Mpd song
-- -------------------------------
theme.mpd_song_title_color = x.color7
theme.mpd_song_artist_color = x.color7
theme.mpd_song_paused_color = x.color8

-- Volume bar
-- -------------------------------
theme.volume_bar_active_color = x.color5
theme.volume_bar_active_background_color = x.color0
theme.volume_bar_muted_color = x.color8
theme.volume_bar_muted_background_color = x.color0

-- Temperature bar
-- -------------------------------
theme.temperature_bar_active_color = x.color1
theme.temperature_bar_background_color = x.color0

-- Battery bar
-- -------------------------------
theme.battery_bar_active_color = x.color6
theme.battery_bar_background_color = x.color0

-- CPU bar
-- -------------------------------
theme.cpu_bar_active_color = x.color2
theme.cpu_bar_background_color = x.color0

-- RAM bar
-- -------------------------------
theme.ram_bar_active_color = x.color4
theme.ram_bar_background_color = x.color0

-- Brightness bar
-- -------------------------------
theme.brightness_bar_active_color = x.color3
theme.brightness_bar_background_color = x.color0

-- UI Groups
-- -------------------------------
theme.groups_title_bg = "#ffffff" .. "15"
theme.groups_bg = "#ffffff" .. "10"
theme.groups_radius = dpi(16)

-- UI events
-- -------------------------------
theme.leave_event = "#00000000"
theme.enter_event = "#ffffff" .. "10"
theme.press_event = "#ffffff" .. "15"
theme.release_event = "#ffffff" .. "10"

-- ========================================================== Bling
theme.fade_duration = 250

-- Tabs
-- -------------------------------
theme.mstab_bar_height = dpi(60)
theme.mstab_bar_padding = dpi(0)
theme.mstab_border_radius = dpi(6)
theme.tabbar_disable = true
theme.tabbar_style = "modern"
theme.tabbar_bg_focus = theme.background
theme.tabbar_bg_normal = x.color0
theme.tabbar_fg_focus = x.color0
theme.tabbar_fg_normal = x.color15
theme.tabbar_position = "bottom"
theme.tabbar_AA_radius = 0
theme.tabbar_size = 40
theme.mstab_bar_ontop = true

-- Swallowing
-- -------------------------------
theme.dont_swallow_classname_list = { "firefox", "gimp", "Google-chrome", "Thunar" }

-- Tag Preview
-- -------------------------------
theme.tag_preview_widget_border_radius = theme.border_radius
theme.tag_preview_client_border_radius = theme.border_radius * 0.75
theme.tag_preview_client_opacity = 0.5
theme.tag_preview_client_bg = x.color0
theme.tag_preview_client_border_color = x.color8
theme.tag_preview_client_border_width = dpi(3)
theme.tag_preview_widget_bg = theme.background
theme.tag_preview_widget_border_color = theme.widget_border_color
theme.tag_preview_widget_border_width = theme.widget_border_width
theme.tag_preview_widget_margin = dpi(10)

-- Task Preview
-- -------------------------------
theme.task_preview_widget_border_radius = theme.border_radius
theme.task_preview_widget_bg = theme.background
theme.task_preview_widget_border_color = theme.widget_border_color
theme.task_preview_widget_border_width = theme.widget_border_width
theme.task_preview_widget_margin = dpi(15)

-- Window Switcher
-- -------------------------------
theme.window_switcher_widget_bg = theme.background
theme.window_switcher_widget_border_radius = theme.widget_border_radius
theme.window_switcher_widget_border_width = theme.widget_border_width
theme.window_switcher_widget_border_color = theme.widget_border_color
theme.window_switcher_icon_valign = "left"

return theme
