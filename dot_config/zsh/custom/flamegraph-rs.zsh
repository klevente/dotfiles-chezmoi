#compdef flamegraph

autoload -U is-at-least

_flamegraph() {
    typeset -A opt_args
    typeset -a _arguments_options
    local ret=1

    if is-at-least 5.2; then
        _arguments_options=(-s -S -C)
    else
        _arguments_options=(-s -C)
    fi

    local context curcontext="$curcontext" state line
    _arguments "${_arguments_options[@]}" \
'-p+[Profile a running process by pid]:PID: ' \
'--pid=[Profile a running process by pid]:PID: ' \
'--completions=[Generate shell completions for the given shell]:SHELL:(bash elvish fish powershell zsh)' \
'-o+[Output file]:OUTPUT:_files' \
'--output=[Output file]:OUTPUT:_files' \
'--root=[Run with root privileges (using \`sudo\`). Accepts an optional argument containing command line options which will be passed to sudo]' \
'-F+[Sampling frequency]:FREQUENCY: ' \
'--freq=[Sampling frequency]:FREQUENCY: ' \
'-c+[Custom command for invoking perf/dtrace]:CUSTOM_CMD: ' \
'--cmd=[Custom command for invoking perf/dtrace]:CUSTOM_CMD: ' \
'--notes=[Set embedded notes in SVG]:STRING: ' \
'--min-width=[Omit functions smaller than <FLOAT> pixels]:FLOAT: ' \
'--image-width=[Image width in pixels]:IMAGE_WIDTH: ' \
'--palette=[Color palette]:PALETTE:(aqua blue green hot io java js mem orange perl python purple red rust wakeup yellow)' \
'*--skip-after=[Cut off stack frames below <FUNCTION>; may be repeated]:FUNCTION: ' \
'--post-process=[Run a command to process the folded stacks, taking the input from stdin and outputting to stdout]:POST_PROCESS: ' \
'(-p --pid)--perfdata=[]:PERF_FILE:_files' \
'-v[Print extra output to help debug problems]' \
'--verbose[Print extra output to help debug problems]' \
'--open[Open the output .svg file with default program]' \
'--deterministic[Colors are selected such that the color of a function does not change between runs]' \
'-i[Plot the flame graph up-side-down]' \
'--inverted[Plot the flame graph up-side-down]' \
'--reverse[Generate stack-reversed flame graph]' \
'(--reverse)--flamechart[Produce a flame chart (sort by time, do not merge stacks)]' \
'--ignore-status[Ignores perf'\''s exit code]' \
'--no-inline[Disable inlining for perf script because of performance issues]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
'*::trailing_arguments:' \
&& ret=0
}

(( $+functions[_flamegraph_commands] )) ||
_flamegraph_commands() {
    local commands; commands=()
    _describe -t commands 'flamegraph commands' commands "$@"
}

if [ "$funcstack[1]" = "_flamegraph" ]; then
    _flamegraph "$@"
else
    compdef _flamegraph flamegraph
fi
