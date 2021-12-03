#!/bin/bash
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ $DISPLAY ]] && shopt -s checkwinsize

# Config
export STARSHIP_CONFIG="$HOME/.config/starship.toml"

command -v starship >/dev/null 2>&1 && eval "$(starship init bash)"
command -v zoxide >/dev/null 2>&1 && "$(zoxide init bash)"

source-file(){
    [ -f "$1" ] && source "$1"
}

# ===== User ===== {{{
# User alias definition
ALIASES=${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliases
source-file "$ALIASES"

# User config
CONFIGS=${XDG_CONFIG_HOME:-$HOME/.config}/shell/configs
if [ -d "$CONFIGS" ]; then
    for f in "$CONFIGS"/?*; do
        source "$f"
    done
    unset f
fi
