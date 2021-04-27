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
light -S 40
xset -b
xset r rate 300 25
xsetroot -cursor_name left_ptr

xsettingsd &
clipmenud &>/dev/null &
/lib/mate-polkit/polkit-mate-authentication-agent-1 &
mpd && mpDris2 &
# florence &

# Start pulse/pipewire
pulseaudio --start
# /usr/bin/pipewire &
# /usr/bin/pipewire-pulse &
# /usr/bin/pipewire-media-session &

# Start session
case ${1:-awesome} in
    awesome) exec dbus-launch --exit-with-session awesome;;
    fluxbox) exec dbus-launch --exit-with-session fluxbox;;
esac
