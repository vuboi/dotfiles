#!/bin/bash
# if [[ $EUID -ne 0 ]]; then
#    echo "THIS SCRIPT MUST BE RUN AS ROOT, USE SUDO "$0" INSTEAD" 1>&2
#    exit 1
# fi
. /etc/os-release
sudo echo "YOUR OS COMPUTER IS $ID AND BASE IN $ID_LIKE"
echo "============================== START =============================="
if [ -d tmp ]; then
  echo "PROCESSING: EXIT FOLDER TMP..."
  rm -rf ./tmp
  echo "PROCESSING: REMOVE FOLDER TMP..."
  mkdir ./tmp && cd ./tmp
  echo "PROCESSING: CD FOLDER TMP..."
else 
  mkdir ./tmp && cd ./tmp
fi

if [[ $ID_LIKE = "arch" ]]; then
  sudo pacman -Syy
  sudo pacman -S --needed base-devel 
#--Git--
  echo "============================== INSTALLING GIT =============================="
  yes | sudo pacman -S git &&
  echo "PROCESSING: INSTALLING GIT DONE..."
#--Google Chrome--
  echo "============================== INSTALLING GOOGLE CHROME =============================="
  git clone https://aur.archlinux.org/google-chrome.git &&
  cd google-chrome &&
  yes | makepkg -si &&
  echo "PROCESSING: INSTALLING GOOGLE CHROME DONE..."
#--Visual Studio Code--
  echo "============================== INSTALLING VISTUAL CODE =============================="
  git clone https://aur.archlinux.org/visual-studio-code-bin.git &&
  cd visual-studio-code-bin &&
  yes | makepkg -si &&
  echo "PROCESSING: INSTALLING VISTUAL CODE DONE..."
#--Ulauncher--
  echo "============================== INSTALLING ULAUNCHER =============================="
  git clone https://aur.archlinux.org/ulauncher.git &&
  cd ulauncher &&
  yes | makepkg -si &&
  echo "PROCESSING: INSTALLING ULAUNCHER DONE..."
#--Yay--
  echo "============================== INSTALLING YAY =============================="
  git clone https://aur.archlinux.org/yay.git &&
  cd yay &&
  yes | makepkg -si &&
  echo "PROCESSING: INSTALLING YAY DONE..."
#--Wget--
  echo "============================== INSTALLING WGET =============================="
  yes | sudo pacman -S wget &&
  echo "PROCESSING: INSTALLING WGET DONE..."
#--Curl--
  echo "============================== INSTALLING CURL =============================="
  yes | sudo pacman -S curl &&
  echo "PROCESSING: INSTALLING CURL DONE..."
#--Zsh--
  echo "============================== INSTALLING ZSH =============================="
  yes | sudo pacman -S zsh &&
  chsh -s $(which zsh) &&
  echo "PROCESSING: INSTALLING ZSH DONE..."
#--Skype--
  echo "============================== INSTALLING SKYPE =============================="
  git clone https://aur.archlinux.org/skypeforlinux-stable-bin.git &&
  cd skypeforlinux-stable-bin &&
  yes | makepkg -si &&
  echo "PROCESSING: INSTALLING SKYPE DONE..."
#--Slack--
  echo "============================== INSTALLING SLACK =============================="
  git clone https://aur.archlinux.org/slack-desktop.git &&
  cd slack-desktop &&
  yes | makepkg -si &&
  echo "PROCESSING: INSTALLING SLACK DONE..."
#--Terminator--
  echo "============================== INSTALLING TERMINATOR =============================="
  yes | sudo pacman -S terminator &&
  echo "PROCESSING: INSTALLING TERMINATOR DONE..."
#--Neofetch--
  echo "============================== INSTALLING NEOFETCH =============================="
  yes | sudo pacman -S neofetch &&
  echo "PROCESSING: INSTALLING NEOFETCH DONE..."
#--Bashtop--
  echo "============================== INSTALLING BASHTOP =============================="
  yes | sudo pacman -S bashtop &&
  echo "PROCESSING: INSTALLING BASHTOP DONE..."
#--Neovim--
  echo "============================== INSTALLING NEOVIM =============================="
  yes | sudo pacman -S neovim &&
  git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim &&
  echo "PROCESSING: INSTALLING NEOVIM DONE..."
#--Imwheel--
  echo "============================== INSTALLING IMWHEEL =============================="
  yes | sudo pacman -S imwheel &&
  echo "PROCESSING: INSTALLING IMWHEEL DONE..."
#--fnm--
  echo "============================== INSTALLING FNM =============================="
  curl -fsSL https://fnm.vercel.app/install | bash &&
  echo "PROCESSING: INSTALLING FNM DONE..."
#--nvm-
  echo "============================== INSTALLING NVM =============================="
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash &&
  echo "PROCESSING: INSTALLING NVM DONE..."
#--Kazam--
  echo "============================== INSTALLING KAZAM =============================="
  yes | sudo pacman -S kazam &&
  echo "PROCESSING: INSTALLING KAZAM DONE..."
#--zip--
  echo "============================== INSTALLING ZIP =============================="
  yes | sudo pacman -S zip &&
  echo "PROCESSING: INSTALLING ZIP DONE..."
#--unzip--
  echo "============================== INSTALLING UNZIP =============================="
  yes | sudo pacman -S unzip &&
  echo "PROCESSING: INSTALLING UNZIP DONE..."
#--xclip--
  echo "============================== INSTALLING XCLIP =============================="
  yes | sudo pacman -S xclip &&
  echo "PROCESSING: INSTALLING XCLIP DONE..."
#--fonts--
  echo "============================== INSTALLING FONTS =============================="
  yes | sudo pacman -S ttf-meslo-nerd-font-powerlevel10k
#--font-manager--
  echo "============================== INSTALLING FONT-MANAGER =============================="
  yes | sudo pacman -S font-manager &&
  echo "PROCESSING: INSTALLING FONT-MANAGER DONE..."
#--gnome-tweaks--
  echo "============================== INSTALLING GNOME-TWEAKS =============================="
  yes | sudo pacman -S gnome-tweaks &&
  echo "PROCESSING: INSTALLING GNOME-TWEAKS DONE..."
#--LibreoOffice--
  echo "============================== INSTALLING LIBREOFFICE =============================="
  yes | sudo pacman -S libreoffice-fresh &&
  echo "PROCESSING: INSTALLING LIBREOFFICE DONE..."
#--filezilla--
  echo "============================== INSTALLING FILEZILLA =============================="
  yes | sudo pacman -S filezilla &&
  echo "PROCESSING: INSTALLING FILEZILLA DONE..."
#--smartgit--
  echo "============================== INSTALLING SMARTGIT =============================="
  yes | yay pacman -S smartgit &&
  echo "PROCESSING: INSTALLING SMARTGIT DONE..."
#--gnome-session-properties--
  echo "============================== INSTALLING GNOME-SESSION-PROPERTIES =============================="
  yes | yay pacman -S gnome-session-properties &&
  echo "PROCESSING: INSTALLING GNOME-SESSION-PROPERTIES DONE..."
#--ibus-bamboo--
  echo "============================== INSTALLING IBUS-BAMBOO =============================="
  yes | yay -S ibus-bamboo &&
  echo "PROCESSING: INSTALLING IBUS-BAMBOO DONE..."
#--cloudflare--
  echo "============================== INSTALLING CLOUDFLARE =============================="
  yes | yay -S cloudflare-warp-bin &&
  sudo systemctl enable --now warp-svc.service
  warp-cli register &&
  echo "PROCESSING: INSTALLING CLOUDFLARE DONE..."
#--open any terminal--
  echo "============================== OPEN ANY TERMINAL =============================="
  yes | yay -S nautilus-open-any-terminal &&
  gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal terminator &&
  echo "PROCESSING: OPEN ANY TERMINAL DONE..."
#--HomeBrew--
  echo "============================== INSTALLING HOMEBREW =============================="
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo "PROCESSING: INSTALLING HOMEBREW DONE..."
elif [[ $ID_LIKE = "ubuntu" ]]; then 
#--Git--
  echo "============================== INSTALLING GIT =============================="
  sudo apt install git --assume-yes
#--Wget--
  echo "============================== INSTALLING WGET =============================="
  sudo apt install wget --assume-yes
#--Curl--
  echo "============================== INSTALLING CURL =============================="
  sudo apt install curl --assume-yes
#--Google Chrome--
  sudo apt-get update &&
  echo "============================== INSTALLING GOOGLE CHROME =============================="
  if [[ $(getconf LONG_BIT) = "64" ]]; then
    echo "SYSTEM IS 64BIT" &&
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb &&
    sudo dpkg -i google-chrome-stable_current_amd64.deb
  else
    echo "SYSTEM IS 32BIT" &&
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb &&
    sudo dpkg -i google-chrome-stable_current_i386.deb
  fi
#--Visual Studio Code--
  echo "============================== INSTALLING VISTUAL CODE =============================="
  wget -O vscode.deb 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64'
  sudo dpkg -i vscode.deb
#--Skype--
  echo "============================== INSTALLING SKYPE =============================="
  wget https://go.skype.com/skypeforlinux-64.deb
  sudo dpkg -i skypeforlinux-64.deb
#--Install Font Like MacOS--
  sudo apt install fonts-inter --assume-yes
  sudo apt install gnome-tweaks --assume-yes
  sudo apt install font-manager --assume-yes
#--Zsh--
  echo "============================== INSTALLING ZSH =============================="
  sudo apt install zsh --assume-yes
  chsh -s $(which zsh)
#--Neofetch--
  echo "============================== INSTALLING NEOFETCH =============================="
  sudo apt install neofetch --assume-yes
#--Bashtop--
  echo "============================== INSTALLING BASHTOP =============================="
  sudo apt install bashtop --assume-yes
#--Terminator--
  echo "============================== INSTALLING TERMINATOR =============================="
  sudo apt install terminator --assume-yes
#--Imwheel--
  echo "============================== INSTALLING IMWHEEL =============================="
  sudo apt install imwheel --assume-yes
#--Ulauncher--
  echo "============================== INSTALLING ULAUNCHER =============================="
  sudo add-apt-repository ppa:agornostal/ulauncher -y &&
  sudo apt update &&
  sudo apt install ulauncher -y
#--LibreoOffice--
  echo "============================== INSTALLING LIBREOFFICE =============================="
  sudo apt install libreoffice -y
#--Zip--
  echo "============================== INSTALLING ZIP =============================="
  sudo apt install zip -y
#--Unzip--
  echo "============================== INSTALLING UNZIP =============================="
  sudo apt install unzip -y
#--Fnm--
  echo "============================== INSTALLING FNM =============================="
  curl -fsSL https://fnm.vercel.app/install | bash
#--Nvm--
  echo "============================== INSTALLING NVM =============================="
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
#--Kazam--
  echo "============================== INSTALLING KAZAM =============================="
  sudo apt install kazam -y
#--xclip--
  echo "============================== INSTALLING XCLIP =============================="
  sudo apt install xclip -y
#--filezilla--
  echo "============================== INSTALLING FILEZILLA =============================="
  sudo apt install filezilla -y
#--smartgit--
  echo "============================== INSTALLING SMARTGIT =============================="
  sudo apt install smartgit -y
#--ibus-bamboo--
  echo "============================== INSTALLING IBUS-BAMBOO =============================="
  sudo add-apt-repository ppa:bamboo-engine/ibus-bamboo -y
  sudo apt-get update
  sudo apt-get install ibus ibus-bamboo --install-recommends -y
  ibus restart
# Đặt ibus-bamboo làm bộ gõ mặc định
  env DCONF_PROFILE=ibus dconf write /desktop/ibus/general/preload-engines "['BambooUs', 'Bamboo']" && gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('ibus', 'Bamboo')]"
#--cloudflare--
  echo "============================== INSTALLING CLOUDFLARE =============================="
  sudo apt install cloudflare-warp -y
  sudo systemctl enable --now warp-svc.service
  warp-cli register
#--firefox--
  echo "============================== INSTALLING FIREFOX =============================="
  sudo apt install firefox -y
#--Setting fnkey keyboard--
  echo "============================== SETTING FNKEY KEYBOARD =============================="
  echo 0 | sudo tee /sys/module/hid_apple/parameters/fnmode
  echo options hid_apple fnmode=0 | sudo tee -a /etc/modprobe.d/hid_apple.conf
  sudo update-initramfs -u -k all
#--open any terminal--
  echo "============================== OPEN ANY TERMINAL =============================="
  sudo apt install python-nautilus -y
  pip3 install --user nautilus-open-any-terminal &&
  gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal terminator
#--Remove snap--
  sudo snap remove --purge firefox
  sudo snap remove --purge snap-store
  sudo snap remove --purge snapd-desktop-integration
  sudo snap remove --purge gtk-common-themes
  sudo snap remove --purge gnome-3-38-2004
  sudo snap remove --purge core20
  sudo snap remove --purge bare
  sudo snap remove --purge snapd
  sudo apt remove -y --purge snapd
  sudo apt-mark hold snapd 
  sudo apt-mark hold gnome-software-plugin-snap
#--HomeBrew--
  echo "============================== INSTALLING HOMEBREW =============================="
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo "PROCESSING: INSTALLING HOMEBREW DONE..."
fi
cd ..
rm -rf ./tmp

# Setting password show charactor *
xdg-mime default org.gnome.Nautilus.desktop inode/directory
sudo cp -r ./sudoers /etc/
sudo cp -r ./config/. ~

# Remove charactor ibus
ibus-setup
