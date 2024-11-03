#!/bin/sh

# Also need: gitmux - https://github.com/arl/gitmux
PLUGINS_DIR="$HOME/.config/tmux/plugins"

if [ ! -d "$PLUGINS_DIR" ]; then
	echo "Setting up TMUX plugins."
	mkdir -p "$PLUGINS_DIR"
	git clone https://github.com/tmux-plugins/tpm "$PLUGINS_DIR/tpm"
	$PLUGINS_DIR/tpm/bin/install_plugins
else
	echo "TMUX plugins are already set up, skipping."
fi
