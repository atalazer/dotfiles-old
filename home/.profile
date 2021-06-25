#!/usr/bin/env bash

[ -f $HOME/.user ] && source $HOME/.user

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --ignore-file ".gitignore"'
export SKIM_DEFAULT_COMMAND='rg --files --no-ignore --ignore-file ".gitignore"'

export CC="gcc"
export GOPATH="$HOME/.local/go"
export GOBIN="$HOME/.local/go/bin"

export TERMINFO=$HOME/.terminfo
export LESSHISTFILE="${XDG_CONFIG_HOME}less/history"
export LESSKEY="${XDG_CONFIG_HOME}less/keys"
export ICEAUTHORITY="${XDG_CACHE_HOME}ICEauthority"

### $PATH {{{
TO_PATH(){
    if [[ -d $1 ]]; then
        if [[ -z $(printf $PATH | grep $1) ]]; then
            export PATH="$1:$PATH"
        fi
    fi
}

TO_PATH ${APP_DIR:-$HOME/Applications}
TO_PATH ${BIN_DIR:-$HOME/.local/bin}
TO_PATH $HOME/.local/script
TO_PATH $HOME/.local/go/bin
TO_PATH $HOME/.emacs.d/bin
TO_PATH $HOME/.choosenim/toolchains/nim-1.4.8/bin
TO_PATH $HOME/.nimble/bin

# }}}

# added by Nix installer
if [ -e /home/atalariq/.nix-profile/etc/profile.d/nix.sh ]; then
    source /home/atalariq/.nix-profile/etc/profile.d/nix.sh;
fi
if [ -e /home/atalariq/.nix-profile/etc/profile.d/nix-daemon.sh ]; then
    source /home/atalariq/.nix-profile/etc/profile.d/nix-daemon.sh;
fi

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
