set --local PERMISSION sudo

# Basic
alias c "clear"
alias r "exec zsh"
alias q "exit"
alias cdf "cd $DOTS"
alias cdb "cd $BLOG"
alias cdn "cd $NOTE_DIR"
alias cdp "cd $PROGRAMMING_DIR"
alias cds "cd $SCHOOL_DIR"

alias priv "fish --private"                                 # Fish incognito mode
alias untar "tar -zxvf"                                     # Untar
alias ipe "curl ifconfig.co"                                # Get external IP address
alias ipef "curl ifconfig.co/json"                          # Get external IP address Full
alias ips "ip link show"                                    # Get network interfaces information

# EDITOR Alias
alias e "$EDITOR"
alias se "sudoedit"
alias ev "$EDITOR ~/.config/nvim/init.lua"
alias ef "$EDITOR ~/.config/fish/config.fish"
alias ex "$EDITOR ~/.Xresources"
alias ea "$EDITOR ~/.config/awesome/rc.lua"

# exa. ls replacement
if command -v "exa" > /dev/null 2>&1
    alias ls "exa --icons --group-directories-first"
    alias lsa "exa --icons --group-directories-first -a"
    alias ll "exa --icons --group-directories-first -lgh"
    alias lla "exa --icons --group-directories-first -algh"
end

# Use Trash Instead of rm
if command -v "trash" > /dev/null 2>&1
    alias rm "trash"
    alias tr "trash"
    alias tl "trash-list"
    alias trs "trash-restore"
else if command -v "gio" > /dev/null 2>&1
    alias rm "gio trash"
    alias tr "gio trash"
    alias tl "gio trash --list"
    alias trs "gio trash --restore"
else if command -v "rip" > /dev/null 2>&1
    alias rm "rip"
    alias tr "rip"
    alias tl "rip -s"
    alias trs "rip -u"
end

# Git Alias
alias ga "git add"
alias gr "git remove"
alias gs "git status"
alias glg "git log"

alias gb "git branch"
alias gco "git checkout"
alias gcl "git clone --recursive"
alias gp "git push"
alias gl "git pull"
alias gf "git fetch"
alias gcm "git commit"
alias gcmsg "git commit -m"

alias grh "git reset"
alias grhh "git reset --hard"
alias grev "git revert"

alias gstp "git stash push"
alias gsta "git stash apply"
alias gstc "git stash clear"
alias gstd "git stash drop"
alias gstl "git stash list"

alias lg "lazygit"

# Alias for dotbare
alias da "dotbare fadd"
alias de "dotbare fedit"
alias dl "dotbare flog"

alias td "todo"
alias tds "todo -s"
alias tde "todo -e"

alias sc "schedule"
alias scs "schedule -s"
alias sce "schedule -e"

# Archlinux
if command -v "pacman" > /dev/null 2>&1
    alias pacin "$PERMISSION pacman -S"
    alias pacsearch "$PERMISSION pacman -Ss"
    alias pacupd "$PERMISSION pacman -Syy"
    alias pacupg "$PERMISSION pacman -Syu"
    alias pacrem "$PERMISSION pacman -Rns"
    alias pacrmorp "pacman -Qtdq | $PERMISSION pacman -Rns - "
end

if command -v "paru" > /dev/null 2>&1
    alias pain "paru -S"
    alias pasearch "paru -Ss"
    alias paupd "paru -Syy"
    alias paupg "paru -Syu"
    alias parem "paru -Rcns"
    alias parmorp "paru -Qtdq | paru -Rns -"
end

# tmux
if command -v "tmux" > /dev/null 2>&1
    alias tma "tmux attach -t"
    alias tms "tmux new-session -s"
    alias tml "tmux list-sessions"
    alias tmk "tmux kill-session -t"
end

# youtube-dl
if command -v "youtube-dl" > /dev/null 2>&1
    alias yt480p "youtube-dl -f 'best[height< 480][ext=mp4]' --embed-thumbnail"
    alias ytm "youtube-dl --extract-audio --add-metadata --xattrs --embed-thumbnail --audio-quality 0 --audio-format mp3"
end

# Use advcpmv instead mv cp
if command -v "mvg" > /dev/null 2>&1
    alias mv "mvg -g"
end

if command -v "cpg" > /dev/null 2>&1
    alias cp "cpg -g"
end

