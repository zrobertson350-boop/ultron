#!/bin/bash

# Ultron Website - Quick Verification Script
# This script checks if your environment is ready to run the Ultron website

echo "🔍 Ultron Website - Environment Check"
echo "======================================"
echo ""

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if we're in the right directory
if [ ! -f "index.html" ] || [ ! -f "styles.css" ] || [ ! -f "script.js" ]; then
    echo -e "${RED}✗ Error: Required files not found${NC}"
    echo "  Make sure you're in the ultron directory"
    echo "  Expected files: index.html, styles.css, script.js"
    exit 1
fi
echo -e "${GREEN}✓ Required files found${NC}"

# Check Python installation
echo ""
echo "Checking Python installation..."
if command -v python3 &> /dev/null; then
    PYTHON_VERSION=$(python3 --version)
    echo -e "${GREEN}✓ Python 3 found: ${PYTHON_VERSION}${NC}"
    PYTHON_CMD="python3"
elif command -v python &> /dev/null; then
    PYTHON_VERSION=$(python --version)
    echo -e "${YELLOW}⚠ Python found: ${PYTHON_VERSION}${NC}"
    echo "  (Recommend using Python 3)"
    PYTHON_CMD="python"
else
    echo -e "${RED}✗ Python not found${NC}"
    echo "  Install Python from: https://www.python.org/downloads/"
    echo ""
    echo "Alternative: Use npm instead"
    echo "  Run: npm start"
    exit 1
fi

# Check if port 8000 is available
echo ""
echo "Checking port 8000..."
if lsof -Pi :8000 -sTCP:LISTEN -t >/dev/null 2>&1; then
    echo -e "${YELLOW}⚠ Port 8000 is already in use${NC}"
    echo "  Run this to free it: lsof -ti :8000 | xargs kill -9"
    echo "  Or use a different port: python3 -m http.server 8080"
else
    echo -e "${GREEN}✓ Port 8000 is available${NC}"
fi

# Optional: Check Node/npm
echo ""
echo "Checking optional dependencies..."
if command -v npm &> /dev/null; then
    NPM_VERSION=$(npm --version)
    echo -e "${GREEN}✓ npm found: v${NPM_VERSION}${NC}"
    echo "  You can also use: npm start"
else
    echo -e "${YELLOW}⚠ npm not found (optional)${NC}"
fi

echo ""
echo "======================================"
echo "✅ Environment Check Complete!"
echo ""
echo "Ready to launch! Run one of these:"
echo ""
echo "  ./launch.sh              (recommended)"
echo "  $PYTHON_CMD -m http.server 8000"
if command -v npm &> /dev/null; then
    echo "  npm start"
fi
echo ""
echo "Then open: http://localhost:8000"
echo ""
echo "Need help? See TROUBLESHOOTING.md"
