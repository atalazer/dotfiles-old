# vim: set sw=2 ts=2:
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
# zinit light-mode for \
# zinit-zsh/z-a-bin-gem-node \
# zinit-zsh/z-a-man \
# zinit-zsh/z-a-as-monitor \
# zinit-zsh/z-a-rust \
# zinit-zsh/z-a-patch-dl \

### End of Zinit's installer chunk

# =================================================
# Users Plugins
# =================================================

# ============================================= #
# Base                                          #
# ============================================= #
zinit wait"0" lucid light-mode for \
  atload"_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions \
  zsh-users/zsh-history-substring-search \
  zdharma/fast-syntax-highlighting

# ============================================= #
# Completions                                   #
# ============================================= #
zinit wait"0" lucid light-mode for \
  spwhitt/nix-zsh-completions \
  ninrod/pass-zsh-completion \
  blockf atpull'zinit creinstall -q .' atload"zicompinit; zicdreplay;" \
    zsh-users/zsh-completions

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

# Custom Source
# ------------------
zic(){ zinit ice wait"0" lucid as"completion"; zinit snippet "$1"; }
zic https://github.com/gopasspw/gopass/blob/master/zsh.completion
zic https://github.com/chmln/handlr/blob/master/completions/_handlr
zic https://github.com/xwmx/nb/blob/master/etc/nb-completion.zsh
zic https://github.com/jarun/nnn/blob/master/misc/auto-completion/zsh/_nnn
zic https://github.com/knqyf263/pet/blob/master/misc/completions/zsh/_pet
zic https://github.com/dandavison/delta/blob/master/etc/completion/completion.zsh
zic https://github.com/ajeetdsouza/zoxide/blob/main/contrib/completions/_zoxide

# ============================================= #
# Be More Productive                            #
# ============================================= #
zinit wait"1" lucid light-mode for \
  hlissner/zsh-autopair \
  MichaelAquilina/zsh-you-should-use

zinit wait"2" lucid light-mode for \
  wfxr/forgit \
  kazhala/dotbare

# ============================================= #
# Extends Your Shell                            #
# ============================================= #

# # LS_COLORS
# # ---------------------
# zinit ice atclone"dircolors -b LS_COLORS > clrs.zsh" \
#   atpull'%atclone' pick"clrs.zsh" nocompile'!' \
#   atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
# zinit light trapd00r/LS_COLORS

# # direnv
# # ---------------------
# zinit as"program" make'!' atclone'./direnv hook zsh > zhook.zsh' \
#   atpull'%atclone' pick"direnv" src"zhook.zsh" for \
#   direnv/direnv

# ============================================= #
# Prompt                                        #
# ============================================= #

# Starship
# ---------------------
zinit ice from"gh-r" as"program" mv"starship* -> starship" pick"starship/starship"
zinit light starship/starship

