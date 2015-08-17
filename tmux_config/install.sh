#!/bin/bash

set -e

# Cleanup Old installation
echo "Cleaning up old installations (if any) ..."
if [[ -f ~/.tmux.conf ]]; then
    rm ~/.tmux.conf
fi

# Install tmux conf
echo "Installing tmux.conf ..."
cp dot_prefixed/tmux.conf ~/.tmux.conf
chmod 777 ~/.tmux.conf

echo "Done"
