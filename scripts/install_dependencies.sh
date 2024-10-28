#!/bin/bash

APP_DIR="/home/ec2-user/nextjs-calculator"

# Update packages and install dependencies
sudo yum update -y
sudo yum install -y ruby wget

# Install Node.js and npm
curl -sL https://rpm.nodesource.com/setup_18.x | sudo bash -
sudo yum install -y nodejs

# Install PM2 globally
sudo npm install -g pm2

# Ensure application directory exists
sudo mkdir -p "$APP_DIR"
sudo chown ec2-user:ec2-user "$APP_DIR"
cd "$APP_DIR" || { echo "Failed to change to $APP_DIR directory"; exit 1; }

# Check if package.json exists before running npm install
if [ ! -f "package.json" ]; then
    echo "Error: package.json not found in $APP_DIR" >&2
    exit 1
fi

# Remove package-lock.json if it exists
[ -f "package-lock.json" ] && rm package-lock.json

# Configure npm to ignore package-lock.json
echo "Configuring npm to skip package-lock.json..."
npm config set package-lock false

# Install dependencies
echo "Installing npm dependencies..."
npm install || { echo "npm install failed"; exit 1; }

# Optional: Reset npm configuration to allow package-lock.json if needed for future sessions
npm config set package-lock true
