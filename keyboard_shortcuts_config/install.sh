#!/bin/bash

set -e

echo "Installing Keyboard Shortcuts ..."

echo "Setting screenshot bindings ..."
gsettings set org.gnome.settings-daemon.plugins.media-keys screenshot ''
gsettings set org.gnome.settings-daemon.plugins.media-keys window-screenshot ''
gsettings set org.gnome.settings-daemon.plugins.media-keys area-screenshot ''
gsettings set org.gnome.settings-daemon.plugins.media-keys screencast ''
gsettings set org.gnome.settings-daemon.plugins.media-keys screenshot-clip 'Print'
gsettings set org.gnome.settings-daemon.plugins.media-keys window-screenshot-clip '<Alt>Print'
gsettings set org.gnome.settings-daemon.plugins.media-keys area-screenshot-clip '<Shift>Print'

echo "Done"
