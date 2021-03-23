#!/bin/sh
# Load .xprofile
[ -f ~/.profile ] && . ~/.profile

xset -b 
xset r rate 300 25
xsetroot -cursor_name left_ptr

# Xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
xsettingsd &
wal -n -R

session=${1:-awesome}
case $session in
    awesome|aw         ) exec dbus-launch --auto-syntax --exit-with-session awesome ;;
    openbox|ob         ) exec dbus-launch --auto-syntax --exit-with-session openbox-session;;
    # No known session, try to run it as command
    * ) exec dbus-launch --auto-syntax --exit-with-session $1;;
esac

