# =================================================
# Zsh configuration
# =================================================
precmd () {
    print -Pn "\e]0;%~\a"
}
preexec () {
    print -Pn "\e]0;%~:$1\a"
}

: ${HISTFILE=${ZDOTDIR:-${HOME}}/.zhistory}
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_FIND_NO_DUPS; setopt HIST_IGNORE_DUPS;
setopt HIST_IGNORE_SPACE; setopt HIST_VERIFY; setopt SHARE_HISTORY;

DIRSTACKSIZE=16
setopt AUTO_CD; setopt AUTO_PUSHD; setopt PUSHD_SILENT;
setopt PUSHD_IGNORE_DUPS; setopt PUSHD_TO_HOME;

setopt INTERACTIVE_COMMENTS; setopt EXTENDED_GLOB;
# setopt NO_CLOBBER;

setopt LONG_LIST_JOBS; setopt NO_BG_NICE;
setopt NO_CHECK_JOBS; setopt NO_HUP;

bindkey -e

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

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
### End of Zinit's installer chunk

# =================================================
# Users Plugins
# =================================================

# ----------------------------------- Autosuggestions & fast-syntax-highlighting
# fast-syntax-highlighting
zinit ice wait lucid atinit"ZINIT[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay"
zinit light zdharma/fast-syntax-highlighting

# zsh-autosuggestions
zinit ice wait lucid atload"!_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions

# zsh-autopair bracket
zinit ice wait lucid
zinit light hlissner/zsh-autopair

# ----------------------------------- Completions
eval "$(thefuck --alias)"
eval "$(pip completion --zsh)"

zinit wait lucid for \
    lukechilds/zsh-better-npm-completion

zinit wait lucid atload"zicompinit; zicdreplay" blockf for \
    zsh-users/zsh-completions

# ----------------------------------- Misc
# --- Dotfiles Manager
zinit ice wait lucid
zinit load kazhala/dotbare
export DOTBARE_DIR="${DOTS:-$HOME/.dotfiles}/.git"
export DOTBARE_TREE="${DOTS:-$HOME/.dotfiles}"
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

# =================================================
# Initialize Themes
# =================================================
eval "$(starship init zsh)"
# zinit light romkatv/powerlevel10k

# =================================================
# Initialize User Configs
# =================================================
_source_path(){ [ -f $1 ] && source $1 }
export Z_DIR="/home/atalariq/.zsh"

# source zsh config
# source_path ${Z_DIR}/init.zsh
_source_path ${Z_DIR}/compe.zsh
_source_path ${Z_DIR}/function.zsh
_source_path ${Z_DIR}/keys.zsh
_source_path ${HOME}/.fzf.zsh
_source_path /usr/share/doc/pkgfile/command-not-found.zsh

# =================================================
# User Section
# =================================================
export VISUAL="nvim"
export EDITOR="nvim"

eval "$(zoxide init zsh)"

_source_path ${HOME}/.aliases
_source_path ${HOME}/.config/nnn/nnn

