#!/bin/bash

# Exit if any command fails
set -e

# Build the IG site
echo "Building IG..."
java -jar publisher.jar -ig ig.ini

# Checkout orphan branch and deploy output/
echo "Deploying to gh-pages..."
git checkout --orphan gh-pages
#git rm -rf .
cp -R output/* ./
touch .nojekyll
git add .
git commit -m "Deploy CIE IG to GitHub Pages"
git push -f origin gh-pages

# Switch back to main
git checkout main
