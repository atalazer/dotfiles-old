local awful     = require('awful')
local beautiful = require('beautiful')
local wibox     = require('wibox')
local gears     = require('gears')
local dpi       = require("beautiful.xresources").apply_dpi

require('widgets.default')

local TopPanel = function(s)
    local panel =
    wibox(
    {
        ontop = true,
        screen = s,
        height = dpi(20) ,
        width = s.geometry.width,
        x = s.geometry.x,
        y = s.geometry.y,
        stretch = false,
        bg = beautiful.background,
        fg = beautiful.fg_normal,
        struts = {
            top = dpi(20)
        }
    }
    )
    panel:struts(
    {
        top = dpi(20)
    }
    )
    panel:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
        layout = wibox.layout.fixed.horizontal,
        mylauncher,
        s.mytaglist,
        s.mypromptbox,
    },
    s.mytasklist, -- Middle widget
    { -- Right widgets
    layout = wibox.layout.fixed.horizontal,
    mykeyboardlayout,
    wibox.widget.systray(),
    mytextclock,
    s.mylayoutbox,
},
  }
  return panel
end

return TopPanel

