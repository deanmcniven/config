#!/bin/bash

set -e

# Cleanup Old installation
echo "Cleaning up old installations (if any) ..."
if [[ -f ~/.tmux.conf ]]; then
    rm ~/.tmux.conf
fi

echo "Installing tmux"
installState=$( dpkg -s tmux | grep Status )
if [[ ! "$installState" == "Status: install ok installed" ]]; then
    sudo apt-get install tmux
fi

# Install tmux conf
echo "Installing tmux.conf ..."
cp dot_prefixed/tmux.conf ~/.tmux.conf
chmod 777 ~/.tmux.conf

echo "Setting tmux keyboard shortcut ..."
gsettings set org.gnome.settings-daemon.plugins.media-keys terminal ''
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'tmux'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command "gnome-terminal -e 'tmux'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Primary><Alt>t'

echo "Done"
