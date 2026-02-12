#!/bin/bash

# GitHub Upload Guide for RFID Dashboard
# Follow these steps to upload your project to GitHub

echo "=== RFID Dashboard - GitHub Upload Guide ==="
echo ""

# Step 1: Initialize Git Repository
echo "Step 1: Initialize Git Repository"
echo "Run the following commands in your project directory:"
echo ""
echo "  cd \"e:/Embedded system projects/RFID\""
echo "  git init"
echo ""

# Step 2: Add files
echo "Step 2: Add files to Git"
echo "  git add dashboard.html"
echo "  git add README.md"
echo "  git add UI_UX_DESIGN.md"
echo "  git add .gitignore"
echo "  git add Deploy.sh"
echo ""

# Step 3: Commit
echo "Step 3: Create initial commit"
echo "  git commit -m \"Initial commit: RFID Premium Dashboard with advanced UI/UX\""
echo ""

# Step 4: Create GitHub Repository
echo "Step 4: Create a new repository on GitHub"
echo "  1. Go to https://github.com/new"
echo "  2. Repository name: rfid-dashboard (or your preferred name)"
echo "  3. Description: Premium RFID card management dashboard with real-time monitoring"
echo "  4. Choose Public or Private"
echo "  5. Do NOT initialize with README (we already have one)"
echo "  6. Click 'Create repository'"
echo ""

# Step 5: Connect to GitHub
echo "Step 5: Connect your local repository to GitHub"
echo "  Replace 'yourusername' with your GitHub username:"
echo ""
echo "  git remote add origin https://github.com/yourusername/rfid-dashboard.git"
echo "  git branch -M main"
echo "  git push -u origin main"
echo ""

# Step 6: Verify
echo "Step 6: Verify upload"
echo "  Visit your repository at: https://github.com/yourusername/rfid-dashboard"
echo ""

# Optional: Add more files later
echo "Optional: To add more files later"
echo "  git add <filename>"
echo "  git commit -m \"Description of changes\""
echo "  git push"
echo ""

echo "=== Setup Complete! ==="
echo ""
echo "Quick Command Summary:"
echo "----------------------"
echo "git init"
echo "git add ."
echo "git commit -m \"Initial commit: RFID Premium Dashboard\""
echo "git remote add origin https://github.com/yourusername/rfid-dashboard.git"
echo "git branch -M main"
echo "git push -u origin main"
