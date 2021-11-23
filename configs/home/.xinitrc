#!/bin/sh
# vim: ft=sh ts=4 sw=4:

[ -f "$HOME/.xprofile" ] && . "$HOME/.xprofile"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/profile" ] && . "${XDG_CONFIG_HOME:-$HOME/.config}/shell/profile"

USER_XRESOURCES=$XDG_CONFIG_HOME/x11/Xresources
USER_XMODMAP=$XDG_CONFIG_HOME/x11/Xmodmap
SYS_XRESOURCES=/etc/X11/xinit/.Xresources
SYS_XMODMAP=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps
[ -f $SYS_XRESOURCES ] && xrdb -merge $SYS_XRESOURCES
[ -f $SYS_XMODMAP ] && xmodmap $SYS_XMODMAP
[ -f "$USER_XRESOURCES" ] && xrdb -merge "$USER_XRESOURCES"
[ -f "$USER_XMODMAP" ] && xmodmap "$USER_XMODMAP"

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

if command -v "sv" > /dev/null 2>&1 ; then
    exec dbus-launch --sh-syntax --exit-with-session bspwm
else
    exec awesome
fi

