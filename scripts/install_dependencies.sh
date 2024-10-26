#!/bin/bash
#!/bin/bash

# Update the package list and install dependencies on Amazon Linux
sudo yum update -y
sudo yum install -y ruby wget

# Install Node.js and npm (specific setup for Amazon Linux)
curl -sL https://rpm.nodesource.com/setup_18.x | sudo bash -
sudo yum install -y nodejs

# Install PM2 globally to manage the Next.js application process
sudo npm install -g pm2

# Set up application directory and navigate to it
APP_DIR="/home/ec2-user/nextjs-calculator"
sudo mkdir -p $APP_DIR
sudo chown ec2-user:ec2-user $APP_DIR
cd $APP_DIR || exit 1

# Install app dependencies
npm install
