# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ------------------
# Initialize User Configs
# ------------------
source_path(){ [ -f $1 ] && source $1 }
export Z_DIR="/home/atalariq/.zsh"

# source zinit config
source_path ${Z_DIR}/init.zsh
source_path /usr/share/doc/pkgfile/command-not-found.zsh
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

stty -ixon

# -----------------
# Zsh configuration
# -----------------
# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY
setopt SHARE_HISTORY

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
