#!/bin/sh

[ -f ${XDG_CONFIG_HOME:-$HOME/.config}/shell/profile ] && . ${XDG_CONFIG_HOME:-$HOME/.config}/shell/profile || . $HOME/.profile

## automatically login to WM
if [ -z $DISPLAY ] && [ $(tty) = /dev/tty1 ]; then
    export XDG_SESSION_TYPE=x11
    export XDG_CURRENT_DESKTOP=gnome
    export DESKTOP_SESSION=gnome
    export MOZ_USE_XINPUT2="1"
    export CHECK_AWESOME_CLIENT=true
    exec startx
elif [ -z $DISPLAY ] && [ $(tty) = /dev/tty2 ]; then
    export XDG_SESSION_TYPE=wayland
    export QT_QPA_PLATFORMTHEME=wayland
    export QT_QPA_PLATFORM=wayland
    export MOZ_ENABLE_WAYLAND=1
    export GDK_BACKEND=wayland
    exec sway
fi
