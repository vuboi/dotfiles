#!/bin/bash

# Check if 'Defaults env_reset, pwfeedback' is already in the sudoers file
if ! sudo grep -q "^Defaults\s\+env_reset, pwfeedback" /etc/sudoers; then
    # Check if 'Defaults env_reset' exists and add 'pwfeedback' after it
    if sudo grep -q "^Defaults\s\+env_reset" /etc/sudoers; then
        sudo sed -i "/^Defaults\s\+env_reset/s/$/, pwfeedback/" /etc/sudoers
        echo "Password feedback enabled."
    else
        echo "Defaults env_reset is not found in the sudoers file."
    fi
else
    echo "Password feedback is already enabled."
fi
