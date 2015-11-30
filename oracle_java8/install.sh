#!/bin/bash

set -e

echo "Webupd8team Java8 Repo"
sudo add-apt-repository ppa:webupd8team/java

echo "Installing Java8"
sudo apt-get update
sudo apt-get install oracle-java8-installer

echo "Done"
