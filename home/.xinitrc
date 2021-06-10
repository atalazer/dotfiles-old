#!/bin/sh
# Load .xprofile
[ -f ~/.profile ] && . ~/.profile

export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export MOZ_USE_XINPUT2=1
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true"
export _JAVA_AWT_WM_NONREPARENTING=1

export CM_LAUNCHER="rofi"

# Xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
wal -n -R
light -S 20
xset -b
xset r rate 300 50
xsetroot -cursor_name left_ptr

xsettingsd &> /dev/null &
clipmenud &>/dev/null &
/lib/mate-polkit/polkit-mate-authentication-agent-1 &> /dev/null &
mpd &> /dev/null &
# florence &

# Start session
SESSION=${1:-awesome}
case $SESSION in
    awesome)    exec awesome ;;
    sway)       exec sway ;;
    *)          exec $1;;
esac
