#!/bin/sh
# vim: ft=sh ts=4 sw=4:

[ -f "$HOME/.xprofile" ] && . "$HOME/.xprofile"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/profile" ] && . "${XDG_CONFIG_HOME:-$HOME/.config}/shell/profile"

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

if command -v "sv" > /dev/null 2>&1 ; then
    # exec dbus-run-session bspwm
    exec dbus-run-session openbox-session
else
    exec awesome
fi
