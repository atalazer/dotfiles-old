# ===== Variable ===== {{{

export ZDIR=$HOME/.zsh
fpath=($HOME/.zsh/completions $fpath)

# }}}

# ===== Plugins ===== {{{

setopt promptsubst

[[ -f $ZDIR/zinit.zsh ]] && source $ZDIR/zinit.zsh

source $ZDIR/plug-conf/nnn.zsh
source $ZDIR/plug-conf/dotbare.zsh

# }}}

# ===== Prompt ===== {{{
function set_win_title(){
    print -Pn "\e]0;%~\a"
}
precmd_functions+=(set_win_title)

export STARSHIP_CONFIG=$HOME/.config/starship.toml
eval "$(starship init zsh)"

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

source $ZDIR/modules/compe.zsh
source $ZDIR/modules/dir.zsh
source $ZDIR/modules/keys.zsh

# Allow Comment in Interactive Shell
setopt interactive_comments

#}}}

# ===== User ===== {{{

source ~/.aliases           # User alias definition
source ~/.function          # User function definition

export TODO=${NOTE_DIR:-$HOME/Documents/Notes}/TODO.md
export SCHEDULE=${NOTE_DIR:-$HOME/Documents/Notes}/SCHEDULE.md

eval "$(zoxide init zsh)"
eval "$(fnm env)"

# }}}

