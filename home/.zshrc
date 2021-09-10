# ===== Variable ===== {{{

export ZDIR=$HOME/.zsh
fpath=($HOME/.zsh/completions $fpath)

# }}}

# ===== Plugins ===== {{{

setopt promptsubst

[[ -f $ZDIR/zinit.zsh ]] && source $ZDIR/zinit.zsh

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

# User alias definition
source $HOME/.config/shell/aliases

# User function definition
source $HOME/.config/shell/functions/dict
source $HOME/.config/shell/functions/git
source $HOME/.config/shell/functions/schedule
source $HOME/.config/shell/functions/todo
source $HOME/.config/shell/functions/weather
source $HOME/.config/shell/functions/others

export TODO=${NOTE_DIR:-$HOME/Documents/Notes}/TODO.md
export SCHEDULE=${NOTE_DIR:-$HOME/Documents/Notes}/SCHEDULE.md

eval "$(zoxide init zsh)"
eval "$(fnm env)"

# }}}

# ===== Prompt ===== {{{
export STARSHIP_CONFIG=$HOME/.config/starship.toml
eval "$(starship init zsh)"

# }}}

