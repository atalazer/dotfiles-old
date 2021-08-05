local awful = require("awful")
local gears = require("gears")

local keys = {}

local revelation = require("revelation")

-- Mod keys
superkey = "Mod4"
altkey = "Mod1"
ctrlkey = "Control"
shiftkey = "Shift"

require("configs.keys.hotkeys_popup")

keys.global = require("configs.keys.global")
keys.apps = require("configs.keys.apps")
keys.controller = require("configs.keys.controller")
keys.layout = require("configs.keys.layout")
keys.tags = require("configs.keys.tags")

keys.button = require("configs.keys.button")
keys.client = require("configs.keys.client")
keys.desktopbuttons = require("configs.keys.desktop")

keys.globalkeys = gears.table.join(
    awful.key({ superkey }, ".", 
        revelation, 
    { description = "Revelation", group = "Tag: Move"}),
    keys.global,
    keys.apps,
    keys.controller,
    keys.layout,
    keys.tags,
    keys.client.globals
)

keys.clientkeys = keys.client.clientkeys
keys.clientbuttons = keys.button.client
keys.tasklist_buttons = keys.button.tasklist
keys.taglist_buttons = keys.button.taglist
keys.titlebar_buttons = keys.button.titlebar

-- Set root (desktop) keys
root.keys(keys.globalkeys)
root.buttons(keys.desktopbuttons)

return keys
