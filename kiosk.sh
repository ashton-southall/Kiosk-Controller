#!/bin/bash

# Run system updates
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y

# Install Dependencies 

if ! command -v screen &> /dev/null
then
    echo "screen could not be found, Installing"
    sudo apt install screen -y
fi

if ! command -v git &> /dev/null
then
    echo "git could not be found, Installing"
    sudo apt install git -y
fi

# Pull latest release from github to be used on next launch
git pull

# Adjust this URL to display a webpage
url="https://airbridge.net.au"

# Open chromium with specified URL in Kiosk Mode
screen -dmS abwd bash -c "DISPLAY=:0 chromium-browser --kiosk $url"
