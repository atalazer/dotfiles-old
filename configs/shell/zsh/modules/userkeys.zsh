# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Keys for dotbare
bindkey -s '^g' "dotbare fedit"^j

# keys for zoxide
bindkey -s '^b' "zi"^j

# keys for lf
bindkey -s '^o' 'lfcd\n'

bindkey -s '^a' 'bc -lq\n'
bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n'

bindkey '^[[P' delete-char
bindkey '^[[Z' reverse-menu-complete # fix reverse menu

