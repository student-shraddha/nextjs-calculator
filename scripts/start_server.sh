#!/bin/bash

# Correct the path for your application
APP_DIR="/home/ec2-user/nextjs-calculator"

# Ensure the application directory exists
if [ ! -d "$APP_DIR" ]; then
    echo "Application directory $APP_DIR does not exist. Creating it now."
    sudo mkdir -p "$APP_DIR"
    sudo chown ec2-user:ec2-user "$APP_DIR"  # Set ownership to ec2-user
fi

cd "$APP_DIR" || { echo "Failed to change to $APP_DIR"; exit 1; }

# Check for package.json file
if [ ! -f "$APP_DIR/package.json" ]; then
    echo "Error: package.json not found in $APP_DIR"
    exit 1
fi

# Install Node.js and npm if not already installed
if ! command -v npm &> /dev/null; then
    echo "Installing Node.js and npm..."
    curl -sL https://rpm.nodesource.com/setup_18.x | sudo bash -
    sudo yum install -y nodejs || { echo "Node.js installation failed"; exit 1; }
fi

# Install dependencies
echo "Installing npm dependencies..."
npm install || { echo "npm install failed"; exit 1; }

# Build the Next.js application
echo "Building the Next.js application..."
npm run build || { echo "Build failed"; exit 1; }

# Ensure PM2 is installed and available
if ! command -v pm2 &> /dev/null; then
    echo "PM2 is not installed. Installing PM2 globally..."
    sudo npm install -g pm2 || { echo "PM2 installation failed"; exit 1; }
fi

# Start the application with PM2
pm2 delete all
pm2 save
pm2 start npm --name "nextjs-calculator" -- start || { echo "PM2 failed to start the application"; exit 1; }
pm2 save
pm2 startup || { echo "PM2 startup command failed"; exit 1; }
