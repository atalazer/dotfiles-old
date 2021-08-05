#!/bin/sh

[[ -f ~/.profile ]] && source ~/.profile

xset -b     # Disable terminal bell
xset r rate 300 50      # Set repeat rate
xsetroot -cursor_name left_ptr      # Set cursor

wal -n -R       # Restore wal
light -S 20     # Set Brightness

/lib/mate-polkit/polkit-mate-authentication-agent-1 &> /dev/null &
clipmenud &>/dev/null &
mpd &> /dev/null &
espanso daemon &
fcitx5 --replace -d &

# non-systemD
export $(systemctl --user show-environment | grep DBUS_SESSION_BUS_ADDRESS)
exec dbus-launch --sh-syntax --exit-with-session awesome

# systemD
# exec awesome
