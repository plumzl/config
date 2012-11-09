# echo -e '\033[36mhell\033[m'
function __prompt_jobs() {
    # local procs="$(jobs | awk \'""{ if \(\$2 ~ /"$1"/\) print \$3}\'"")"
    local procs="$(jobs | awk "{ if (\$2 ~ /$1/) print \$3 }")"
    echo $procs
}

function __set_prompt() {
    local job_info="\[\e[31m\]\$(__prompt_jobs Stopped) "
    job_info="$job_info\[\e[32m\]\$(__prompt_jobs Running)"
    export PS1="\[\e[32m\]\h: \[\e[38;5;8m\]\w/ $job_info\n\[\e[38;5;15m\]\$\[\e[38;5;7m\] "
}

__set_prompt
