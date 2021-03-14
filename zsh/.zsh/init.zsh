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

setopt promptsubst
zinit wait lucid for \
    OMZL::clipboard.zsh \
    OMZL::completion.zsh \
    OMZL::directories.zsh \
    OMZL::git.zsh \
    OMZL::key-bindings.zsh \
    OMZL::spectrum.zsh

zinit wait lucid for \
    OMZP::archlinux \
    OMZP::thefuck \
    OMZP::sudo \
    OMZP::systemd \
  atload"unalias grv" \
    OMZP::git \
    # OMZP::tmux \
    # OMZP::ssh-agent \

zinit wait'0' lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma/fast-syntax-highlighting \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions

zinit ice lucid atload'zsh-startify'
zinit light zdharma/zsh-startify
zstyle ":plugin:zsh-startify:shellutils" size 5
zstyle ":plugin:zsh-startify:vim" size 5

zinit ice wait"0" lucid
zinit load zdharma/history-search-multi-word
zstyle ":history-search-multi-word" page-size "11"
zstyle ":history-search-multi-word" highlight-color "fg=yellow,bold"
zstyle ":plugin:history-search-multi-word" synhl "yes"
zstyle ":plugin:history-search-multi-word" active "underline"
zstyle ":plugin:history-search-multi-word" check-paths "yes"
zstyle ":plugin:history-search-multi-word" clear-on-cancel "no"

# zinit light Aloxaf/fzf-tab
# zstyle ':completion:*:git-checkout:*' sort false
# zstyle ':completion:*:descriptions' format '[%d]'
# zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# zstyle ':fzf-tab:*' switch-group ',' '.'

zinit light kazhala/dotbare
# zinit ice wait lucid
# zinit light unixorn/fzf-zsh-plugin
# zinit ice wait lucid
# zinit load 'wfxr/forgit'

# zinit light-mode wait'0' lucid for \
#     b4b4r07/emoji-cli \
#     pschmitt/emoji-fzf.zsh
# EMOJI_FZF_BIN_PATH="emoji-fzf"
# EMOJI_FZF_BINDKEY="^k"
# EMOJI_FZF_FUZZY_FINDER=fzf
# EMOJI_FZF_FUZZY_FINDER_ARGS=
# EMOJI_FZF_CUSTOM_ALIASES=
# EMOJI_FZF_PREPEND_EMOJIS=1
# EMOJI_FZF_NO_ALIAS=
# EMOJI_FZF_CLIPBOARD="xsel -b"

zinit ice wait"0c" lucid reset \
    atclone"local P=${${(M)OSTYPE:#*darwin*}:+g}
            \${P}sed -i \
            '/DIR/c\DIR 38;5;63;1' LS_COLORS; \
            \${P}dircolors -b LS_COLORS > c.zsh" \
    atpull'%atclone' pick"c.zsh" nocompile'!' \
    atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
zinit light trapd00r/LS_COLORS

# zinit ice wait"1" lucid
# zinit load zdharma/zui
# zinit wait lucid for zinit-zsh/zinit-console
# zinit load zpm-zsh/tmux
zinit ice wait'0' lucid
zinit light hlissner/zsh-autopair

# Initialize Themes
# Load the pure theme, with zsh-async library that's bundled with it.
zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure

# zinit ice wait'!' lucid atload'true; _p9k_precmd' nocd
# zinit light romkatv/powerlevel10k

if [[ -z "$ZSH_CACHE_DIR" ]]; then
  ZSH_CACHE_DIR="$Z_DIR/.cache"
fi

export ZM_DIR="$Z_DIR/modules"
export ZP_DIR="$Z_DIR/plugins"
export ZT_DIR="$Z_DIR/themes"
 

# for module ($Modules); do
#     source $ZM_DIR/$module.zsh
# done

