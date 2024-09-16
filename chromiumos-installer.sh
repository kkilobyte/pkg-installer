#!/bin/bash
# print repo and varient
echo kkilobyte/pkg-installer 
echo ChromiumOS varient
echo

# check to make sure the script is ran as sudo or root
if [[ $(id -u) -ne 0 ]]; then
    echo "This script must be run as root or with sudo. Use vt2 or crew-sudo if sudo gives an error."
    exit 1
fi

# ask the user to confirm their distro
read -p "Are you sure you are using ChromiumOS or any of it's derivatives? (y/N) " chromium_check

# exit the script if they are not using chromium
echo
if [[ "$chromium_check" == "y" || "$chromium_check" == "Y" ]]; then
    echo "Continuing..."
elif [[ "$chromium_check" == "n" || "$chromium_check" == "N" ]]; then
    echo "Exiting..."
    exit 1
else
    echo "Exiting..."
fi

# ask the user to confirm they have crew
echo
read -p "Do you have Chromebrew installed? (y/N) " crew_check

# exit the script if they are dont have crew
if [[ "$crew_check" == "y" || "$crew_check" == "Y" ]]; then
    echo "Continuing..."
elif [[ "$crew_check" == "n" || "$crew_check" == "N" ]]; then
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
echo "Beginning fastfetch installation."
mkdir -vp cache/chromium/fastfetch/
# we must find a method to make sure we always get the latest version without having to modify this script
curl -Lk http://github.com/fastfetch-cli/fastfetch/releases/download/2.24.0/fastfetch-linux-amd64.zip -o cache/chromium/fastfetch.zip
unzip -o cache/chromium/fastfetch.zip -d cache/chromium/fastfetch/
mv -v cache/chromium/fastfetch/usr/bin/* /usr/local/bin
mv -v cache/chromium/fastfetch/usr/share/* /usr/local/share
echo
echo "Installation of fastfetch finished."
echo
fastfetch

# google-chrome-stable would normally be here but chromeOS liteally has chrome as the DE
# vesktop would also normally be here but chromeOS is better with PWAs and crostini users should use the debian installer 

# exit the script
exit 0