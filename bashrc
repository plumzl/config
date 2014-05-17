# Get the platform
platform=`uname`

[[ -f "$HOME/.bash/aliases.bash" ]] && source "$HOME/.bash/aliases.bash"
[[ -f "$HOME/.bash/prompt.bash" ]] && source "$HOME/.bash/prompt.bash"
[[ -f "$HOME/.bash/color.bash" ]] && source "$HOME/.bash/color.bash"

# PATH
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/scripts:$PATH"
export PATH=/opt/bin:/opt/local/bin:$PATH
# Add scala to the path
export PATH=$PATH:$HOME/src/sbt/bin
export PATH=$PATH:$HOME/src/scala/bin
# Add rvm path
export PATH=$PATH:$HOME/.rvm/bin

# Load RVM function
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Set the ls output color
if [[ $platform == 'Darwin' ]]; then
    export LSCOLORS="exgxfxdxcxfxFxFxbxexex"
elif [[ $platform == 'Linux' ]]; then
    export LS_COLORS="fi=37:di=34:ow=34:or=31:ln=36:ex=32:mi=31:su=07"
fi

export PDSH_SSH_ARGS_APPEND="-A -q -o StrictHostKeyChecking=no -o ConnectTimeout=8 -o NumberOfPasswordPrompts=0 -o PasswordAuthentication=no"
export PDSH_RCMD_TYPE=ssh


