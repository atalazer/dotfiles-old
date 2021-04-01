local awful = require('awful')
local ruled = require('ruled')
local beautiful = require('beautiful')
local dpi = beautiful.xresources.apply_dpi

local app = require(P.config.apps).default.terminal_lyrics

local lyrics_id = nil
local lyrics_client = nil
local lyrics_opened = false

local lyrics_properties = function()
    return {
        hidden = not lyrics_opened,
        above = true,
        floating = true,
        ontop = true,
        sticky = true,
        focusable = false,

        skip_taskbar = true,
        skip_center = true,
        skip_decoration = true,
        round_corners = false,
        titlebars_enabled = false,
        switch_to_tags = false,

        placement = awful.placement.right,
        shape = beautiful.client_shape_rectangle,

        -- opacity = 0.5,
        border_width = 0,
        maximized_horizontal = false,
        maximized_vertical = false,
    }
end

ruled.client.connect_signal(
'request::rules',
function()
    ruled.client.append_rule {
        id         = 'lyrics-quake',
        rule_any   = { 
            instance = { 
                'lyricsQuake'
            },
            class = { 
                'lyricsQuake'
            }
        },
        properties = lyrics_properties()
    }
end
)

local create_lyricsQuake = function()
    -- Check if there's already an instance of 'QuakeTerminal'.
    -- If yes, recover it - use it again.
    local lyricsQuake_term = function (c)
        return ruled.client.match(c, {instance = 'lyricsQuake'})
    end
    for c in awful.client.iterate(lyricsQuake_term) do
        -- 'QuakeTerminal' instance detected
        -- Re-apply its properties
        ruled.client.execute(c, lyrics_properties())
        lyrics_id = c.pid
        c:emit_signal('request::activate')
        return
    end
    -- No 'QuakeTerminal' instance, spawn one
    lyricsQuake_id = awful.spawn(app, lyrics_properties())
end

local lyrics_open = function()
    lyrics_client.hidden = false
    lyrics_client:emit_signal('request::activate')
end

local lyrics_close = function()
    lyrics_client.hidden = true
end

local lyrics_toggle = function()
    lyrics_opened = not lyrics_opened
    if not lyrics_client then
        create_lyricsQuake()
    else
        if lyrics_opened then
            lyrics_open()
        else
            lyrics_close()
        end
    end
end

awesome.connect_signal(
'module::lyricsQuake:toggle',
function()
    lyrics_toggle();
end
)

client.connect_signal(
'manage',
function(c)
    if c.pid == lyrics_id then
        lyrics_client = c
    end
end
)

client.connect_signal(
'unmanage',
function(c)
    if c.pid == lyrics_id then
        lyrics_opened = false
        lyrics_client = nil
    end
end
)
