#!/bin/bash
echo "Clone ...."
git clone https://github.com/Stunkymonkey/nautilus-open-any-terminal.git
echo "Quit nautilus"
nautilus -q
echo "Cd... && Install extension"
cd nautilus-open-any-terminal
#./tools/update-extension-user.sh install    # for a user install
sudo tools/update-extension-system.sh install  # for a system-wide install
echo "Setting Extension"
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal terminator
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal keybindings '<Ctrl><Alt>t'
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal new-tab false


#Uninstall
#./tools/update-extension-user.sh uninstall    # for a user uninstall
#sudo tools/update-extension-system.sh uninstall  # for a system-wide uninstall
