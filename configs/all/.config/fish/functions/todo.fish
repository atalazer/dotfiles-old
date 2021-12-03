function todo
    if not test -f $TODO
        touch $TODO
        echo "$TODO Created"
    else
        set --local OPT $argv[1]
        switch $OPT
            case "-e" or "--edit"
                $EDITOR $TODO
            case "-s" or "--show"
                if command -v "bat" &> /dev/null
                    bat --paging=never $TODO
                else
                    cat $TODO
                end
            case "-h" or "--help" or "*"
                echo "Command:"
                echo "-e --edit Edit TODO file"
                echo "-s --show Show TODO"
                echo "-h --help Show available command"
        end
    end
end

