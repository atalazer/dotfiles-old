#!/bin/sh

# Start session
SESSION=${1:-awesome}
case $SESSION in
    awesome)    exec awesome ;;
    sway)       exec sway ;;
    *)          exec $1;;
esac
