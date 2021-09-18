#!/bin/sh

[[ -f $HOME/.user ]] && source $HOME/.user

# fcitx
export GLFW_IM_MODULE="ibus"
export GTK_IM_MODULE="fcitx"
export QT_IM_MODULE="fcitx"
export XMODIFIERS="@im=fcitx"
export SDL_IM_MODULE="fcitx"
export IBUS_USE_PORTAL=1

# Themes
export XDG_CURRENT_DESKTOP=gnome
# export DESKTOP_SESSION=gnome

# export GTK_OVERLAY_SCROLLING=1
# export SDL_VIDEO_MINIMIZE_ON_FOCUS_LOSS=0
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

# QT
export QT_QPA_PLATFORMTHEME=qt5ct
# export QT_AUTO_SCREEN_SCALE_FACTOR=1
# export QT_SCREEN_SCALE_FACTORS=1
# export QT_SCALE_FACTOR=1
# export QT_FONT_DPI=90

# Java
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true"
export _JAVA_AWT_WM_NONREPARENTING=1

# clipmenu
export CM_LAUNCHER="rofi"
export CM_SELECTIONS="clipboard"

export FZF_DEFAULT_COMMAND="rg --files --no-ignore --ignore-file '.gitignore'"
export SKIM_DEFAULT_COMMAND="rg --files --no-ignore --ignore-file '.gitignore'"

export CC="gcc"
export GOPATH="$HOME/.local/go"
export GOBIN="$HOME/.local/go/bin"

export TERMINFO=$HOME/.terminfo
# export LESSHISTFILE="${XDG_CONFIG_HOME}less/history"
# export LESSKEY="${XDG_CONFIG_HOME}less/keys"
# export ICEAUTHORITY="${XDG_CACHE_HOME}ICEauthority"

### $PATH {{{
TO_PATH() {
    if [[ -d $1 ]]; then
        if [[ -z $(printf $PATH | grep $1) ]]; then
            export PATH="$1:$PATH"
        fi
    fi
}

TO_PATH ${APP_DIR:-$HOME/Applications}/bin
TO_PATH ${BIN_DIR:-$HOME/.local/bin}
TO_PATH $HOME/.local/script
TO_PATH $HOME/.local/go/bin
TO_PATH $HOME/.emacs.d/bin
TO_PATH $HOME/.choosenim/toolchains/nim-1.4.8/bin
TO_PATH $HOME/.nimble/bin

# }}}

# include Mycroft commands
[[ -f $HOME/.profile_mycroft ]] && source $HOME/.profile_mycroft

# added by Nix installer
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then 
    source $HOME/.nix-profile/etc/profile.d/nix.sh
fi
