#!/bin/sh

TARGET="$HOME/.zshenv"
SOURCE="$HOME/.config/zsh/.zshenv"

if [ -L "$TARGET" ]; then
	echo "~/.zshenv symlink already exists, skipping."
elif [ -e "$TARGET" ]; then
	echo "~/.zshenv already exists, but is not a symlink, skipping (you might need to delete it)."
else
	ln -s "$SOURCE" "$TARGET"
	echo "Created symlink: $SOURCE -> $TARGET"
fi
