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

# ===== Prompt ===== {{{
if command -v "starship" >/dev/null 2>&1; then
    export STARSHIP_CONFIG=$XDG_CONFIG_HOME/starship.toml
    export STARSHIP_CACHE=$XDG_CACHE_HOME/starship/cache
    eval "$(starship init zsh)"
fi

# }}}
