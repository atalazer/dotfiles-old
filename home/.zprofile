
[[ -f ~/.profile ]] && source ~/.profile

## automatically login to WM
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec dbus-launch startx;
fi

