function path
    set options $options (fish_opt -s a -l add --required-val)
    set options $options (fish_opt -s d -l delete --required-val)
    set options $options (fish_opt -s h -l help)

    argparse $options -- $argv

    if set -q _flag_help
        printf "\n%s\n" "Usage: path [options] [path]"

        printf "\n%s\n" "Options:"
        printf "%s\t%s\n" "-h, --help" "Show this help message and exit"
        printf "%s\t%s\n" "-a, --add" "Append path to PATH"
        printf "%s\t%s\n" "-d, --delete" "Delete path from PATH"
        return
    end

    if set -q _flag_add
        if not contains $_flag_add $PATH
            set -U fish_user_paths $_flag_add $fish_user_paths
            echo "Updated PATH: $PATH"
        else
            echo "$_flag_add is alredy in PATH: $PATH"
        end
        return
    end

    if set -q _flag_delete
        if set -l index (contains -i $_flag_delete $PATH)
            set --erase --universal fish_user_paths[$index]
            echo "Updated PATH: $PATH"
        else
            echo "$_flag_delete not found in PATH: $PATH"
        end
        return
    end

    echo "PATH: $PATH"
end
