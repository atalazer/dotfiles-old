# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

zinit wait lucid for \
    OMZL::clipboard.zsh \
    OMZL::completion.zsh \
    OMZL::git.zsh \
    OMZL::key-bindings.zsh

zinit wait lucid for \
    OMZP::archlinux \
    OMZP::thefuck \
    OMZP::sudo \
    OMZP::systemd \
    OMZP::git \
    OMZP::command-not-found

zinit wait'0' lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma/fast-syntax-highlighting \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions

zinit ice atload'zsh-startify'
zinit light zdharma/zsh-startify
zstyle ":plugin:zsh-startify:shellutils" size 5
zstyle ":plugin:zsh-startify:vim" size 5

zinit ice wait lucid
zinit light kazhala/dotbare
export DOTBARE_DIR="$HOME/.dotfiles/.git"
export DOTBARE_TREE="$HOME/.dotfiles"
export DOTBARE_BACKUP="${XDG_DATA_HOME:-$HOME/.local/share}/dotbare"
export DOTBARE_KEY="
    --bind=alt-a:toggle-all
    --bind=alt-j:jump
    --bind=alt-0:top
    --bind=alt-s:toggle-sort
    --bind=alt-t:toggle-preview
"
export DOTBARE_FZF_DEFAULT_OPTS="--preview-window=right:50%"
export DOTBARE_PREVIEW="bat {}"
# export DOTBARE_DIFF_PAGER="delta --diff-so-fancy --line-numbers"

zinit ice wait lucid
zinit light hlissner/zsh-autopair

zinit load lukechilds/zsh-better-npm-completion

# =================
# Initialize Themes
# =================

# zinit ice pick"async.zsh" src"pure.zsh"
# zinit light sindresorhus/pure

zinit light romkatv/powerlevel10k

# ------------------
# Initialize User Configs
# ------------------
source_path(){ [ -f $1 ] && source $1 }
export Z_DIR="/home/atalariq/.zsh"

# source zinit config
# source_path ${Z_DIR}/init.zsh
# ----------------------
# User Section
# ----------------------
export VISUAL="nvim"
export EDITOR="nvim"

source_path ~/.config/nnn/nnn

source_path ${HOME}/.aliases
source_path ${Z_DIR}/function.zsh

# ----------------------
# Start Section
# ----------------------
eval "$(zoxide init zsh)"
eval "$(pip completion --zsh)"

# -----------------
# Zsh configuration
# -----------------
# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$HOME/.zsh_history
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY
setopt SHARE_HISTORY

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
