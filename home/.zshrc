# ===== Variable ===== {{{

export ZDIR=$HOME/.zsh
fpath=($HOME/.zsh/completions $fpath)

# available: antigen, sheldon, zinit
PLUG_MAN=zinit

if [[ $PLUG_MAN != "sheldon" ]]; then
    # available: starship spaceship, pure
    PROMPT=starship
fi

# }}}

# ===== Helper ===== {{{

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

## Source
if [ command -v "zsh-defer" &>/dev/null ]; then
    Source(){
        [ -f $1 ] && zsh-defer source $1
    }
else
    Source(){
        [ -f $1 ] && source $1
    }
fi

## Eval
if [ command -v "zsh-defer" &>/dev/null ]; then
    Eval(){
        zsh-defer eval $1
    }
else
    Eval(){
        eval $1
    }
fi

# }}}

# ===== Plugins ===== {{{

if [[ $PLUG_MAN = "zinit" ]]; then
    [[ -f $ZDIR/zinit.zsh ]] && source $ZDIR/zinit.zsh
elif [[ $PLUG_MAN = "antigen" ]]; then
    [[ -f $ZDIR/antigen.zsh ]] && source $ZDIR/antigen.zsh
elif [[ $PLUG_MAN = "sheldon" ]]; then
    eval "$(sheldon source)"
fi

Source $ZDIR/plug-conf/nnn.zsh
Source $ZDIR/plug-conf/dotbare.zsh

# }}}

# ===== Prompt ===== {{{

if [[ $PROMPT = "starship" ]]; then
    export STARSHIP_CONFIG=$HOME/.config/starship.toml
    Eval "$(starship init zsh)"
elif [[ $PROMPT = "spaceship" ]]; then
    Source $ZDIR/plug-conf/spaceship-prompt.zsh
fi

# }}}

# ===== Zsh ===== {{{

# History
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=${ZDOTDIR:-${HOME}}/.zsh-history
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_DUPS

Source $ZDIR/modules/compe.zsh
Source $ZDIR/modules/dir.zsh
Source $ZDIR/modules/keys.zsh

#}}}

# ===== User ===== {{{

Source ~/.aliases           # User alias definition
Source ~/.function          # User function definition

export TODO=${NOTE_DIR:-$HOME/Documents/Notes}/TODO.md
export SCHEDULE=${NOTE_DIR:-$HOME/Documents/Notes}/SCHEDULE.md

Eval "$(zoxide init zsh)"
Eval "$(fnm env)"

# }}}

