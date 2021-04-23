
[[ -f ~/.profile ]] && source ~/.profile

## automatically login to WM
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec dbus-launch startx;
elif [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty2 ]]; then
    exec dbus-launch startx;
fi

