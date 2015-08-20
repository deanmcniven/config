#!/bin/bash

set -e

promptForResponse() {
    local question="$1"
    read -p "$question: " raw_response
    local response=`echo $raw_response | tr -d '\n'`
    echo $response
}

promptYesNo() {
    local question="$1"
    local response=$(promptForResponse "$question (y/n)")

    if [[ $response =~ ^[yY]$ ]]; then
        echo true
    else
        echo false
    fi
}

promptWithConfirm() {
    local question="$1"
    local response=""

    while [[ "$response" == "" ]]; do
        local unconfirmedResp=$(promptForResponse "$question")
        local keep=$(promptYesNo "Confirm value was '$unconfirmedResp'?")
        if [[ $keep == "true" ]]; then
            response=$unconfirmedResp
        fi
    done

    echo $response
}

# Cleanup Old installation
echo "Cleaning up old installations (if any) ..."
if [[ -f ~/.gitconfig ]]; then
    rm ~/.gitconfig
fi

echo "Installing git"
installState=$( dpkg -s git | grep Status )
if [[ ! "$installState" == "Status: install ok installed" ]]; then
    sudo apt-get install git
fi

# Install tmux conf
echo "Installing gitconfig ..."
cp dot_prefixed/gitconfig ~/.gitconfig
chmod 664 ~/.gitconfig

# Check if user wants to set global git user info
doGlobalConf=$(promptYesNo "Do you want to set the Global Git user + email?")
if [[ "$doGlobalConf" == "true" ]]; then
    username=$(promptWithConfirm "Git username")
    email=$(promptWithConfirm "Git user email address")
    gitTag="[user]"
    gitName="    name = $username"
    gitEmail="    email = $email"

    echo "$gitTag" >> ~/.gitconfig
    echo "$gitName" >> ~/.gitconfig
    echo "$gitEmail" >> ~/.gitconfig
fi

echo "Done"
