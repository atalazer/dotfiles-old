# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ $DISPLAY ]] && shopt -s checkwinsize

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion


# Config
export ROOT="/root"
export STARSHIP_CONFIG="$ROOT/starship.toml"

eval "$(starship init bash)"
eval "$(zoxide init bash)"

_source_path(){ [ -f $1 ] && source $1 }
_source_path ${ROOT:-/root}/.aliases

