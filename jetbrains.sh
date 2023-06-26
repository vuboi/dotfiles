#!/bin/bash

# Download the latest version of JetBrains Toolbox
wget -O jetbrains-toolbox.tar.gz "https://data.services.jetbrains.com/products/download?platform=linux&code=TBA"

# Extract the downloaded archive
mkdir ~/Programs
tar -xzf jetbrains-toolbox.tar.gz -C ~/Programs

# Remove the downloaded archive
rm jetbrains-toolbox.tar.gz

# Move into the extracted directory
cd ~/Programs/jetbrains-toolbox*/

# Run the JetBrains Toolbox installer
./jetbrains-toolbox

# Cleanup
cd ..
rm -rf jetbrains-toolbox*/
