export ROOT="/root"
export Z_DIR="${ROOT:-/root}/.zshrc.d"

# source zsh config
export STARSHIP_CONFIG="$ROOT/starship.toml"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

_source_path(){ [ -f $1 ] && source $1 }
_source_path ${Z_DIR}/compe.zsh
_source_path ${Z_DIR}/function.zsh
_source_path ${Z_DIR}/keys.zsh
_source_path ${ROOT:-/root}/.aliases

: ${HISTFILE=${ZDOTDIR:-${ROOT}}/.zhistory}
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_FIND_NO_DUPS HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE HIST_VERIFY
setopt SHARE_HISTORY

DIRSTACKSIZE=16
setopt AUTO_CD AUTO_PUSHD
setopt PUSHD_SILENT PUSHD_IGNORE_DUPS PUSHD_TO_HOME

setopt INTERACTIVE_COMMENTS
setopt EXTENDED_GLOB
setopt NO_CLOBBER

setopt LONG_LIST_JOBS NO_BG_NICE
setopt NO_CHECK_JOBS NO_HUP

bindkey -e

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

fpath=($ROOT/.zsh/completion $fpath)
autoload -Uz compinit && \
compinit -C -d "${ZDOTDIR:-${ROOT}}/.zcompdump"

