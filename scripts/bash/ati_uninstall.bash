#! /bin/bash

# We are removing ATI DRIVERS
sudo sh /usr/share/ati/fglrx-uninstall.sh
sudo apt-get -y remove --purge fglrx fglrx_* fglrx-amdcccle* fglrx-dev*

# Since ATI overwrite some important files, we must purge the config and reinstall opensource  
# drivers MESA to have the desktop working fast again with slight acceleration anyway.
sudo apt-get --force-yes remove --purge xserver-xorg-video-ati xserver-xorg-video-radeon
sudo apt-get --force-yes install xserver-xorg-video-ati
sudo apt-get --force-yes install --reinstall libgl1-mesa-glx libgl1-mesa-dri xserver-xorg-core
sudo mv /etc/X11/xorg.conf /etc/X11/xorg.conf.backup
sudo rm -rf /etc/ati
