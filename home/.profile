#!/usr/bin/env bash

[ -f $HOME/.user ] && source $HOME/.user

export TERMINFO=$HOME/.terminfo

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --ignore-file ".gitignore"'
export SKIM_DEFAULT_COMMAND='rg --files --no-ignore --ignore-file ".gitignore"'

TO_PATH(){
    if [[ -z $(printf $PATH | grep $1) ]]; then
        export PATH="$1:$PATH"
    fi
}

TO_PATH ${APP_DIR:-$HOME/Applications}
TO_PATH ${BIN_DIR:-$HOME/.local/bin}
TO_PATH $HOME/.local/script

