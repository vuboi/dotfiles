#!/bin/bash
# Define the installation directory
INSTALL_DIR="/opt/postman"

# Create a temporary directory for the installation
TEMP_DIR=$(mktemp -d)

# Download the Postman tarball
echo "Downloading Postman..."
wget -O "$TEMP_DIR/postman.tar.gz" "https://dl.pstmn.io/download/latest/linux"

# Check if the download was successful
if [ $? -ne 0 ]; then
    echo "Failed to download Postman. Please check your internet connection and try again."
    exit 1
fi

# Extract the tarball to the installation directory
sudo mkdir $INSTALL_DIR
sudo tar -xzf "$TEMP_DIR/postman.tar.gz" -C "$INSTALL_DIR"

# Create a symbolic link to the Postman executable
sudo ln -s "$INSTALL_DIR/Postman/Postman" /usr/bin/postman

# Create a desktop shortcut (optional)
echo "[Desktop Entry]
Version=1.0
Type=Application
Name=Postman
Exec=postman
Icon=$INSTALL_DIR/Postman/app/resources/app/assets/icon.png
Terminal=false
Categories=Development;" | sudo tee /usr/share/applications/postman.desktop

# Cleanup
rm -rf "$TEMP_DIR"
