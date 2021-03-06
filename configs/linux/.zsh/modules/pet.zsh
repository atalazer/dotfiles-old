# pet
# Simple command-line snippet manager, written in Go.
# https://github.com/knqyf263/pet

# Register the previous command easily
prev() {
  PREV=$(fc -lrn | head -n 1)
  sh -c "pet new $(printf %q "$PREV")"
}

# Select snippets at the current line (like C-r)
_pet_select() {
  BUFFER=$(pet search --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle redisplay
}
zle -N _pet_select
stty -ixon
bindkey '^s' _pet_select

alias pa="pet new"
alias pe="pet exec"
