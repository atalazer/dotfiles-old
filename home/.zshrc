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
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

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

# Node.js
export NVM_DIR="$HOME/.nvm"
export NVM_LAZY_LOAD=true
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
zinit wait lucid light-mode for \
    lukechilds/zsh-nvm \
    lukechilds/zsh-better-npm-completion

zinit wait lucid atload"zinit cclear; zicompinit; zicdreplay" blockf light-mode for \
    zsh-users/zsh-completions

# ----------------------------------- Program
# starship
export STARSHIP_CONFIG=$HOME/.config/starship.toml
zinit ice from"gh-r" as"program" mv"starship* -> starship"
zinit light starship/starship
eval "$(starship init zsh)"

zinit wait lucid from"github-rel" as"program" light-mode for \
    sbin"fzf"       junegunn/fzf \
    sbin"sk"        lotabout/skim \
    sbin"**/rg"     BurntSushi/ripgrep \
    sbin"**/delta"  dandavison/delta \
    sbin"**/bat"    @sharkdp/bat \
    sbin"**/fd"     @sharkdp/fd \
    sbin"**/exa"    ogham/exa \
    sbin"zoxide"    atload"!eval '$(zoxide init zsh)'"    ajeetdsouza/zoxide

zinit wait lucid from"github" as"program" light-mode for \
    sbin"nnn"       make"O_NERD=1"  jarun/nnn \
    sbin"googler"   make            jarun/googler


# ----------------------------------- Misc
# --- Dotfiles Manager
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
export DOTBARE_DIFF_PAGER="delta --diff-so-fancy --line-numbers"
zinit ice wait lucid
zinit light kazhala/dotbare

# =================================================
# User Section
# =================================================
export Z_DIR="/home/atalariq/.zsh"
source_path(){
    [ -f $1 ] && zinit snippet $1 
}

source_path ${Z_DIR}/function.zsh
source_path ${Z_DIR}/compe.zsh
source_path ${Z_DIR}/keys.zsh
source_path ${HOME}/.user
source_path ${HOME}/.aliases
source_path ${HOME}/.config/nnn/nnn
source_path ${HOME}/.fzf.zsh

# =================================================
# Zsh configuration
# =================================================
HISTFILE=${ZDOTDIR:-${HOME}}/.zhistory
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

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

