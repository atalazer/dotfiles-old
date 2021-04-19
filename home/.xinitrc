#!/bin/sh
# Load .xprofile
[ -f ~/.profile ] && . ~/.profile

export QT_QPA_PLATFORMTHEME=qt5ct
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true"
export _JAVA_AWT_WM_NONREPARENTING=1
export MOZ_USE_XINPUT2=1
export CM_LAUNCHER=fzf

wal -n -R
light -S 40
xset -b
xset r rate 300 25
xsetroot -cursor_name left_ptr

# Xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

xsettingsd &
clipmenud &>/dev/null &

# Start pulse/pipewire
pulseaudio --start
# /usr/bin/pipewire &
# /usr/bin/pipewire-pulse &
# /usr/bin/pipewire-media-session &

# Start session
exec dbus-launch --exit-with-session awesome
