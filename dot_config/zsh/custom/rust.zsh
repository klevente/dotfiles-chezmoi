if [ -f "$HOME/.cargo/env" ]; then
    source "$HOME/.cargo/env"
fi

alias c='cargo'
alias cb='cargo b'
alias ct='cargo t'
alias ctn='cargo t -- --nocapture'
alias cr='cargo r'
alias ccc='cargo c'
alias ccl='cargo clippy --all --tests -- -D clippy::all -D warnings'
