#!/bin/bash

set -e

echo "Cleaning up old installations (if any) ..."
if [[ -f ~/.vimrc ]]; then
    rm -rf ~/.vimrc
fi

if [[ -d ~/.vim ]]; then
    rm -rf ~/.vim
fi

echo "Installing deps ..."
set +e
installState=$( dpkg -s vim | grep Status )
set -e
if [[ ! "$installState" == "Status: install ok installed" ]]; then
    sudo apt-get install vim
fi
set +e
installState=$( dpkg -s curl | grep Status )
set -e
if [[ ! "$installState" == "Status: install ok installed" ]]; then
    sudo apt-get install curl
fi

echo "Installing Pathogen ..."
mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

echo "Installing NERDtree ..."
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree

echo "Installing vimrc ..."
cp dot_prefixed/vimrc ~/.vimrc
chmod 777 ~/.vimrc

echo "Done"
