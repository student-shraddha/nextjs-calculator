#!/bin/bash
# Install Node.js if it’s not already installed
curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install PM2 to manage the Next.js app process
sudo npm install -g pm2

# Navigate to app directory and install dependencies
cd /home/ubuntu/nextjs-calculator
npm install
