#!/bin/bash

# Download the latest version of JetBrains Toolbox
wget -O jetbrains-toolbox.tar.gz "https://data.services.jetbrains.com/products/download?platform=linux&code=TBA"

# Extract the downloaded archive
if [ -d ~/Programs ]; then
  echo "PROCESSING: EXIT FOLDER..."
  rm -rf ~/Programs
  echo "PROCESSING: REMOVE FOLDER..."
  mkdir ~/Programs && tar -xzf jetbrains-toolbox.tar.gz -C ~/Programs
  echo "PROCESSING: CD FOLDER TMP..."
else 
  mkdir ~/Programs && tar -xzf jetbrains-toolbox.tar.gz -C ~/Programs
fi

# Remove the downloaded archive
rm jetbrains-toolbox.tar.gz

# Move into the extracted directory
cd ~/Programs/jetbrains-toolbox*/

# Run the JetBrains Toolbox installer
sudo apt-get install libfuse2 -y
./jetbrains-toolbox

# Cleanup
cd ..
rm -rf jetbrains-toolbox*/
