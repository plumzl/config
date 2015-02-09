# Get the platform
platform=`uname`

# Source sub bash scripts
for file in `ls -d $HOME/.bash/*`
do
    source $file
done

# PATH
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/scripts:$PATH"
# Add scala to the path
[[ -d $HOME/src/sbt/bin ]] && export PATH=$PATH:$HOME/src/sbt/bin
[[ -d $HOME/src/scala/bin ]] && export PATH=$PATH:$HOME/src/scala/bin

# Load RVM function
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Platform dependent settings
if [[ $platform == 'Darwin' ]]; then
    export LSCOLORS="exgxfxdxcxfxFxFxbxexex"
    export PATH=/opt/bin:/opt/local/bin:$PATH
elif [[ $platform == 'Linux' ]]; then
    export LS_COLORS="fi=37:di=34:ow=34:or=31:ln=36:ex=32:mi=31:su=07"
fi

# ssh settings
export PDSH_SSH_ARGS_APPEND="-A -q -o StrictHostKeyChecking=no -o ConnectTimeout=8 -o NumberOfPasswordPrompts=0 -o PasswordAuthentication=no"
export PDSH_RCMD_TYPE=ssh


# SSH-AGENT
# http://mah.everybody.org/docs/ssh
SSH_ENV="$HOME/.ssh/environment"

function start_agent {
     echo "Initialising new SSH agent..."
     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
     echo succeeded
     chmod 600 "${SSH_ENV}"
     . "${SSH_ENV}" > /dev/null
     /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null
     #ps ${SSH_AGENT_PID} doesn't work under cywgin
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
         start_agent;
     }
else
     start_agent;
fi
