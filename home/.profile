#!/bin/sh

[ -f $HOME/.user ] && source $HOME/.user

export TERMINFO=$HOME/.terminfo

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --ignore-file ".gitignore"'
export SKIM_DEFAULT_COMMAND='rg --files --no-ignore --ignore-file ".gitignore"'

Export(){
    if [[ -z $(printf $PATH | grep $1) ]]; then
        export PATH="$1:$PATH"
    fi
}
Export ${APP_DIR:-$HOME/Applications}
Export ${BIN_DIR:-$HOME/.local/bin}
Export ${BIN_DIR:-$HOME/.local/bin/awesomewm}

