function e --wraps='/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code' --description 'alias code /Applications/Visual Studio Code.app/Contents/Resources/app/bin/code'
    if count $argv >/dev/null
        set location $argv
    else
        set location $PWD
    end

    /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code $location
end
