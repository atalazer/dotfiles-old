return {
    widget = {
        email  = {
            -- Email address
            address = 'baraboyolali@gmail.com',
            -- App password
            app_password = 'arstjoipuedpfech',
            -- Imap server
            imap_server = 'imap.gmail.com',
            -- Port
            port = '993'
        },

        weather = {
            -- API Key
            key = '8f867e7b117a4eb09af8a54b0be530c2',
            -- City ID
            city_id = '1648084',
            -- Units
            units = 'metric',
            -- Update in N seconds
            update_interval = 3600
        },

        network = {
            -- Wired interface
            wired_interface = 'enp2s0',
            -- Wireless interface
            wireless_interface = 'wlp3s0'
        },

        clock = {
            -- Clock widget format
            military_mode = true
        },

        screen_recorder = {
            -- Default record dimension
            resolution = '1366x768',
            -- X,Y coordinate
            offset = '0,0',
            -- Enable audio by default
            audio = false,
            -- Recordings directory
            save_directory = '$(xdg-user-dir VIDEOS)/Recordings/',
            -- Mic level
            mic_level = '20',
            -- FPS
            fps = '30'
        }
    },

    module = {
        auto_start = {
            -- Will create notification if true
            debug_mode = false
        },

        dynamic_wallpaper = {
            -- Will look for wallpapers here
            wall_dir = 'themes/floppy/wallpapers/',
            -- Image formats
            valid_picture_formats = {'jpg', 'png', 'jpeg'},
            -- Leave this table empty for full auto scheduling
            wallpaper_schedule = {
                ['00:00:00'] = 'midnight-wallpaper.jpg',
                ['06:22:00'] = 'morning-wallpaper.jpg',
                ['12:00:00'] = 'noon-wallpaper.jpg',
                ['17:58:00'] = 'night-wallpaper.jpg'
                -- Example of just using auto-scheduling with keywords
                --[[
                'midnight',
                'morning',
                'noon',
                'afternoon',
                'evening',
                'night'
                --]]
            },
            -- Stretch background image across all screens(monitor)
            stretch = false
        },

        lockscreen = {
            -- Clock format
            military_clock = true,
            -- Default password if there's no PAM integration
            fallback_password = 'awesome',
            -- Capture intruder using webcam
            capture_intruder = false,
            -- Intruder image save location (Will create directory if it doesn't exist)
            face_capture_dir = '$(xdg-user-dir PICTURES)/Intruders/' or '~/pic/Intruders',
            -- Background directory - Defaults to 'awesome/config/theme/wallpapers/' if null
            bg_dir = '~/.wallpaper/',
            -- Will look for this image file under 'bg_dir'
            bg_image = 'sao-kiritod.jpg',
            -- Blur lockscreen background
            blur_background = true,
            -- Blurred/filtered background image path (No reason to change this)
            tmp_wall_dir = '/tmp/awesomewm/' .. os.getenv('USER') .. '/'
        }
    }
}
