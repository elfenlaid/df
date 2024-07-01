eval (/opt/homebrew/bin/brew shellenv)

alias w='cd ~/Work'
alias c='cd ~/Code'
alias d='cd ~/Downloads'

alias x='xed .'
alias rx='rip-xed'

alias js="jj st"
alias jd="jj diff"
alias jl="jj log -r \"main--..mine()\""

alias gs='git status --short --branch'
alias gd='git diff'
alias gc='git checkout'
alias gcd='git checkout develop'
alias gcm='git checkout main'
alias gp='git pull'
alias lg='lazygit'

if test -d ~/.cfg/
    alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
end

if test -d ~/.myconf/
    alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
end

alias yard='yarn'
alias vim='nvim'

alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"

source /opt/homebrew/opt/asdf/libexec/asdf.fish

set -x KERL_BUILD_DOCS yes
set -x KERL_INSTALL_MANPAGES yes
set -x KERL_INSTALL_HTMLDOCS yes
set -x KERL_DOC_TARGETS chunks
set -x KERL_CONFIGURE_OPTIONS "--disable-hipe --without-javac --without-odbc --enable-wx --with-wx-config=/opt/homebrew/bin/wx-config"
set -x ERL_AFLAGS "-kernel shell_history enabled"
set -x CFLAGS "-O2 -g -fno-stack-check"

set -gx PATH "$GEM_HOME/bin" $PATH

jump shell fish | source
jj util completion fish | source
