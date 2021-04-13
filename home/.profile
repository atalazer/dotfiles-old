#!/bin/sh

[ -f $HOME/.user ] && source $HOME/.user

export TERMINFO=$HOME/.terminfo

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --ignore-file ".gitignore"'
export SKIM_DEFAULT_COMMAND='rg --files --no-ignore --ignore-file ".gitignore"'

export CM_LAUNCHER=fzf
clipmenud &>/dev/null &

_export_path(){
    if [[ -z $(printf $PATH | grep $1) ]]; then
        export PATH="$1:$PATH"
    fi
}
_export_path $HOME/.local/bin
_export_path $HOME/.local/bin/appimage
_export_path $HOME/.local/bin/link
_export_path $HOME/.local/bin/script

