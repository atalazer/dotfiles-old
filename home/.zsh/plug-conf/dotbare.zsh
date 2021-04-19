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

# -------------------------------------
# Alias for dotbare
# -------------------------------------
alias da="dotbare fadd"
alias de="dotbare fedit"
alias dl="dotbare flog"
alias cdf="cd ${DOTS:-$HOME/.dotfiles}"

