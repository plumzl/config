
# echo -e '\033[36mhell\033[m'

function __prompt_jobs() {
    local color_procs=""
    local stopped_procs="$(jobs | awk '{ if ($2 ~ /Stopped/) print $3"^Z"}')"
    local running_procs="$(jobs | awk '{ if ($2 ~ /Running/) print $3"&"}')"
    for proc in $stopped_procs
    do
        color_procs="$color_procs\[\e[31m\]$proc "
    done
    for proc in $running_procs
    do
        color_procs="$color_procs\[\e[32m\]$proc "
    done
    echo $color_procs
}

function __set_prompt() {
    local job_info="$(__prompt_jobs)"
    export PS1="\[\e[32m\]\h: \[\e[38;5;8m\]\w/ $job_info\n\[\e[38;5;15m\]\$\[\e[38;5;7m\] "
}

__set_prompt
