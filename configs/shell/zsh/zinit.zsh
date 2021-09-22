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

# Startup timer
zinit light paulmelnikow/zsh-startup-timer

# Pure theme
# zinit ice compile"(pure|async).zsh" pick"async.zsh" src"pure.zsh"
# zinit light sindresorhus/pure

# Spaceship
# zinit light spaceship-prompt/spaceship-prompt

# Starship
zinit ice from"gh-r" as"program" mv"starship* -> starship" pick"starship/starship"
zinit light starship/starship

# Shelby
zinit ice from"gh-r" as"program" mv"shelby* -> shelby" pick"shelby/shelby"
zinit light athul/shelby

# Base
zinit wait lucid light-mode for \
  hlissner/zsh-autopair \
  MichaelAquilina/zsh-you-should-use \
    zdharma/fast-syntax-highlighting \
  atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions

# Completions
zinit wait lucid for \
  spwhitt/nix-zsh-completions \
  ninrod/pass-zsh-completion \
  atpull'zinit creinstall -q .' atload"zicompinit; zicdreplay" blockf \
  zsh-users/zsh-completions

zic(){
  zinit ice as"completion"
  zinit snippet "$1"
}

zic https://github.com/gopasspw/gopass/blob/master/zsh.completion
zic https://github.com/chmln/handlr/blob/master/completions/_handlr
zic https://github.com/xwmx/nb/blob/master/etc/nb-completion.zsh
zic https://github.com/jarun/nnn/blob/master/misc/auto-completion/zsh/_nnn
zic https://github.com/knqyf263/pet/blob/master/misc/completions/zsh/_pet

# Plugins
zinit wait lucid for \
  wfxr/forgit \
  kazhala/dotbare \
  as"command" pick"bin/mk" \
    NNBnh/mk
