#!/bin/bash

# Define the path for the systemd-sleep service file
SERVICE_FILE="/lib/systemd/system-sleep/restart_sound"

# Create the systemd-sleep service file and insert the provided code
echo "#!/bin/sh" > "$SERVICE_FILE"
echo "" >> "$SERVICE_FILE"
echo 'case "$1" in' >> "$SERVICE_FILE"
echo '    post)' >> "$SERVICE_FILE"
echo '        DEVICE_ID=`lspci -D | grep -i Audio | awk '\''{print $1}'\''`' >> "$SERVICE_FILE"
echo '        echo 1 > /sys/bus/pci/devices/${DEVICE_ID}/remove' >> "$SERVICE_FILE"
echo '        sleep 1' >> "$SERVICE_FILE"
echo '        echo 1 > /sys/bus/pci/rescan' >> "$SERVICE_FILE"
echo 'esac' >> "$SERVICE_FILE"

# Make the service file executable
sudo chmod +x "$SERVICE_FILE"

echo "Systemd-sleep service file created and made executable: $SERVICE_FILE"
