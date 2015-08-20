#!/bin/bash

set -e

echo "Cleanup old installations (if any) ..."
if [[ -f ~/.config/autostart/.synaptics-custom-settings.sh.desktop ]]; then
    rm ~/.config/autostart/.synaptics-custom-settings.sh.desktop
fi
if [[ -f ~/.synaptics-custom-settings.sh ]]; then
    rm ~/.synaptics-custom-settings.sh
fi

echo "Installing deps ..."
installState=$( dpkg -s xserver-xorg-input-synaptics | grep Status )
if [[ ! "$installState" == "Status: install ok installed" ]]; then
    sudo apt-get install xserver-xorg-input-synaptics
fi

echo "Installing script ..."
mkdir -p ~/.config/autostart
cp dot_prefixed/synaptics-custom-settings.sh.desktop ~/.config/autostart/.synaptics-custom-settings.sh.desktop
cp dot_prefixed/synaptics-custom-settings.sh ~/.synaptics-custom-settings.sh
chmod 775 ~/.synaptics-custom-settings.sh
chmod 664 ~/.config/autostart/.synaptics-custom-settings.sh.desktop

echo "Configuring script ..."
homeDir=$( echo ~ )
sed -i "s#Exec=#Exec=$homeDir/.synaptics-custom-settings.sh#g" ~/.config/autostart/.synaptics-custom-settings.sh.desktop

echo "Running script ..."
/bin/bash ~/.synaptics-custom-settings.sh

echo "Done"
