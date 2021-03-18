local awful = require("awful")
local beautiful = require("beautiful")
require(P.config.menu)

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })
