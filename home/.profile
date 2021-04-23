#!/bin/sh

[ -f $HOME/.user ] && source $HOME/.user

export TERMINFO=$HOME/.terminfo

export CC="gcc"
export CM_LAUNCHER="rofi"
export CM_SELECTIONS="clipboard"
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --ignore-file ".gitignore"'
export SKIM_DEFAULT_COMMAND='rg --files --no-ignore --ignore-file ".gitignore"'

Export(){
    if [[ -z $(printf $PATH | grep $1) ]]; then
        export PATH="$1:$PATH"
    fi
}
Export $HOME/.local/bin
Export $HOME/.local/bin/appimage
Export $HOME/.local/bin/link
Export $HOME/.local/bin/script

# Rust Cargo
Source "$HOME/.cargo/env"

