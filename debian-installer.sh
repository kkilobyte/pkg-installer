#!/bin/bash
# print repo and varient
echo kkilobyte/pkg-installer 
echo Debian varient
echo

# check to make sure the script is ran as sudo or root
if [[ $(id -u) -ne 0 ]]; then
    echo "This script must be run as root or with sudo."
    exit 1
fi

# ask the user to confirm their distro
read -p "Are you sure you are using Debian or any of it's derivatives? (y/N) " debian_check

# exit the script if they are not using chromium
echo
if [[ "$debian_check" == "y" || "$debian_check" == "Y" ]]; then
    echo "Continuing..."
elif [[ "$debian_check" == "n" || "$debian_check" == "N" ]]; then
    echo "Exiting..."
    exit 1
else
    echo "Exiting..."
fi

# ask the user to confirm they want to continue
echo
read -p "Do you wish to continue? (y/N) " consent

# exit the script if they don't
if [[ "$consent" == "y" || "$consent" == "Y" ]]; then
    echo "Continuing..."
elif [[ "$consent" == "n" || "$consent" == "N" ]]; then
    echo "Exiting..."
    exit 1
else
    echo "Exiting..."
fi

# begin fastfetch installation
echo
echo 'Beginning "fastfetch" installation.'
mkdir -vp cache/debian/fastfetch/
# we must find a method to make sure we always get the latest version without having to modify this script
curl -Lk https://github.com/fastfetch-cli/fastfetch/releases/download/2.24.0/fastfetch-linux-amd64.deb -o cache/debian/fastfetch.deb
apt install ./cache/debian/fastfetch.deb
echo
echo "Installation of fastfetch finished."
echo
fastfetch

# begin google-chrome-stable install
echo
echo "Beginning google-chrome-stable installation."
mkdir -vp cache/debian/google-chrome-stable/
curl -Lk https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -o cache/debian/google-chrome-stable/chrome.deb
apt install ./cache/debian/google-chrome-stable/chrome.deb
echo "Installation of google-chrome-stable finished."
echo
