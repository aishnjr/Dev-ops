#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Variables
TARGET_SERVER="user@yourserver.com"
REMOTE_DIR="/var/www/my_app"
ARTIFACT="my_app.tar.gz"

# Transfer files
echo "Transferring files to the server..."
scp $ARTIFACT $TARGET_SERVER:$REMOTE_DIR

# Connect to the server and deploy
ssh $TARGET_SERVER << 'EOF'
    # Navigate to the deployment directory
    cd /var/www/my_app

    # Extract the artifact
    echo "Extracting files..."
    tar -xzvf my_app.tar.gz

    # Restart the application service
    echo "Restarting the service..."
    sudo systemctl restart my_app.service

    echo "Deployment completed successfully!"
EOF