local theme_name = "atalazer"
local gears = require("gears")
local beautiful = require("beautiful")

local filesystem = gears.filesystem
local theme_assets = beautiful.theme_assets
-- local xresources = beautiful.xresources
-- local gtk_variable = beautiful.gtk.get_theme_variables

local theme_dir = filesystem.get_configuration_dir() .. "/themes/"
local layout_icon_path = theme_dir .. theme_name .. "/layout/"
local titlebar_icon_path = theme_dir .. theme_name .. "/titlebar/"
local taglist_icon_path = theme_dir .. theme_name .. "/taglist/"
local tip = titlebar_icon_path --alias to save time/space

local theme = {}

theme = {
    background = x.background,
    foreground = x.foreground,
    black = x.color0,
    red = x.color1,
    green = x.color2,
    yellow = x.color3,
    blue = x.color4,
    magenta = x.color5,
    cyan = x.color6,
    white = x.color7,
    light_black = x.color8,
    light_red = x.color9,
    light_green = x.color10,
    light_yellow = x.color11,
    light_blue = x.color12,
    light_magenta = x.color13,
    light_cyan = x.color14,
    light_white = x.color15,
}

theme.icon_theme = user.icon or "Adwaita"
-- theme.wallpaper = os.getenv("HOME") .. "/.config/awesome/themes/" .. theme_name .. "/wallpaper.jpg"

theme.font = "monospace 11"

-- Transparent
theme.transparent = "#00000000"

theme.bg_normal = theme.background
theme.bg_dark = x.background
theme.bg_focus = x.color8
theme.bg_urgent = x.color8
theme.bg_minimize = x.color8

theme.fg_normal = theme.foreground
theme.fg_focus = x.color4
theme.fg_urgent = x.color9
theme.fg_minimize = x.color8

-- Gaps
theme.useless_gap = dpi(3)
theme.screen_margin = dpi(2)

-- Borders
theme.border_width = dpi(1)
theme.border_color = x.color0
theme.border_normal = x.background
theme.border_focus = x.background

-- Rounded corners
theme.border_radius = dpi(8)

-- Systray
theme.bg_systray = x.background
theme.systray_icon_spacing = dpi(10)

-- Titlebars
theme.titlebars_enabled = true
theme.titlebar_size = dpi(28)
theme.titlebar_title_enabled = true
theme.titlebar_font = "sans bold 9"
theme.titlebar_title_align = "center"
theme.titlebar_position = "top"
theme.titlebar_bg_focus = x.color0
theme.titlebar_bg_normal = x.background
theme.titlebar_fg_focus = x.foreground
theme.titlebar_fg_normal = x.color8

-- Menu
theme.menu_height = dpi(35)
theme.menu_width = dpi(180)
theme.menu_bg_normal = x.color0
theme.menu_fg_normal = x.color7
theme.menu_bg_focus = x.color8 .. "55"
theme.menu_fg_focus = x.color7
theme.menu_border_width = dpi(0)
theme.menu_border_color = x.color0

-- Tooltips
theme.tooltip_bg = x.background
theme.tooltip_fg = x.foreground
theme.tooltip_border_color = theme.transparent
theme.tooltip_border_width = 0
theme.tooltip_gaps = dpi(5)
theme.tooltip_shape = function(cr, w, h)
    gears.shape.rounded_rect(cr, w, h, dpi(8))
end

-- Notifications
theme.notification_position = "top_right"
theme.notification_border_width = dpi(0)
theme.notification_border_radius = theme.border_radius
theme.notification_border_color = x.color0
theme.notification_bg = x.background .. "00"
theme.notification_fg = x.foreground
theme.notification_icon_size = dpi(60)
-- theme.notification_height = dpi(80)
-- theme.notification_width = dpi(300)
-- theme.notification_max_height = dpi(120)
-- theme.notification_max_width = dpi(480)
theme.notification_font = "monospace 11"
theme.notification_opacity = 0.90
theme.notification_margin = dpi(20)
theme.notification_padding = theme.screen_margin * 2
theme.notification_spacing = theme.screen_margin * 4

-- Hotkeys popup
theme.hotkeys_font = "monospace 9"
theme.hotkeys_description_font = "monospace 8"
theme.hotkeys_bg = x.background
theme.hotkeys_fg = x.foreground
theme.hotkeys_label_bg = x.color0
theme.hotkeys_border_color = x.color8
theme.hotkeys_label_fg = x.color0
theme.hotkeys_modifiers_fg = x.color4
theme.hotkeys_border_width = dpi(1)
theme.hotkeys_group_margin = dpi(8)
theme.hotkeys_shape = function(cr, w, h)
    gears.shape.rounded_rect(cr, w, h, dpi(12))
end

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height, theme.bg_focus, theme.fg_focus)

-- Edge snap
theme.snap_shape = gears.shape.rectangle
theme.snap_bg = x.foreground
theme.snap_border_width = dpi(2)

-- ===================================================
-- Others
-- ===================================================

-- Widget separator
theme.separator_text = "|"
theme.separator_fg = x.color8

-- Wibar(s)
-- Keep in mind that these settings could be ignored by the bar theme
theme.wibar_position = "right"
theme.wibar_fg = x.background
theme.wibar_bg = x.foreground
--theme.wibar_opacity = 0.7
theme.wibar_border_color = x.color0
theme.wibar_border_width = dpi(0)
theme.wibar_border_radius = dpi(0)
theme.wibar_width = dpi(380)
theme.wibar_height = dpi(32)

theme.prefix_fg = x.color8

--Tasklist
theme.tasklist_disable_icon = false
theme.tasklist_plain_task_name = false
theme.tasklist_font = "sans medium 8"
theme.tasklist_font_minimized = "sans italic 8"
theme.tasklist_bg_focus = x.color0
theme.tasklist_fg_focus = x.foreground
theme.tasklist_bg_normal = "#00000000"
theme.tasklist_fg_normal = x.foreground .. "77"
theme.tasklist_bg_minimize = "#00000000"
theme.tasklist_fg_minimize = x.color8
theme.tasklist_bg_urgent = x.background
theme.tasklist_fg_urgent = x.color3
theme.tasklist_align = "center"
theme.tasklist_spacing = dpi(0)

-- Dashboard
theme.dashboard_bg = x.color0 .. "CC"
theme.dashboard_fg = x.color7

-- Sidebar
theme.sidebar_bg = x.background
theme.sidebar_fg = x.color7
theme.sidebar_opacity = 0.98
theme.sidebar_position = "left" -- left or right
theme.sidebar_width = dpi(300)
theme.sidebar_border_radius = dpi(30)

-- Notif Center
theme.notif_center_bg = x.background
theme.notif_center_fg = x.color7
theme.notif_center_opacity = 0.98
theme.notif_center_width = dpi(360)
theme.notif_center_border_radius = dpi(30)

-- Sidebar and Notif Center activator
theme.activator_bg = x.color8
theme.activator_width = dpi(2)
theme.activator_height = 0.3        -- Percentage
theme.activator_opacity = 0.4
theme.activator_timeout = 0.5

theme.notifbox_bg = x.color0

if theme.sidebar_position == "left" then
    theme.notif_center_position = "right"
else
    theme.notif_center_position = "left"
end

-- Exit screen
theme.exit_screen_bg = x.color0 .. "CC"
theme.exit_screen_fg = x.color7
theme.exit_screen_font = "sans 20"
theme.exit_screen_icon_size = dpi(180)

-- Lock screen
theme.lock_screen_bg = x.color0 .. "CC"
theme.lock_screen_fg = x.color7

-- Icon taglist
local ntags = 10
theme.taglist_icons_empty = {}
theme.taglist_icons_occupied = {}
theme.taglist_icons_focused = {}
theme.taglist_icons_urgent = {}

for i = 1, ntags do
    theme.taglist_icons_empty[i] = taglist_icon_path .. tostring(i) .. "_empty.png"
    theme.taglist_icons_occupied[i] = taglist_icon_path .. tostring(i) .. "_occupied.png"
    theme.taglist_icons_focused[i] = taglist_icon_path .. tostring(i) .. "_focused.png"
    theme.taglist_icons_urgent[i] = taglist_icon_path .. tostring(i) .. "_urgent.png"
end

-- Noodle Text Taglist
theme.taglist_text_font = "monospace 25"
theme.taglist_text_empty = { "", "", "", "", "", "", "", "", "", "" }
theme.taglist_text_occupied = { "", "", "", "", "", "", "", "", "", "" }
theme.taglist_text_focused = { "", "", "", "", "", "", "", "", "", "" }
theme.taglist_text_urgent = { "+", "+", "+", "+", "+", "+", "+", "+", "+", "+" }

theme.taglist_text_color_empty = {
    x.background .. "22",
    x.background .. "22",
    x.background .. "22",
    x.background .. "22",
    x.background .. "22",
    x.background .. "22",
    x.background .. "22",
    x.background .. "22",
    x.background .. "22",
    x.background .. "22",
}

theme.taglist_text_color_occupied = {
    x.color1 .. "99",
    x.color2 .. "99",
    x.color3 .. "99",
    x.color4 .. "99",
    x.color5 .. "99",
    x.color6 .. "99",
    x.color1 .. "99",
    x.color2 .. "99",
    x.color3 .. "99",
    x.color4 .. "99",
}
theme.taglist_text_color_focused = {
    x.color9,
    x.color10,
    x.color11,
    x.color12,
    x.color13,
    x.color14,
    x.color9,
    x.color10,
    x.color11,
    x.color12,
}
theme.taglist_text_color_urgent = {
    x.background,
    x.background,
    x.background,
    x.background,
    x.background,
    x.background,
    x.background,
    x.background,
    x.background,
    x.background,
}

-- Prompt
theme.prompt_fg = x.color12

-- Text Taglist (default)
theme.taglist_font = "monospace bold 9"
theme.taglist_bg_focus = x.background
theme.taglist_fg_focus = x.color12
theme.taglist_bg_occupied = x.background
theme.taglist_fg_occupied = x.color8
theme.taglist_bg_empty = x.background
theme.taglist_fg_empty = x.background
theme.taglist_bg_urgent = x.background
theme.taglist_fg_urgent = x.color3
theme.taglist_disable_icon = true
theme.taglist_spacing = dpi(0)

-- Generate taglist squares:
local taglist_square_size = dpi(0)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.fg_focus)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, theme.fg_normal)

-- Titlebar buttons
-- Define the images to load
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

-- You can use your own layout icons like this:
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

-- Noodle widgets customization --
-- Desktop mode widget variables
-- Symbols     
theme.desktop_mode_color_floating = x.color4
theme.desktop_mode_color_tile = x.color3
theme.desktop_mode_color_max = x.color1
theme.desktop_mode_text_floating = "f"
theme.desktop_mode_text_tile = "t"
theme.desktop_mode_text_max = "m"

-- Minimal tasklist widget variables
theme.minimal_tasklist_visible_clients_color = x.color4
theme.minimal_tasklist_visible_clients_text = ""
theme.minimal_tasklist_hidden_clients_color = x.color7
theme.minimal_tasklist_hidden_clients_text = ""

-- Mpd song
theme.mpd_song_title_color = x.color7
theme.mpd_song_artist_color = x.color7
theme.mpd_song_paused_color = x.color8

-- Volume bar
theme.volume_bar_active_color = x.color5
theme.volume_bar_active_background_color = x.color0
theme.volume_bar_muted_color = x.color8
theme.volume_bar_muted_background_color = x.color0

-- Temperature bar
theme.temperature_bar_active_color = x.color1
theme.temperature_bar_background_color = x.color0

-- Battery bar
theme.battery_bar_active_color = x.color6
theme.battery_bar_background_color = x.color0

-- CPU bar
theme.cpu_bar_active_color = x.color2
theme.cpu_bar_background_color = x.color0

-- RAM bar
theme.ram_bar_active_color = x.color4
theme.ram_bar_background_color = x.color0

-- Brightness bar
theme.brightness_bar_active_color = x.color3
theme.brightness_bar_background_color = x.color0

-- UI Groups
theme.groups_title_bg = "#ffffff" .. "15"
theme.groups_bg = "#ffffff" .. "10"
theme.groups_radius = dpi(16)

-- UI events
theme.leave_event = "#00000000"
theme.enter_event = "#ffffff" .. "10"
theme.press_event = "#ffffff" .. "15"
theme.release_event = "#ffffff" .. "10"

-- Bars
theme.bar_height = dpi(28)
theme.bar_bg = theme.bg_normal
theme.bar_fg = theme.fg_normal

theme.bar_widget_margin = dpi(7)
theme.bar_widget_fg = theme.fg_normal

return theme
