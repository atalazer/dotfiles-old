local awful = require('awful')
local ruled = require('ruled')
local beautiful = require('beautiful')

ruled.client.connect_signal('request::rules',function()
    -- All clients will match this rule.
    ruled.client.append_rule {
        id = 'global',
        rule = {},
        properties = {
            -- border_width = beautiful.border_width,
            border_width = 0,
            border_color = beautiful.border_normal,
            focus        = awful.client.focus.filter,
            raise        = true,
            screen       = awful.screen.preferred,
            placement    = awful.placement.no_overlap + awful.placement.no_offscreen
        }
    }

    ruled.client.append_rule {
        id = 'round_clients',
        rule_any = {
            type = {
                'normal',
                'dialog'
            }
        },
        except_any  = {
            name = {'Discord Updater'}
        },
        properties = {
            shape         = beautiful.client_shape_rounded
        }
    }

    -- Titlebar rules
    ruled.client.append_rule {
        id 		= 'titlebars',
        rule_any = {
            type = {
                'normal',
                'dialog',
                'modal',
                'utility'
            }
        },
        properties = {
            titlebars_enabled = true
        }
    }

    -- Dialogs
    ruled.client.append_rule {
        id = 'dialog',
        rule_any = {
            type  = {'dialog'},
            class = {'Wicd-client.py', 'calendar.google.com'}
        },
        properties = {
            titlebars_enabled = true,
            floating          = true,
            above             = true,
            skip_decoration   = true,
            placement         = awful.placement.centered
        }
    }

    -- Modals
    ruled.client.append_rule {
        id = 'modal',
        rule_any = {
            type = {'modal'}
        },
        properties = {
            titlebars_enabled = true,
            floating          = true,
            above             = true,
            skip_decoration   = true,
            placement         = awful.placement.centered
        }
    }

    -- Utilities
    ruled.client.append_rule {
        id = 'utility',
        rule_any = {
            type = {'utility'}
        },
        properties = {
            titlebars_enabled = false,
            floating          = true,
            skip_decoration   = true,
            placement         = awful.placement.centered
        }
    }

    -- Splash
    ruled.client.append_rule {
        id = 'splash',
        rule_any = {
            type = {'splash'},
            name = {'Discord Updater'}
        },
        properties = {
            titlebars_enabled = false,
            round_corners     = false,
            floating          = true,
            above             = true,
            skip_decoration   = true,
            placement         = awful.placement.centered
        }
    }

    -- Floating
    ruled.client.append_rule {
        id       = 'floating',
        rule_any = {
            instance    = {
                'file_progress', 'Popup', 'nm-connection-editor',
                "plugin-container", "exe",
            },
            class = {
                'Float', 'Editor', 'Files', 'Music',
                'Mugshot', 'Gcolor3', 'Pulseeffects',
                'scrcpy',
            },
            name = {
                "Event Tester",
                "Open File",
                "Media viewer",
            },
            role    = {
                "_NET_WM_STATE_FULLSCREEN",
                'AlarmWindow', 'ConfigManager', 'pop-up',
                "GtkFileChooserDialog",
            }
        },
        properties = {
            titlebars_enabled = true,
            skip_decoration = true,
            ontop = true,
            focus = awful.client.focus.filter,
            raise = true,
            floating  = true,
            placement = awful.placement.centered
        }
    }

end)

require(P.config.rules..".tags")
require(P.config.rules..".apps")

