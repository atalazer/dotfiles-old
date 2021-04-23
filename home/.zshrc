# ===== Variable =====
export ZDIR=$HOME/.zsh
ZSH_CACHE_DIR=$ZDIR/.cache

# available: antigen, sheldon, zinit
PLUG_MAN=zinit

if [[ $PLUG_MAN != "sheldon" ]]; then
    # available: starship spaceship, pure
    PROMPT=starship
fi

# ===== Helper =====
if [ ! -d $ZDIR/.zsh-defer ]; then
    if [ command -v "git" &>/dev/null ]; then
        git clone https://github.com/romkatv/zsh-defer.git $ZDIR/.zsh-defer
    else
        echo "Please Install git first or download romkatv/zsh-defer for better zsh load times"
    fi
else
    [ -f $ZDIR/.zsh-defer/zsh-defer.plugin.zsh ] && \
        source $ZDIR/.zsh-defer/zsh-defer.plugin.zsh
fi

Source(){
    if [ command -v "zsh-defer" &>/dev/null ]; then
        [ -f $1 ] && zsh-defer source $@
    else
        [ -f $1 ] && source $@
    fi
}

Eval(){
    if [ command -v "zsh-defer" &>/dev/null ]; then
        zsh-defer eval $1
    else
        eval $1
    fi
}

# ===== Plugins =====
export NVM_DIR="$HOME/.nvm"
export NVM_LAZY_LOAD=true
export NVM_LAZY_LOAD_EXTRA_COMMANDS=("nvim")

if [[ $PLUG_MAN = "zinit" ]]; then
    [[ -f $ZDIR/zinit.zsh ]] && source $ZDIR/zinit.zsh
elif [[ $PLUG_MAN = "antigen" ]]; then
    [[ -f $ZDIR/antigen.zsh ]] && source $ZDIR/antigen.zsh
elif [[ $PLUG_MAN = "sheldon" ]]; then
    eval "$(sheldon source)"
fi

Source $ZDIR/plug-conf/nnn.zsh
Source $ZDIR/plug-conf/dotbare.zsh

# ===== Prompt =====

if [[ $PROMPT = "starship" ]]; then
    export STARSHIP_CONFIG=$HOME/.config/starship.toml
    Eval "$(starship init zsh)"
elif [[ $PROMPT = "spaceship" ]]; then
    Source $ZDIR/plug-conf/spaceship-prompt.zsh
fi

# ===== Zsh =====

function set_win_title(){
    print -Pn "\e]0;%~\a"
}
precmd_functions+=(set_win_title)

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # use beam shape cursor for each new prompt.

# Autocorrect
#setopt correct

# History
HISTFILE=${ZDOTDIR:-${HOME}}/.zhistory
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_FIND_NO_DUPS HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE HIST_VERIFY
setopt SHARE_HISTORY

Source $ZDIR/modules/compe.zsh
Source $ZDIR/modules/dir.zsh
Source $ZDIR/modules/keys.zsh

# ===== User =====
Source ~/.aliases           # User alias definition
Source ~/.function          # User function definition

export TODO=$HOME/notes/TODO.md
export SCHEDULE=$HOME/notes/SCHEDULE.md
todo --show
# schedule --show

Eval "$(zoxide init zsh)"

