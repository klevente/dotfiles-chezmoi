#!/bin/sh

BRANCH=$(git -C $1 rev-parse --abbrev-ref HEAD)

if [ $? -eq 0 ]; then
	max_length=$(tmux show-option -gv status-right-length)
	# ellipsis="..."
	ellipsis="…"
	ellipsis_length=${#ellipsis}
	if [ ${#BRANCH} -gt $((max_length - ellipsis_length - 2)) ]; then
		truncated_branch="${BRANCH:0:$((max_length - ellipsis_length - 2))}$ellipsis"
	else
		truncated_branch="$BRANCH"
	fi
	echo " $truncated_branch "
else
	echo ""
fi
