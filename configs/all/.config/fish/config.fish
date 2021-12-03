bash -c "source ~/.profile"

### ===== Variables {{{
# Locale
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Exports
export VISUAL="nvim"
export EDITOR="$VISUAL"

# Get terminal emulator
set TERM_EMULATOR (ps -aux | grep (ps -p $fish_pid -o ppid=) | awk 'NR==1{print $11}')

set -gx TODO ~/Documents/Notes/TODO.md
set -gx SCHEDULE ~/Documents/Notes/SCHEDULE.md

# }}}

### ===== Settings {{{
source ~/.config/fish/colors/tokyonight.fish

set -g fish_greeting

# Add Path
fish_add_path ~/.zinit/plugins/kazhala---dotbare

# }}}

### ===== Function {{{
# Make su launch fish
function su
   command su --shell=/usr/bin/fish $argv
end

source ~/.config/fish/functions/schedule.fish
source ~/.config/fish/functions/todo.fish
source ~/.config/fish/alias.fish

# }}}

### ==== User Startup {{{
# Starship Prompt
starship init fish | source

# cd replacement
zoxide init fish | source

# Node Env
fnm env | source

# }}}

# vim:ft=fish:nofoldenable
