# ===== Variable ===== {{{

export ZDIR=$HOME/.zsh
fpath=($HOME/.zsh/completions $fpath)

# @function: source file if exist.
so (){
    FILE=$1
    [ -f "$FILE" ] && source $FILE
}

# }}}

# ===== Plugins ===== {{{

setopt promptsubst
so $ZDIR/zinit.zsh

# }}}

# ===== Zsh ===== {{{

# History
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=${ZDOTDIR:-${HOME}}/.zsh-history
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY
setopt HIST_IGNORE_SPACE

so $ZDIR/modules/compe.zsh
so $ZDIR/modules/dir.zsh
so $ZDIR/modules/keys.zsh

# Allow Comment in Interactive Shell
setopt interactive_comments

#}}}

# ===== User ===== {{{
# User alias definition
so $HOME/.config/shell/aliases

# User function definition
so $HOME/.config/shell/functions/dict
so $HOME/.config/shell/functions/git-svn
so $HOME/.config/shell/functions/pet
so $HOME/.config/shell/functions/schedule
so $HOME/.config/shell/functions/todo
so $HOME/.config/shell/functions/weather
so $HOME/.config/shell/functions/others

# User config
so $HOME/.config/nnn/nnn.conf
so $HOME/.config/lf/lf.conf

export TODO=${NOTE_DIR:-$HOME/Documents/Notes}/TODO.md
export SCHEDULE=${NOTE_DIR:-$HOME/Documents/Notes}/SCHEDULE.md

# broot, better cd
[ -f "$HOME/.config/broot/launcher/bash/br" ] && \
    so $HOME/.config/broot/launcher/bash/br

# Start CLI Apps
command -v "zoxide" > /dev/null 2>&1 && eval "$(zoxide init zsh)"
command -v "fnm" > /dev/null 2>&1 && eval "$(fnm env)"

# }}}

# ===== Prompt ===== {{{
if command -v "starship" > /dev/null 2>&1; then
    export STARSHIP_CONFIG=$HOME/.config/starship.toml
    eval "$(starship init zsh)"
fi

# }}}

