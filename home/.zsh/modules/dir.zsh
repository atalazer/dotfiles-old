# Changing/making/removing directory
setopt auto_cd # Change directory without typing cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

alias -g ...='cd ../..'
alias -g ....='cd ../../..'
alias -g .....='cd ../../../..'

alias -- -='cd -'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'

alias md='mkdir -p'
alias rd='rmdir'
alias d='dirs -v | head -10'

