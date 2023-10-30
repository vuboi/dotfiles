#!/bin/bash

echo "Remove setting old vscode..."
sudo rm -rf $HOME/.config/Code/User/settings.json
sudo cp -r ./settings.json $HOME/.config/Code/User
echo "Copy new setting vscode..."
