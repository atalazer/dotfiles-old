#!/bin/sh

[ -f $HOME/.user ] && source $HOME/.user

export TERMINFO=$HOME/.terminfo

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --ignore-file ".gitignore"'
export SKIM_DEFAULT_COMMAND='rg --files --no-ignore --ignore-file ".gitignore"'

export_path(){
    if [[ -z $(printf $PATH | grep $1) ]]; then
        export PATH="$1:$PATH"
    fi
}
export_path $HOME/.local/bin
export_path $HOME/.local/bin/appimage
export_path $HOME/.local/bin/link
export_path $HOME/.local/bin/script

