[[ -f "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases"
[[ -f "$HOME/.bash/prompt.bash" ]] && source "$HOME/.bash/prompt.bash"

export PATH="$HOME/bin:$PATH"
export PATH="$HOME/scripts:$PATH"
export LSCOLORS="exgxfxdxcxfxFxFxbxexex"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM function
