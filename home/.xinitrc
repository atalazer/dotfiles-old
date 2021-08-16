#!/bin/sh

[[ -f ~/.xprofile ]] && source ~/.xprofile

# Lunch dbus-launch, this is important for some app
if which dbus-launch >/dev/null && test -z "$DBUS_SESSION_BUS_ADDRESS"; then
    eval $(dbus-launch --sh-syntax --exit-with-session)
fi

exec dbus-launch --sh-syntax --exit-with-session awesome

