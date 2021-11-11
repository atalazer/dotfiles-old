#!/usr/bin/env bash

TMUX_DIR=${XDG_CONFIG_HOME:-$HOME/.config}/tmux
LANG_LIST="$TMUX_DIR/.cht.sh-languages"
COMMAND_LIST="$TMUX_DIR/.cht.sh-command"

tmux(){
    selected=$(cat "$COMMAND_LIST" "$LANG_LIST" | fzf)
    [ -z "$selected" ] && exit 0

    read -p "Enter $selected Query: " -r query
    if grep -qs "$selected" "$LANG_LIST"; then
        query=$(echo "$query" | tr " " "+")
        tmux neww bash -c "echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
    else
        tmux neww bash -c "curl -s cht.sh/$selected~$query | less"
    fi
}

while [ -n "$1" ]; do
    case "$1" in
        "--lang-list") shift; LANG_LIST=$1 ;;
        "--command-list") shift; COMMAND_LIST=$1 ;;
        "-t"|"--tmux") tmux ;;
        *) echo "Invalid $1" && exit 1 ;;
    esac
    shift
done
