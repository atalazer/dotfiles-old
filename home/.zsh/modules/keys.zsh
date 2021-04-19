# Make sure that the terminal is in application mode when zle is active, since
# only then values from $terminfo are valid
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init() {
        echoti smkx
    }
function zle-line-finish() {
    echoti rmkx
}
zle -N zle-line-init
zle -N zle-line-finish
fi

# Use emacs key bindings
bindkey -e

# [PageUp] - Up a line of history
if [[ -n "${terminfo[kpp]}" ]]; then
    bindkey -M emacs "${terminfo[kpp]}" up-line-or-history
    bindkey -M viins "${terminfo[kpp]}" up-line-or-history
    bindkey -M vicmd "${terminfo[kpp]}" up-line-or-history
fi
# [PageDown] - Down a line of history
if [[ -n "${terminfo[knp]}" ]]; then
    bindkey -M emacs "${terminfo[knp]}" down-line-or-history
    bindkey -M viins "${terminfo[knp]}" down-line-or-history
    bindkey -M vicmd "${terminfo[knp]}" down-line-or-history
fi

# Start typing + [Up-Arrow] - fuzzy find history forward
if [[ -n "${terminfo[kcuu1]}" ]]; then
    autoload -U up-line-or-beginning-search
    zle -N up-line-or-beginning-search

    bindkey -M emacs "${terminfo[kcuu1]}" up-line-or-beginning-search
    bindkey -M viins "${terminfo[kcuu1]}" up-line-or-beginning-search
    bindkey -M vicmd "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# Start typing + [Down-Arrow] - fuzzy find history backward
if [[ -n "${terminfo[kcud1]}" ]]; then
    autoload -U down-line-or-beginning-search
    zle -N down-line-or-beginning-search

    bindkey -M emacs "${terminfo[kcud1]}" down-line-or-beginning-search
    bindkey -M viins "${terminfo[kcud1]}" down-line-or-beginning-search
    bindkey -M vicmd "${terminfo[kcud1]}" down-line-or-beginning-search
fi

# [Home] - Go to beginning of line
if [[ -n "${terminfo[khome]}" ]]; then
    bindkey -M emacs "${terminfo[khome]}" beginning-of-line
    bindkey -M viins "${terminfo[khome]}" beginning-of-line
    bindkey -M vicmd "${terminfo[khome]}" beginning-of-line

    bindkey -M emacs "^[[1~" beginning-of-line
    bindkey -M viins "^[[1~" beginning-of-line
    bindkey -M vicmd "^[[1~" beginning-of-line
fi
# [End] - Go to end of line
if [[ -n "${terminfo[kend]}" ]]; then
    bindkey -M emacs "${terminfo[kend]}"  end-of-line
    bindkey -M viins "${terminfo[kend]}"  end-of-line
    bindkey -M vicmd "${terminfo[kend]}"  end-of-line

    bindkey -M emacs "^[[4~"  end-of-line
    bindkey -M viins "^[[4~"  end-of-line
    bindkey -M vicmd "^[[4~"  end-of-line
fi

# [Shift-Tab] - move through the completion menu backwards
if [[ -n "${terminfo[kcbt]}" ]]; then
    bindkey -M emacs "${terminfo[kcbt]}" reverse-menu-complete
    bindkey -M viins "${terminfo[kcbt]}" reverse-menu-complete
    bindkey -M vicmd "${terminfo[kcbt]}" reverse-menu-complete
fi

# [Backspace] - delete backward
bindkey -M emacs '^?' backward-delete-char
bindkey -M viins '^?' backward-delete-char
bindkey -M vicmd '^?' backward-delete-char
# [Delete] - delete forward
if [[ -n "${terminfo[kdch1]}" ]]; then
    bindkey -M emacs "${terminfo[kdch1]}" delete-char
    bindkey -M viins "${terminfo[kdch1]}" delete-char
    bindkey -M vicmd "${terminfo[kdch1]}" delete-char
else
    bindkey -M emacs "^[[3~" delete-char
    bindkey -M viins "^[[3~" delete-char
    bindkey -M vicmd "^[[3~" delete-char

    bindkey -M emacs "^[3;5~" delete-char
    bindkey -M viins "^[3;5~" delete-char
    bindkey -M vicmd "^[3;5~" delete-char
fi

# [Ctrl-Delete] - delete whole forward-word
bindkey -M emacs '^[[3;5~' kill-word
bindkey -M viins '^[[3;5~' kill-word
bindkey -M vicmd '^[[3;5~' kill-word

# [Ctrl-RightArrow] - move forward one word
bindkey -M emacs '^[[1;5C' forward-word
bindkey -M viins '^[[1;5C' forward-word
bindkey -M vicmd '^[[1;5C' forward-word
# [Ctrl-LeftArrow] - move backward one word
bindkey -M emacs '^[[1;5D' backward-word
bindkey -M viins '^[[1;5D' backward-word
bindkey -M vicmd '^[[1;5D' backward-word

bindkey '\ew' kill-region                             # [Esc-w] - Kill from the cursor to the mark
bindkey -s '\el' '^u ls\n'                               # [Esc-l] - run command: ls
bindkey -s '\ep' '^u zi\n'                               # [Esc-p] - run command: zi (zoxide)
bindkey -s '\ed' '^u de\n'                               # [Esc-d] - run command: de (dotbare edit)
bindkey '^r' history-incremental-search-backward      # [Ctrl-r] - Search history

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

#
# sudo or sudoedit will be inserted before the command
#

__sudo-replace-buffer() {
    local old=$1 new=$2 space=${2:+ }
    if [[ ${#LBUFFER} -le ${#old} ]]; then
        RBUFFER="${space}${BUFFER#$old }"
        LBUFFER="${new}"
    else
        LBUFFER="${new}${space}${LBUFFER#$old }"
    fi
}

sudo-command-line() {
    [[ -z $BUFFER ]] && LBUFFER="$(fc -ln -1)"
    local WHITESPACE=""
    if [[ ${LBUFFER:0:1} = " " ]]; then
        WHITESPACE=" "
        LBUFFER="${LBUFFER:1}"
    fi
    if [[ -n "$EDITOR" ]]; then
        local cmd="${${(Az)BUFFER}[1]}"
        if [[ "${aliases[$cmd]} " = (\$EDITOR|$EDITOR)\ * ]]; then
            local EDITOR="$cmd"
        fi
    fi
    if [[ -n $EDITOR && $BUFFER = $EDITOR\ * ]]; then
        __sudo-replace-buffer "$EDITOR" "sudoedit"
    elif [[ -n $EDITOR && $BUFFER = \$EDITOR\ * ]]; then
        __sudo-replace-buffer "\$EDITOR" "sudoedit"
    elif [[ $BUFFER = sudoedit\ * ]]; then
        __sudo-replace-buffer "sudoedit" "$EDITOR"
    elif [[ $BUFFER = sudo\ * ]]; then
        __sudo-replace-buffer "sudo" ""
    else
        LBUFFER="sudo $LBUFFER"
    fi
    LBUFFER="${WHITESPACE}${LBUFFER}"
}
zle -N sudo-command-line
# Defined shortcut keys: [Esc] [Esc]
bindkey -M emacs '\e\e' sudo-command-line
bindkey -M vicmd '\e\e' sudo-command-line
bindkey -M viins '\e\e' sudo-command-line

