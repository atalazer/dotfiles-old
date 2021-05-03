# =================================================
# Zinit
# =================================================
### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-bin-gem-node \
    zinit-zsh/z-a-man \
    # zinit-zsh/z-a-as-monitor \
    # zinit-zsh/z-a-rust \
    # zinit-zsh/z-a-patch-dl \

### End of Zinit's installer chunk


# =================================================
# Users Script
# =================================================

_zpcompinit_custom() {
    setopt extendedglob local_options
    autoload -Uz compinit
    local zcd=${ZDOTDIR:-$HOME}/.zcompdump
    local zcdc="$zcd.zwc"
    # Compile the completion dump to increase startup speed, if dump is newer or doesn't exist,
    # in the background as this is doesn't affect the current session
    if [[ -f "$zcd"(#qN.m+1) ]]; then
        compinit -i -d "$zcd"
        { rm -f "$zcdc" && zcompile "$zcd" } &!
    else
        compinit -C -d "$zcd"
        { [[ ! -f "$zcdc" || "$zcd" -nt "$zcdc" ]] && rm -f "$zcdc" && zcompile "$zcd" } &!
    fi
}

# =================================================
# Users Plugins
# =================================================

if [[ $PROMPT = pure ]]; then
    zinit ice pick"async.zsh" src"pure.zsh"
    zinit light sindresorhus/pure
elif [[ $PROMPT = spaceship ]]; then
    zinit light denysdovhan/spaceship-prompt
fi

# ===== Basic =====
zinit wait lucid light-mode for \
    atinit"_zpcompinit_custom; zicdreplay" \
        zdharma/fast-syntax-highlighting \
    atload"!_zsh_autosuggest_start" \
        zsh-users/zsh-autosuggestions \
    blockf atpull"zinit creinstall -q ." \
        zsh-users/zsh-completions

# ===== Script =====
zinit wait lucid light-mode for \
        kazhala/dotbare \
    atload'ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(autopair-insert)' \
        hlissner/zsh-autopair

