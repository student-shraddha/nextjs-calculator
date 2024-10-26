#!/bin/bash
# Check if the app is running by looking for its process
pm2 show nextjs-calculator | grep "status" | grep -q "online"

if [ $? -ne 0 ]; then
  echo "Application is not running"
  exit 1
else
  echo "Application is running"
fi
