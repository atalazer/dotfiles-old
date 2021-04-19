# > @by:
# > Atalazer zshrc
# >
# > @map:
# > Variable & Helper Definition => ZSH Settings => Prompt => Plugins => User Settings
# >

# ===== Variable =====
export ZDIR=$HOME/.zsh
ZSH_CACHE_DIR=$ZDIR/.cache

# available: antigen, sheldon, zinit
PLUG_MAN=antigen

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
        [ -f $1 ] && source $1
    else
        if [ $PLUG_MAN = zinit ]; then
            [ -f $1 ] && source $1
        else
            [ -f $1 ] && zsh-defer source $1
        fi
    fi
}

# ===== Prompt =====

if [[ $PROMPT = "starship" ]]; then
    export STARSHIP_CONFIG=$HOME/.config/starship.toml
    eval "$(starship init zsh)"
elif [[ $PROMPT = "spaceship" ]]; then
    Source $ZDIR/plug-conf/spaceship-prompt.zsh
fi

# ===== Zsh =====
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

# ===== User =====
source ~/.aliases           # User alias definition
source ~/.function          # User function definition
todo --show

eval "$(zoxide init zsh)"

