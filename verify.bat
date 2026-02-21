@echo off
REM Ultron Website - Quick Verification Script (Windows)
REM This script checks if your environment is ready to run the Ultron website

echo.
echo 🔍 Ultron Website - Environment Check
echo ======================================
echo.

REM Check if we're in the right directory
if not exist "index.html" (
    echo ✗ Error: Required files not found
    echo   Make sure you're in the ultron directory
    echo   Expected files: index.html, styles.css, script.js
    pause
    exit /b 1
)
if not exist "styles.css" (
    echo ✗ Error: Required files not found
    echo   Make sure you're in the ultron directory
    pause
    exit /b 1
)
if not exist "script.js" (
    echo ✗ Error: Required files not found
    echo   Make sure you're in the ultron directory
    pause
    exit /b 1
)
echo ✓ Required files found

REM Check Python installation
echo.
echo Checking Python installation...
python --version >nul 2>&1
if %errorlevel% equ 0 (
    for /f "tokens=*" %%i in ('python --version') do set PYTHON_VERSION=%%i
    echo ✓ Python found: %PYTHON_VERSION%
) else (
    echo ✗ Python not found
    echo   Install Python from: https://www.python.org/downloads/
    echo.
    echo Alternative: Use npm instead
    echo   Run: npm start
    pause
    exit /b 1
)

REM Check if port 8000 is available
echo.
echo Checking port 8000...
netstat -ano | findstr :8000 | findstr LISTENING >nul 2>&1
if %errorlevel% equ 0 (
    echo ⚠ Port 8000 is already in use
    echo   Check what's using it: netstat -ano ^| findstr :8000
    echo   Or use a different port: python -m http.server 8080
) else (
    echo ✓ Port 8000 is available
)

REM Optional: Check Node/npm
echo.
echo Checking optional dependencies...
npm --version >nul 2>&1
if %errorlevel% equ 0 (
    for /f "tokens=*" %%i in ('npm --version') do set NPM_VERSION=%%i
    echo ✓ npm found: v%NPM_VERSION%
    echo   You can also use: npm start
) else (
    echo ⚠ npm not found (optional)
)

echo.
echo ======================================
echo ✅ Environment Check Complete!
echo.
echo Ready to launch! Run one of these:
echo.
echo   launch.bat          (recommended)
echo   python -m http.server 8000
npm --version >nul 2>&1
if %errorlevel% equ 0 (
    echo   npm start
)
echo.
echo Then open: http://localhost:8000
echo.
echo Need help? See TROUBLESHOOTING.md
echo.
pause
