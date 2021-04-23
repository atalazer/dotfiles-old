# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ $DISPLAY ]] && shopt -s checkwinsize

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

# Config
export STARSHIP_CONFIG="$HOME/.config/starship.toml"

eval "$(starship init bash)"
eval "$(zoxide init bash)"

function Source(){
    [ -f $1 ] && source $1 
}

Source ${HOME}/.aliases
