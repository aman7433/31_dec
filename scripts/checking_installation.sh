#!/bin/bash

# Check if the nginx.service file exists
if systemctl list-units --type=service --state=enabled | grep -q "nginx.service"; then
    # If nginx.service exists, try to start the nginx service
    echo "Nginx service found. Starting Nginx..."
    sudo systemctl start nginx

    # Check the status of the Nginx service
    if systemctl is-active --quiet nginx; then
        echo "Nginx is running successfully."
    else
        echo "Failed to start Nginx."
        exit 1  # Fail the deployment if Nginx can't be started
    fi
else
    # If nginx.service doesn't exist, print a message and stop deployment
    echo "Nginx service not found. Stopping the deployment."
    exit 1  # Exit with a non-zero code to stop the deployment
fi
