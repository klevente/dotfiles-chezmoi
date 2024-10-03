if [ -f "$HOME/.cargo/env" ]; then
    source "$HOME/.cargo/env"
fi

alias c='cargo'
alias ct='cargo t'
alias cr='cargo r'
alias ccc='cargo c'
alias ccl='cargo clippy --all --tests -- -D clippy::all -d warnings'
