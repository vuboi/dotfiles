# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi



# Added by Toolbox App
export PATH="$PATH:/home/shival/.local/share/JetBrains/Toolbox/scripts"
export FREETYPE_PROPERTIES="cff:no-stem-darkening=0"



# Added by Toolbox App
export PATH="$PATH:/home/kyra/.local/share/JetBrains/Toolbox/scripts"


#Force Themes Nautilus
#export GTK_THEME=ark-arker
#gsettings get org.gnome.desktop.interface gtk-theme
