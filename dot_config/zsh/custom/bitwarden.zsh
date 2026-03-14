bwunlock() {
  export BW_SESSION=$(bw unlock --raw)
}

bwlock() {
  bw lock
  unset BW_SESSION
}

