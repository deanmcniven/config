#!/bin/bash

set -e

echo "Build Essential"
sudo apt-get install --assume-yes build-essential

echo "VLC"
sudo apt-get install --assume-yes vlc

echo "GNU awk"
sudo apt-get install --assume-yes gawk

echo "Meld"
sudo apt-get install --assume-yes meld

echo "Git"
sudo apt-get install --assume-yes git

echo "Dia"
sudo apt-get install --assume-yes dia

echo "Done"
