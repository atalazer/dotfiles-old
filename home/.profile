#!/bin/sh

[[ -f $HOME/.user ]] && source $HOME/.user

# Source config
source $HOME/.config/nnn/nnn.conf

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

export LF_ICONS="\
tw= :\
st= :\
ow= :\
dt= :\
di= :\
fi= :\
ln= :\
or= :\
ex= :\
*.c= :\
*.cc= :\
*.clj= :\
*.coffee= :\
*.cpp= :\
*.css= :\
*.d= :\
*.dart= :\
*.erl= :\
*.exs= :\
*.fs= :\
*.go= :\
*.h= :\
*.hh= :\
*.hpp= :\
*.hs= :\
*.html= :\
*.java= :\
*.jl= :\
*.js= :\
*.json= :\
*.lua= :\
*.md= :\
*.php= :\
*.pl= :\
*.pro= :\
*.py= :\
*.rb= :\
*.rs= :\
*.scala= :\
*.ts= :\
*.vim= :\
*.cmd= :\
*.ps1= :\
*.sh= :\
*.bash= :\
*.zsh= :\
*.fish= :\
*.tar= :\
*.tgz= :\
*.arc= :\
*.arj= :\
*.taz= :\
*.lha= :\
*.lz4= :\
*.lzh= :\
*.lzma= :\
*.tlz= :\
*.txz= :\
*.tzo= :\
*.t7z= :\
*.zip= :\
*.z= :\
*.dz= :\
*.gz= :\
*.lrz= :\
*.lz= :\
*.lzo= :\
*.xz= :\
*.zst= :\
*.tzst= :\
*.bz2= :\
*.bz= :\
*.tbz= :\
*.tbz2= :\
*.tz= :\
*.deb= :\
*.rpm= :\
*.jar= :\
*.war= :\
*.ear= :\
*.sar= :\
*.rar= :\
*.alz= :\
*.ace= :\
*.zoo= :\
*.cpio= :\
*.7z= :\
*.rz= :\
*.cab= :\
*.wim= :\
*.swm= :\
*.dwm= :\
*.esd= :\
*.jpg= :\
*.jpeg= :\
*.mjpg= :\
*.mjpeg= :\
*.gif= :\
*.bmp= :\
*.pbm= :\
*.pgm= :\
*.ppm= :\
*.tga= :\
*.xbm= :\
*.xpm= :\
*.tif= :\
*.tiff= :\
*.png= :\
*.svg= :\
*.svgz= :\
*.mng= :\
*.pcx= :\
*.mov=辶:\
*.mpg=辶:\
*.mpeg=辶:\
*.m2v=辶:\
*.mkv=辶:\
*.webm=辶:\
*.ogm=辶:\
*.mp4=辶:\
*.m4v=辶:\
*.mp4v=辶:\
*.vob=辶:\
*.qt=辶:\
*.nuv=辶:\
*.wmv=辶:\
*.flc=辶:\
*.avi=辶:\
*.asf= :\
*.rm= :\
*.rmvb= :\
*.fli= :\
*.flv= :\
*.gl= :\
*.dl= :\
*.xcf= :\
*.xwd= :\
*.yuv= :\
*.cgm= :\
*.emf= :\
*.ogv= :\
*.ogx= :\
*.aac= :\
*.au= :\
*.flac= :\
*.m4a= :\
*.mid= :\
*.midi= :\
*.mka= :\
*.mp3= :\
*.mpc= :\
*.ogg= :\
*.ra= :\
*.wav= :\
*.oga= :\
*.opus= :\
*.spx= :\
*.xspf= :\
*.pdf= :\
*.nix= :\
"

# include Mycroft commands
[[ -f $HOME/.profile_mycroft ]] && source $HOME/.profile_mycroft

# added by Nix installer
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then 
    source $HOME/.nix-profile/etc/profile.d/nix.sh
fi
