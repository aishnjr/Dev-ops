#!/bin/bash

# deploy.sh - Script to deploy the application

# Exit immediately if a command exits with a non-zero status
set -e

# Variables
TARGET_SERVER="user@yourserver.com"
REMOTE_DIR="/var/www/my_app"
ARTIFACT="build/my_app.jar"

# Transfer the artifact to the remote server
echo "Transferring the artifact to the server..."
scp $ARTIFACT $TARGET_SERVER:$REMOTE_DIR

# Connect to the server and deploy the application
ssh $TARGET_SERVER << 'EOF'
    # Navigate to the deployment directory
    cd /var/www/my_app

    # Restart the service (assuming a systemd service)
    echo "Restarting the application service..."
    sudo systemctl restart my_app.service

    echo "Deployment completed successfully!"
EOF