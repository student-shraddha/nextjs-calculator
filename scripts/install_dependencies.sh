#!/bin/bash

# Update the package list and install dependencies for Amazon Linux
sudo yum update -y
sudo yum install -y ruby wget

# Install Node.js and npm
curl -sL https://rpm.nodesource.com/setup_18.x | sudo bash -
sudo yum install -y nodejs

# Install PM2 to manage the Next.js app process
sudo npm install -g pm2

# Navigate to app directory and install dependencies
cd /home/ec2-user/nextjs-calculator || exit 1
npm install
