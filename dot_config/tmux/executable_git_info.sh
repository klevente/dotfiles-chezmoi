#!/bin/sh

BRANCH=$(git -C $1 rev-parse --abbrev-ref HEAD)

if [ $? -eq 0 ]; then
	echo " $BRANCH "
else
	echo ""
fi
