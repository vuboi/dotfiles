#!/bin/bash
. /etc/os-release
sudo echo "YOUR OS COMPUTER IS $ID AND BASE IN $ID_LIKE"
echo "Install color terminal forlder"
if [[ $ID_LIKE = "ubuntu" ]]; then 
#ubuntu
  sudo apt install ruby ruby-dev git --assume-yes
  sudo gem install colorls --assume-yes
elif [[ $ID_LIKE = "arch" ]]; then 
  yes | sudo pacman -S ruby git
  yes | sudo gem install colorls 
fi;
echo "Install color complete!"
#arch