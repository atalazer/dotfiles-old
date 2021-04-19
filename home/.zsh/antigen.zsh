# ===== Start =====
if [[ ! -f $ZDIR/.antigen.zsh ]]; then
    curl -L git.io/antigen > $ZDIR/.antigen.zsh
else
    source $ZDIR/.antigen.zsh
fi
# =================================================
# oh-my-zsh
# =================================================
antigen use oh-my-zsh
antigen bundle command-not-found

# =================================================
# Prompt
# =================================================
if [[ $PROMPT = "pure" ]]; then
    antigen theme sindresorhus/pure
elif [[ $PROMPT = "spaceship" ]]; then
    antigen theme denysdovhan/spaceship-prompt
fi
# =================================================
# Plugins
# =================================================

# ===== Base =====
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search

# ===== Env =====
antigen bundle lukechilds/zsh-nvm
antigen bundle lukechilds/zsh-better-npm-completion

# ===== Misc =====
antigen bundle kazhala/dotbare
antigen bundle hlissner/zsh-autopair
antigen bundle MichaelAquilina/zsh-you-should-use

# ===== EOL =====
antigen apply
