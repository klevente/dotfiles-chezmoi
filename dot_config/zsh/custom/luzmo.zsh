alias dcl='docker compose --profile frontend'
alias dclb='docker compose --profile frontend build'
alias luzmo-docker-no-qe2='docker compose --profile frontend up -d --scale qe2=0'
alias luzmo-docker-no-qe2-be='docker compose --profile frontend --env-file .env --env-file .env.be.local up -d --scale qe2=0'
