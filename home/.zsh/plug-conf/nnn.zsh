#export LC_COLLATE="C"
#export NNN_OPTS="cEnrx"

export NNN_TRASH=1
export NNN_OPENER="/usr/bin/xdg-open"
export NNN_SEL='/tmp/.sel'
export NNN_FIFO=/tmp/nnn.fifo

export NNN_BMS="a:~/linux/apps;b:~/backup;c:~/.config;d:~/.dotfiles;g:~/github;p:~/programming;w:~/linux/wiki;"

export NNN_PLUG="1:treeview;b:bookmarks;B:bulknew;d:dragdrop;G:getplugs;i:imgview;k:kdeconnect;m:mediainf;M:mimelist;o:fzopen;O:organize;p:preview-tui;R:renamer;s:splitjoin;S:suedit;v:vidthumb;w:wall;z:autojump;"
export NNN_ARCHIVE="\\.(7z|a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|jar|lha|lz|lzh|lzma|lzo|rar|rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip)$"

# nnn with Quit on cd
qnnn () {
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "export" as in:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    # NOTE: NNN_TMPFILE is fixed, should not be modified
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

# NNN Preview
pnnn () {
    # Block nesting of nnn in subshells
    if [ -n "$NNNLVL" ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi
    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "export" as in:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    # NOTE: NNN_TMPFILE is fixed, should not be modified
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    # This will create a fifo where all nnn selections will be written to
    NNN_FIFO="$(mktemp --suffix=-nnn -u)"
    export NNN_FIFO
    (umask 077; mkfifo "$NNN_FIFO")
    # Preview command
    preview_cmd="~/.config/nnn/preview_cmd.sh"
    # Use `tmux` split as preview
    if [ -e "${TMUX%%,*}" ]; then
        tmux split-window -e "NNN_FIFO=$NNN_FIFO" -dh "$preview_cmd"
    # Use `xterm` as a preview window
    elif (which xterm &> /dev/null); then
        xterm -e "$preview_cmd" &
    # Unable to find a program to use as a preview window
    else
        echo "unable to open preview, please install tmux or xterm"
    fi
    nnn "$@"
    /bin/rm -f "$NNN_FIFO"
}

# -------------------------------------
# NNN File Manager
# -------------------------------------
alias fm=nnn
alias {fmcd,fmq}=qnnn
alias fmp=pnnn

