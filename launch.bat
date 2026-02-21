@echo off
REM Ultron Website Launch Script for Windows
REM Simple script to launch the Ultron website

SET PORT=8000

echo.
echo 🚀 Launching Ultron Website...
echo.

REM Check if Python is available
python --version >nul 2>&1
if %errorlevel% equ 0 (
    echo Starting server with Python...
    echo ⚡ Ultron will be available at: http://localhost:%PORT%
    echo.
    echo Press Ctrl+C to stop the server
    echo.
    python -m http.server %PORT%
) else (
    echo ❌ Error: Python is not installed.
    echo.
    echo Please install Python or use one of these alternatives:
    echo   - npm start (if you have Node.js installed)
    echo   - Open index.html directly in your browser
    pause
    exit /b 1
)
