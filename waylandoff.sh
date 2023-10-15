# Disabled wayland
# sudo nano /etc/gdm3/custom.conf
#!/bin/bash

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root using sudo."
  exit 1
fi

# Define the file path
custom_conf="/etc/gdm3/custom.conf"

# Check if the file exists
if [ ! -e "$custom_conf" ]; then
  echo "Error: $custom_conf does not exist."
  exit 1
fi

# Check if the WaylandEnable option is already uncommented
if grep -q "^WaylandEnable=false" "$custom_conf"; then
  echo "WaylandEnable is already uncommented."
else
  # Uncomment the WaylandEnable option
  sed -i 's/^#WaylandEnable=false/WaylandEnable=false/' "$custom_conf"
  sed -i 's/^# WaylandEnable=false/WaylandEnable=false/' "$custom_conf"
  echo "WaylandEnable has been uncommented."
fi
