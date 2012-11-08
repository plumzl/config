source $HOME/.bash_aliases
source $HOME/.bash/prompt.bash

export PATH="$HOME/bin:$PATH"
# export PS1='\[\e[32m\]\h: \[\e[38;5;8m\]\w/\n\[\e[38;5;15m\]\$\[\e[38;5;7m\] '
export LSCOLORS="exGxadadcxbxbxdxdxbxex"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
