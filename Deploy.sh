#!/bin/bash

# RFID Card Top-Up System - VPS Deployment Script
# Team: Darius_Divine_Louise
# Target: user257@157.173.101.159

echo "=================================================="
echo "  RFID System Deployment to VPS"
echo "  Team: Darius_Divine_Louise"
echo "=================================================="
echo ""

# Configuration
VPS_USER="user257"
VPS_HOST="157.173.101.159"
VPS_TARGET="$VPS_USER@$VPS_HOST"
PROJECT_NAME="rfid-topup-system"
REMOTE_DIR="/home/$VPS_USER/$PROJECT_NAME"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if we can connect to VPS
echo -e "${YELLOW}[1/6] Testing SSH connection...${NC}"
if ssh -o ConnectTimeout=10 -o BatchMode=yes $VPS_TARGET "echo 'Connection successful'" 2>/dev/null; then
    echo -e "${GREEN}✓ SSH connection successful${NC}"
else
    echo -e "${RED}✗ Cannot connect to VPS. Please check:${NC}"
    echo "  - SSH key is set up: ssh-copy-id $VPS_TARGET"
    echo "  - VPS is reachable: ping $VPS_HOST"
    echo ""
    echo "To set up SSH key authentication, run:"
    echo "  ssh-copy-id $VPS_TARGET"
    exit 1
fi

# Create project directory on VPS
echo -e "\n${YELLOW}[2/6] Creating project directory on VPS...${NC}"
ssh $VPS_TARGET "mkdir -p $REMOTE_DIR" 2>/dev/null
echo -e "${GREEN}✓ Directory created: $REMOTE_DIR${NC}"

# Copy files to VPS
echo -e "\n${YELLOW}[3/6] Copying project files to VPS...${NC}"
scp -r ./* $VPS_TARGET:$REMOTE_DIR/ 2>/dev/null
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Files copied successfully${NC}"
else
    echo -e "${RED}✗ Failed to copy files${NC}"
    exit 1
fi

# Install dependencies and setup on VPS
echo -e "\n${YELLOW}[4/6] Installing Node.js and dependencies on VPS...${NC}"
ssh $VPS_TARGET << 'ENDSSH'
cd /home/user257/rfid-topup-system

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "Node.js not found. Installing..."
    curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
    sudo apt-get install -y nodejs
else
    echo "Node.js already installed: $(node --version)"
fi

# Install npm dependencies
echo "Installing npm packages..."
npm install express ws mqtt cors

echo "✓ Dependencies installed"
ENDSSH

echo -e "${GREEN}✓ Setup complete${NC}"

# Setup PM2 for process management
echo -e "\n${YELLOW}[5/6] Setting up PM2 process manager...${NC}"
ssh $VPS_TARGET << 'ENDSSH'
cd /home/user257/rfid-topup-system

# Install PM2 globally if not installed
if ! command -v pm2 &> /dev/null; then
    echo "Installing PM2..."
    sudo npm install -g pm2
else
    echo "PM2 already installed"
fi

# Stop existing process if running
pm2 stop rfid-system 2>/dev/null || true
pm2 delete rfid-system 2>/dev/null || true

# Start the application
pm2 start server.js --name rfid-system

# Save PM2 configuration
pm2 save

# Setup PM2 to start on boot
sudo pm2 startup systemd -u user257 --hp /home/user257

echo "✓ PM2 configured"
ENDSSH

echo -e "${GREEN}✓ PM2 setup complete${NC}"

# Display status and access information
echo -e "\n${YELLOW}[6/6] Deployment complete!${NC}"
echo ""
echo "=================================================="
echo -e "${GREEN}✓ DEPLOYMENT SUCCESSFUL${NC}"
echo "=================================================="
echo ""
echo "Your application is now running on:"
echo "  📍 Dashboard: http://$VPS_HOST:3000"
echo "  📍 API Health: http://$VPS_HOST:3000/health"
echo "  📍 API Status: http://$VPS_HOST:3000/status"
echo ""
echo "Useful commands:"
echo "  - View logs:    ssh $VPS_TARGET 'pm2 logs rfid-system'"
echo "  - Check status: ssh $VPS_TARGET 'pm2 status'"
echo "  - Restart app:  ssh $VPS_TARGET 'pm2 restart rfid-system'"
echo "  - Stop app:     ssh $VPS_TARGET 'pm2 stop rfid-system'"
echo ""
echo "To SSH into your VPS:"
echo "  ssh $VPS_TARGET"
echo ""