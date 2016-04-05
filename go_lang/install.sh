#!/bin/bash

set -e

echo "Cleaning up old installations (if any) ..."
if [[ -d /usr/local/go ]]; then
    sudo rm -rf /usr/local/go
    sed -i 's|export PATH=\$PATH:/usr/local/go/bin||g' ~/.profile
fi

echo "Downloading Go ..."
wget -O /tmp/go-lang.tar.gz "https://storage.googleapis.com/golang/go1.6.linux-amd64.tar.gz"

echo "Installing GO ..."
sudo tar -C /usr/local -xzf /tmp/go-lang.tar.gz
echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.profile

echo "Done"
