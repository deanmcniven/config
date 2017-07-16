#!/bin/bash

set -e

if [[ `whoami` != "root" ]]; then
    echo "Script must be run as root!"
    sudo $0
    exit 0
fi

echo "Cleanup old installations (if any) ..."
if [[ -f /etc/profile.d/synaptics-custom-settings.sh ]]; then
    rm /etc/profile.d/synaptics-custom-settings.sh
fi

echo "Installing deps ..."
installState=$( dpkg -s xserver-xorg-input-synaptics-hwe-16.04 | grep Status )
if [[ ! "$installState" == "Status: install ok installed" ]]; then
    apt-get install xserver-xorg-input-synaptics-hwe-16.04
fi

echo "Installing script ..."
cp files/synaptics-custom-settings.sh /etc/profile.d/synaptics-custom-settings.sh
chmod 755 /etc/profile.d/synaptics-custom-settings.sh

echo "Running script ..."
/bin/bash /etc/profile.d/synaptics-custom-settings.sh

echo "Done"
