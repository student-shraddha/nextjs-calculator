#!/bin/bash

# Define the path to package-lock.json
PACKAGE_LOCK="/home/ec2-user/nextjs-calculator/package-lock.json"

# Check if package-lock.json exists and remove it
if [ -f "$PACKAGE_LOCK" ]; then
    echo "Removing package-lock.json..."
    rm -f "$PACKAGE_LOCK"
    echo "package-lock.json removed."
else
    echo "package-lock.json does not exist, no action needed."
fi
