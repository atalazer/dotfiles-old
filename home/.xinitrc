#!/bin/sh

[ -f $HOME/.xprofile ] && . $HOME/.xprofile

USER_XRESOURCES=$HOME/.Xresources
USER_XMODMAP=$HOME/.Xmodmap
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

exec awesome

