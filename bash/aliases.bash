platform=`uname`

if [[ $platform == 'Linux' ]]; then
    alias ls='ls --color=auto'
elif [[ $platform == 'Darwin' ]]; then
    alias ls='ls -G'
fi

alias rgrep="grep -RIn --exclude-dir=.git"
# tmux
alias tmux="TERM=screen-256color-bce tmux"
