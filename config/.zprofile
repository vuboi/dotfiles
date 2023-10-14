eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

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

#Force Themes Nautilus
#export GTK_THEME=ark-arker
#gsettings get org.gnome.desktop.interface gtk-theme
