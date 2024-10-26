#!/bin/bash

# Update package list and install dependencies
sudo yum update -y
sudo yum install -y ruby wget

# Install Node.js and npm (specific to Amazon Linux)
curl -sL https://rpm.nodesource.com/setup_18.x | sudo bash -
sudo yum install -y nodejs

# Install PM2 globally to manage the Next.js process
sudo npm install -g pm2

# Set up application directory and install dependencies
APP_DIR="/home/ec2-user/nextjs-calculator"
mkdir -p $APP_DIR
cd $APP_DIR || exit 1
npm install
