#!/bin/bash

# Word Analyzer Launch Script
# Simple script to launch the Word Analyzer website

PORT=8000

echo "🚀 Launching Word Analyzer..."
echo ""

# Check if Python 3 is available
if command -v python3 &> /dev/null; then
    echo "Starting server with Python 3..."
    echo "📝 Word Analyzer will be available at: http://localhost:${PORT}"
    echo ""
    echo "Press Ctrl+C to stop the server"
    echo ""
    python3 -m http.server ${PORT}
elif command -v python &> /dev/null; then
    # Fallback to python if python3 is not available
    echo "Starting server with Python..."
    echo "📝 Word Analyzer will be available at: http://localhost:${PORT}"
    echo ""
    echo "Press Ctrl+C to stop the server"
    echo ""
    python -m http.server ${PORT}
else
    echo "❌ Error: Python is not installed."
    echo ""
    echo "Please install Python or use one of these alternatives:"
    echo "  - npm start (if you have Node.js installed)"
    echo "  - Open index.html directly in your browser"
    exit 1
fi
