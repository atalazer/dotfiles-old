#!/bin/sh
# Load .xprofile
[ -f ~/.profile ] && . ~/.profile

# Xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
xsettingsd &
wal -n -R
light -S 30

xset -b
xset r rate 300 25
xsetroot -cursor_name left_ptr

# Start pulse/pipewire
pulseaudio --start
# /usr/bin/pipewire &
# /usr/bin/pipewire-pulse &
# /usr/bin/pipewire-media-session &

# Start session
exec dbus-launch --auto-syntax awesome
