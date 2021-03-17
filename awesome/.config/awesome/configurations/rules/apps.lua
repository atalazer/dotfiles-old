local awful = require('awful')
local gears = require('gears')
local ruled = require('ruled')
local beautiful = require('beautiful')

ruled.client.connect_signal('request::rules',function()
    -- Image viewers
    ruled.client.append_rule {
        id        = 'image_viewers',
        rule_any  = {
            class    = {
                'feh',
                'Pqiv',
                'Sxiv',
                'Viewnior'
                },
        },
        properties = {
            titlebars_enabled = true,
            skip_decoration   = true,
            floating          = true,
            placement         = awful.placement.centered
        }
    }

    ruled.client.append_rule {
        id       = '',
        rule_any = {
            class = {
                'Florence', 
                'Onboard',
            },
        },
        properties = {
            placement         = awful.placement.bottom,
            focusable         = false,
            titlebars_enabled = false,
            skip_decoration   = true,
            floating          = true,
            sticky            = true,
            above             = true,
        }
    }
end)
