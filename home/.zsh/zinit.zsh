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
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-patch-dl \

### End of Zinit's installer chunk

# =================================================
# Users Plugins
# =================================================

if [[ $PROMPT = starship ]]; then
    zinit lucid for \
        from"gh-r" as"command" \
        atinit'export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"' \
        atload'eval "$(starship init zsh)"' bpick'*unknown-linux-gnu*' \
            starship/starship
elif [[ $PROMPT = pure ]]; then
    zinit ice pick"async.zsh" src"pure.zsh"
    zinit light sindresorhus/pure
elif [[ $PROMPT = spaceship ]]; then
    zinit light denysdovhan/spaceship-prompt
fi

zinit wait lucid for \
    OMZL::termsupport.zsh \
    OMZP::command-not-found

# ===== Basic =====
zinit wait lucid light-mode for \
    atpull"zinit cclear" blockf \
        zsh-users/zsh-completions \
    atload"!_zsh_autosuggest_start" nocompile \
        zsh-users/zsh-autosuggestions \
    atinit"zicompinit; zicdreplay" nocompile nocompletions \
        zdharma/fast-syntax-highlighting \

# ===== Script =====
zinit wait lucid light-mode for \
    nocompile \
        kazhala/dotbare \
    nocompile nocompletions \
        MichaelAquilina/zsh-you-should-use \
    nocompile nocompletions \
        romkatv/zsh-prompt-benchmark \
    atload'ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(autopair-insert)' nocompile \
        hlissner/zsh-autopair

# ===== env =====
zinit wait lucid light-mode for \
        lukechilds/zsh-nvm \
        lukechilds/zsh-better-npm-completion

