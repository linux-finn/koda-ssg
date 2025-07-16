#!/bin/bash
# Koda deployment script for stephenfinnegan.com

set -e  # Exit on any error

echo "🔨 Building Koda site..."

# Activate virtual environment
source koda-env/bin/activate

# Build the site
echo "Running python3 koda.py..."
python3 koda.py

# Check if build was successful
if [ ! -d "site" ]; then
    echo "❌ Build failed - site directory not created"
    exit 1
fi

if [ -z "$(ls -A site/)" ]; then
    echo "❌ Build failed - site directory is empty"
    exit 1
fi

echo "✅ Build successful!"

echo "🚀 Deploying to live site..."

# Deploy to public directory (excluding any scripts)
echo "Clearing old files..."
sudo rm -rf /DATA/AppData/hugo/blog/public/*

echo "Copying site files..."
sudo cp -r site/*.html /DATA/AppData/hugo/blog/public/ 2>/dev/null || true
sudo cp -r site/*.xml /DATA/AppData/hugo/blog/public/ 2>/dev/null || true
sudo cp -r site/posts /DATA/AppData/hugo/blog/public/ 2>/dev/null || true
sudo cp -r site/static /DATA/AppData/hugo/blog/public/ 2>/dev/null || true

echo "Setting permissions..."
sudo chown -R 101:101 /DATA/AppData/hugo/blog/public/
sudo chmod -R 755 /DATA/AppData/hugo/blog/public/

echo "🔍 Verifying deployment..."
echo "Files in public directory:"
sudo ls -la /DATA/AppData/hugo/blog/public/

# Check if index.html exists
if sudo test -f /DATA/AppData/hugo/blog/public/index.html; then
    echo "✅ Koda site deployed successfully to stephenfinnegan.com!"
else
    echo "❌ Deployment verification failed - index.html not found"
    exit 1
fi
