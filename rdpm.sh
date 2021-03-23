#! /bin/bash
printf ' edited by sai \n'
printf "RDP installing... " >&2
{
sudo useradd -m crm1919
sudo adduser crm1919 sudo
echo 'crm1919:1234' | sudo chpasswd
sed -i 's/\/bin\/sh/\/bin\/bash/g' /etc/passwd
sudo apt-get update
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo dpkg --install chrome-remote-desktop_current_amd64.deb
sudo apt install --assume-yes --fix-broken
sudo DEBIAN_FRONTEND=noninteractive \
apt install --assume-yes xfce4 desktop-base
sudo bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'  
sudo apt install firefox -y
sudo apt install falkon -y
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg --install google-chrome-stable_current_amd64.deb
sudo apt install --assume-yes --fix-broken
sudo adduser crm1919 chrome-remote-desktop
} &> /dev/null &&
printf "\nSetup Completed " >&2 ||
printf "\nError Occured " >&2
printf '\nGO to https://remotedesktop.google.com/headless  Copy Command Of Debian Linux And Paste Down\n'
read -p "Paste Here: " CRP
su - crm1919 -c """$CRP"""
printf 'Your SUDO Password Is 1234 \n'
