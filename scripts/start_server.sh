#!/bin/bash
# Navigate to the app directory
cd /home/ec2-user/nextjs-calculator

# Build the Next.js app
npm run build

# Start the Next.js app using PM2
pm2 start npm --name "nextjs-calculator" -- start
pm2 save
