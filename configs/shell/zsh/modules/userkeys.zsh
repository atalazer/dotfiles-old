# Edit line in vim with ctrl-e:
# -------------------------------------
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Keys for dotbare
# -------------------------------------
bindkey -s '^g' "dotbare fedit"^j

# keys for zoxide
# -------------------------------------
bindkey -s '^b' "zi"^j

