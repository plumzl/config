platform=`uname`

if [[ $platform == 'Linux' ]]; then
    alias ls='ls --color=auto'
elif [[ $platform == 'Darwin' ]]; then
    alias ls='ls -G'
fi
