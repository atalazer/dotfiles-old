#!/usr/bin/env bash

pgrep -x polybar > /dev/null && pkill polybar

echo "---" | tee -a /tmp/polybar1.log

polybar bspwm-bar -r >>/tmp/polybar1.log 2>&1 & disown

echo "Bars launched..."
