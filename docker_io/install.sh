#!/bin/bash

set -e

echo "Install Docker IO"
wget -qO- https://get.docker.com/ | sh

echo "Install Docker compose"
sudo apt-get install --assume-yes docker-compose

echo "Done"
