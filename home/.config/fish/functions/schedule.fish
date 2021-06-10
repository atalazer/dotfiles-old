function schedule
    if not test -f $SCHEDULE
        touch $SCHEDULE
        echo "$SCHEDULE Created"
    else
        set --local OPT $argv[1]
        switch $OPT
            case "-e" or "--edit"
                $EDITOR $SCHEDULE
            case "-s" or "--show"
                if command -v "glow" &> /dev/null
                    glow $SCHEDULE
                else if command -v "bat" &> /dev/null
                    bat --paging=never $SCHEDULE
                else
                    cat $SCHEDULE
                end
            case "-h" or "--help" or "*"
                echo "Command:"
                echo "-e --edit Edit SCHEDULE file"
                echo "-s --show Show SCHEDULE"
                echo "-h --help Show available command"
        end
    end
end
