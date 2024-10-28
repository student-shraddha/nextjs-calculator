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

# Create app directory if it doesn't exist
sudo mkdir -p "$APP_DIR"
sudo chown ec2-user:ec2-user "$APP_DIR"
cd "$APP_DIR" || exit 1

# Check if package.json exists before running npm install
if [ -f "package.json" ]; then
    echo "Installing npm dependencies..."
    npm install
else
    echo "Error: package.json not found in $APP_DIR" >&2
    exit 1
fi
