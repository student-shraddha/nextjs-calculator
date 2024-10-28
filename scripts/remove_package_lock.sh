#!/bin/bash
APP_DIR="/home/ec2-user/nextjs-calculator"
PACKAGE_LOCK="$APP_DIR/package-lock.json"

# Remove package-lock.json if it exists
if [ -f "$PACKAGE_LOCK" ]; then
    echo "Removing package-lock.json..."
    rm -f "$PACKAGE_LOCK"
fi
