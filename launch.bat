@echo off
REM Word Analyzer Launch Script for Windows
REM Simple script to launch the Word Analyzer website

echo.
echo 🚀 Launching Word Analyzer...
echo.

REM Check if Python is available
python --version >nul 2>&1
if %errorlevel% equ 0 (
    echo Starting server with Python...
    echo 📝 Word Analyzer will be available at: http://localhost:8000
    echo.
    echo Press Ctrl+C to stop the server
    echo.
    python -m http.server 8000
) else (
    echo ❌ Error: Python is not installed.
    echo.
    echo Please install Python or use one of these alternatives:
    echo   - npm start (if you have Node.js installed)
    echo   - Open index.html directly in your browser
    pause
    exit /b 1
)
