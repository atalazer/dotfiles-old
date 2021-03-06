# vim: set sw=2 ts=2:
# =================================================
# Zinit
# =================================================
### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
  print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
  command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
  command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
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

# ============================================= #
# Base                                          #
# ============================================= #
zinit wait"0" lucid light-mode for \
  olets/zsh-abbr \
  atload"_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions \
  zdharma-continuum/fast-syntax-highlighting \

# ============================================= #
# Completions                                   #
# ============================================= #
zinit ice wait"0" lucid \
  blockf atpull'zinit creinstall -q .' atload"zicompinit; zicdreplay;"
zinit light zsh-users/zsh-completions

zinit wait"0" lucid light-mode for \
  atclone"./zplug.zsh" atload"zpcdreplay" \
    g-plane/zsh-yarn-autocompletions \
  spwhitt/nix-zsh-completions \

# fzf-tab
# ------------------
# zinit ice wait"0" lucid
# zinit light Aloxaf/fzf-tab
# zstyle ':completion:complete:*:options' sort false
# zstyle ':fzf-tab:*' fzf-command fzf
# zstyle ':fzf-tab:*' switch-group ',' '.'
# zstyle ':fzf-tab:*' continuous-trigger '/'
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'

# ============================================= #
# Be More Productive                            #
# ============================================= #
zinit wait"1" lucid light-mode for \
  hlissner/zsh-autopair
  # MichaelAquilina/zsh-you-should-use \

zinit wait"2" lucid light-mode for \
  wfxr/forgit \
  kazhala/dotbare

