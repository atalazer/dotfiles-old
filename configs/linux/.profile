#!/bin/sh
# vim: ft=sh ts=4 sw=4:

# =========================================== Locale
CHARSET=UTF-8; LANG=en_US.UTF-8
export MM_CHARSET=$CHARSET; export LANG=$LANG; export LC_ALL=$LANG
export LOCALE_ARCHIVE=/usr/lib/locale/locale-archive

# ========================================== Directory
# ------- XDG
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"

[ -f "$XDG_CONFIG_HOME/shell/user" ] && . "$XDG_CONFIG_HOME/shell/user"
[ -f "$HOME/.user" ] && . "$HOME/.user"
[ -f "$XDG_CONFIG_HOME/shell/user.private" ] && . "$XDG_CONFIG_HOME/shell/user.private"
[ -f "$HOME/.user.private" ] && . "$HOME/.user.private"
[ -f "$XDG_CONFIG_HOME/user-dirs.dirs" ] && . "$XDG_CONFIG_HOME/user-dirs.dirs"

# ------- Clean-up ~/
export ANDROID_SDK_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/android"
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export GOBIN="$GOPATH/bin"
export GNUPGHOME="${XDG_DATA_HOME:-$HOME/.local/share}/gnupg"
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/history"
export ICEAUTHORITY="${XDG_CACHE_HOME}/ICEauthority"
export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/shell/inputrc"
export LESSHISTFILE="${XDG_CONFIG_HOME:-$HOME/.config}/less/history"
export LESSKEY="${XDG_CONFIG_HOME:-$HOME/.config}/less/keys"
export NOTMUCH_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/notmuch-config"
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/password-store"
export TERMINFO="${XDG_DATA_HOME:-$HOME/.local/share}/terminfo"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export WWW_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/w3m"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"

# ========================================== Apss
# -------- CLI
export EDITOR="nvim"
export VISUAL=$EDITOR
export SUDO_EDITOR=$EDITOR
export PAGER="less -R"
export LESS="-R"
export BAT_PAGER="$PAGER"
export DELTA_PAGER="$PAGER"
# export MANPAGER="sh -c 'col -bx | bat -l man -p'"

## ------ Command
export BROWSER="brave"
export FILEMAN="thunar"
export TERM_CMD="kitty"
export TRASH_CMD="gio"

# ------- Command
export PERMISSION="sudo"
export SHUTDOWN_CMD="poweroff"
export REBOOT_CMD="reboot"
export SUSPEND_CMD="systemctl suspend"
export LOCK_CMD="lock"

# ------- clipmenu
export CM_DIR=/tmp/clipmenu
export CM_HISTLENGTH=20
export CM_LAUNCHER="rofi"
export CM_SELECTIONS="clipboard"

# ------ fcitx
export GLFW_IM_MODULE="ibus"
export GTK_IM_MODULE="fcitx"
export QT_IM_MODULE="fcitx"
export XMODIFIERS="@im=fcitx"
export SDL_IM_MODULE="fcitx"
export IBUS_USE_PORTAL=1

# =============================== Themes
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"
export GTK3_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-3.0/settings.ini"

export QT_QPA_PLATFORMTHEME=qt5ct
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_SCALE_FACTOR=1
export QT_SCREEN_SCALE_FACTORS=1
# export QT_FONT_DPI=96

# ================================ Code
# ----- Java
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true"
export _JAVA_AWT_WM_NONREPARENTING=1

# ----- Golang
export CC="gcc"

# ================================ PATH {{{
TO_PATH() {
    if [ -d "$1" ]; then
        if ! printf "%s" "$PATH" | grep -q "$1"; then
            export PATH="$PATH:$1"
        fi
    fi
}

TO_PATH "$HOME/Applications/bin"
TO_PATH "$HOME/.local/bin"
TO_PATH "$HOME/.local/script"
TO_PATH "$HOME/.emacs.d/bin"
TO_PATH "$HOME/.local/share/choosenim/toolchains/nim-1.4.8/bin"
TO_PATH "$HOME/.local/share/nimble/bin"
TO_PATH "$CARGO_HOME/bin"
TO_PATH "$GOBIN"
TO_PATH "$HOME/.local/share/fnm/node-versions/v14.16.1/installation/bin"
TO_PATH "$HOME/.yarn/bin"

# }}}

# ============================= Others
[ -f "$HOME/.nix-profile/etc/profile.d/nix.sh" ] && . "$HOME/.nix-profile/etc/profile.d/nix.sh"
