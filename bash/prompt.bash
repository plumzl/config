function __prompt_jobs() {
    local procs="$(jobs | awk "{ if (\$2 ~ /$1/) print \$3}")"
    echo $procs
}

function __prompt_git() {
    branch="$(git symbolic-ref HEAD 2>/dev/null)" || branch="$(git reflog 2>/dev/null | head -n 1 | awk -F' ' '{ print $1 }')"
    branch=${branch##refs/heads/}
    if [ -n "$branch" ]; then
        branch=[$branch]
    fi
    echo $branch
}

function __set_prompt() {
    local branch="\[\e[33m\]\$(__prompt_git)"
    local job_info="\[\e[31m\]\$(__prompt_jobs Stopped)\[\e[m\] "
    job_info="$job_info\[\e[32m\]\$(__prompt_jobs Running)"
    export PS1="\[\e[32m\]\h: \[\e[38;5;15m\]\w/ $branch\[\e[m\] $job_info\[\e[m\]\n\[\e[38;5;15m\]\$\[\e[m\] "
}

__set_prompt
