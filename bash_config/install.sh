#!/bin/bash

set -e

# Cleanup Old installation
echo "Cleaning up old installations (if any) ..."
if [[ -f ~/.bash_aliases ]]; then
    rm ~/.bash_aliases
fi

# Install tmux conf
echo "Installing bash_aliases ..."
cp dot_prefixed/bash_aliases ~/.bash_aliases
chmod 777 ~/.bash_aliases

echo "Done"
