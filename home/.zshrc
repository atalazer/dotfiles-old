# ===== Variable ===== {{{

export ZDIR=$HOME/.zsh
fpath=($HOME/.zsh/completions $fpath)

# available: antigen, zinit
PLUG_MAN=zinit

# available: starship, spaceship
PROMPT="starship"

# }}}

# ===== Plugins ===== {{{

if [[ $PLUG_MAN = "zinit" ]]; then
    [[ -f $ZDIR/zinit.zsh ]] && source $ZDIR/zinit.zsh
elif [[ $PLUG_MAN = "antigen" ]]; then
    [[ -f $ZDIR/antigen.zsh ]] && source $ZDIR/antigen.zsh
fi

source $ZDIR/plug-conf/nnn.zsh
source $ZDIR/plug-conf/dotbare.zsh

# }}}

# ===== Prompt ===== {{{

if [[ $PROMPT = "starship" ]]; then
    export STARSHIP_CONFIG=$HOME/.config/starship.toml
    eval "$(starship init zsh)"
elif [[ $PROMPT = "spaceship" ]]; then
    source $ZDIR/plug-conf/spaceship-prompt.zsh
fi

# }}}

# ===== Zsh ===== {{{

# History
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=${ZDOTDIR:-${HOME}}/.zsh-history
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY

source $ZDIR/modules/compe.zsh
source $ZDIR/modules/dir.zsh
source $ZDIR/modules/keys.zsh

#}}}

# ===== User ===== {{{

source ~/.aliases           # User alias definition
source ~/.function          # User function definition

export TODO=${NOTE_DIR:-$HOME/Documents/Notes}/TODO.md
export SCHEDULE=${NOTE_DIR:-$HOME/Documents/Notes}/SCHEDULE.md

eval "$(zoxide init zsh)"
eval "$(fnm env)"

# }}}

