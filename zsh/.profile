#!/bin/sh
export TERMINAL="alacritty"
export DOTS="/home/atalariq/.dotfiles"
export TERMINFO=~/.terminfo

export QT_QPA_PLATFORMTHEME=qt5ct
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true"
export _JAVA_AWT_WM_NONREPARENTING=1

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --ignore-file ".gitignore"'
export SKIM_DEFAULT_COMMAND='rg --files --no-ignore --ignore-file ".gitignore"'

export_path(){
    if [[ -z $(printf $PATH | grep $1) ]]; then
        export PATH="$1:$PATH"
    fi
}
export_path ${HOME}/.local/bin
export_path ${HOME}/.local/bin/appimage
export_path ${HOME}/.local/bin/link

# Node.js 
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Rust Cargo
source "$HOME/.cargo/env"

