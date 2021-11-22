ZSH_INIT_TIME=$(date +%s%N)
# ===== Variable ===== {{{
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export ZDIR="$HOME/.zsh"

GREEN=$(tput setaf 2); YELLOW=$(tput setaf 3); NORMAL=$(tput sgr0)
fpath=($ZDIR/completions $fpath)

# @function: source file if exist.
so() {
    FILE=$1
    [ -f "$FILE" ] && . $FILE
}

# }}}

# ===== Plugins ===== {{{

setopt promptsubst
so $ZDIR/zinit.zsh

# ---------------- You Should Use
export YSU_HARDCORE=0
export YSU_MESSAGE_POSITION="after"
export YSU_MODE=BESTMATCH
export YSU_MESSAGE_FORMAT="Instead use ${YELLOW}'%command'${NORMAL} use ${GREEN}'%alias'${NORMAL}"

# ---------------- Augosuggestion
export ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd completion)
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
# unset ZSH_AUTOSUGGEST_USE_ASYNC
bindkey '^ ' autosuggest-accept

# --------------- vi-mode
export ZVM_VI_INSERT_ESCAPE_BINDKEY=jj
export ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BEAM
export ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK
export ZVM_OPPEND_MODE_CURSOR=$ZVM_CURSOR_UNDERLINE

# }}}

# ===== Zsh ===== {{{

setopt autocd		        # Automatically cd into typed directory.
stty stop undef		        # Disable ctrl-s to freeze terminal.
setopt interactive_comments # Allow Comment in Interactive Shell

# History
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY

# Binkeys
 bindkey -e # v = vim || e = emacs
KEYTIMEOUT=1

# Zsh Modules
MODULE_DIR=$ZDIR/modules
if [ -d $MODULE_DIR ]; then
    for f in $MODULE_DIR/?*; do
        so $f
    done
    unset f
fi

# vicmd by default
# zle-line-init() { zle -K vicmd; }
# zle -N zle-line-init

# Change cursor shape for different vi modes.
zle-keymap-select() {
    if  [[ ${KEYMAP} == vicmd ]] ||
        [[ $1 = 'block' ]]
    then
        echo -ne '\e[1 q'
    elif [[ ${KEYMAP} == main ]] ||
        [[ ${KEYMAP} == viins ]] ||
        [[ ${KEYMAP} = '' ]] ||
        [[ $1 = 'beam' ]]
    then
        echo -ne '\e[5 q'
    fi
}
zle -N zle-keymap-select

# Cursor Beam
_fix_cursor() { echo -ne '\e[5 q'; }
precmd_functions+=(_fix_cursor)

# Reload Completions
rc() {
  local f; f=($ZDIR/completions/*(.))
  unfunction $f:t 2> /dev/null; autoload -U $f:t
}

#}}}

# ===== Prompt ===== {{{
if command -v "starship" >/dev/null 2>&1; then
    export STARSHIP_CONFIG=$XDG_CONFIG_HOME/starship.toml
    export STARSHIP_CACHE=$XDG_CACHE_HOME/starship/cache
    eval "$(starship init zsh)"
fi

# }}}

set_win_title(){
    print -Pn "\e]0;%~\a"
}
precmd_functions+=(set_win_title)

# ===== User ===== {{{
# User alias definition
ALIASES=${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliases
so $ALIASES

# User abbreviations definition
# ABBREVIATIONS=${XDG_CONFIG_HOME:-$HOME/.config}/shell/abbreviations
# so $ABBREVIATIONS
# abbr import-aliases

# User function definition
FUNCTIONS=${XDG_CONFIG_HOME:-$HOME/.config}/shell/functions
if [ -d $FUNCTIONS ]; then
    for f in $FUNCTIONS/?*; do
        so $f
    done
    unset f
fi

# User config
CONFIGS=${XDG_CONFIG_HOME:-$HOME/.config}/shell/configs
if [ -d $CONFIGS ]; then
    for f in $CONFIGS/?*; do
        so $f
    done
    unset f
fi

export TODO=${NOTE_DIR:-$HOME/Documents/Notes}/TODO.md
export SCHEDULE=${NOTE_DIR:-$HOME/Documents/Notes}/SCHEDULE.md

# broot, better cd
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/broot/launcher/bash/br" ] &&
    so ${XDG_CONFIG_HOME:-$HOME/.config}/broot/launcher/bash/br

# Start CLI Apps
command -v "zoxide" >/dev/null 2>&1 && eval "$(zoxide init zsh)"

export FNM_DIR=${XDG_DATA_HOME:-$HOME/.local/share}/fnm
command -v "fnm" >/dev/null 2>&1 && eval "$(fnm env --fnm-dir $FNM_DIR)"

export GPG_TTY="$(tty)"

# }}}

ZSH_LOADED_TIME=$(date +%s%N)
ZSH_STARTUP_TIME=$(((ZSH_LOADED_TIME - ZSH_INIT_TIME) / 1000000))

printf "Startup time: $ZSH_STARTUP_TIME ms\n"
unset ZSH_INIT_TIME ZSH_LOADED_TIME ZSH_STARTUP_TIME
