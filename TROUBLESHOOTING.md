# Troubleshooting Guide - Ultron Website

## Website Not Loading on Localhost?

This guide will help you resolve common issues when running the Ultron website locally.

## Quick Verification

First, verify the website is actually working:

1. **Check if server is running:**
   ```bash
   # On Linux/Mac
   lsof -i :8000
   
   # On Windows
   netstat -ano | findstr :8000
   ```

2. **Test the server response:**
   ```bash
   curl http://localhost:8000
   ```
   
   If you see HTML output, the server is working!

## Common Issues and Solutions

### Issue 1: "Port 8000 is already in use"

**Symptoms:** Error message when starting the server

**Solutions:**
- **Option A:** Kill the existing process using port 8000
  ```bash
  # On Linux/Mac
  lsof -ti :8000 | xargs kill -9
  
  # On Windows
  netstat -ano | findstr :8000
  # Note the PID, then:
  taskkill /PID <PID> /F
  ```

- **Option B:** Use a different port
  ```bash
  python3 -m http.server 8080
  # Then access: http://localhost:8080
  ```

### Issue 2: "Python is not installed"

**Symptoms:** `command not found: python3` or `'python3' is not recognized`

**Solutions:**

1. **Check if Python is installed:**
   ```bash
   python3 --version
   # or
   python --version
   ```

2. **Install Python:**
   - **Windows:** Download from [python.org](https://www.python.org/downloads/)
   - **Mac:** `brew install python3` (requires Homebrew)
   - **Linux:** `sudo apt-get install python3` (Ubuntu/Debian)

3. **Alternative: Use npm instead:**
   ```bash
   npm start
   ```

### Issue 3: "Cannot access localhost:8000"

**Symptoms:** Browser shows "This site can't be reached" or connection refused

**Solutions:**

1. **Verify the server is running:**
   - Check your terminal for "Serving HTTP on 0.0.0.0 port 8000"
   - Don't close the terminal window

2. **Check firewall settings:**
   - Temporarily disable firewall or add exception for port 8000

3. **Try different URL formats:**
   - `http://localhost:8000`
   - `http://127.0.0.1:8000`
   - `http://0.0.0.0:8000`

4. **Clear browser cache:**
   - Press `Ctrl+Shift+R` (Windows/Linux) or `Cmd+Shift+R` (Mac)

### Issue 4: "Page loads but looks broken"

**Symptoms:** Page loads but missing styles or images

**Solutions:**

1. **Check browser console for errors:**
   - Press `F12` to open Developer Tools
   - Look for red error messages in the Console tab

2. **Verify all files are present:**
   ```bash
   ls -la
   # Should see: index.html, styles.css, script.js
   ```

3. **Make sure you're in the correct directory:**
   ```bash
   pwd
   # Should end with /ultron
   ```

4. **Check file permissions:**
   ```bash
   chmod 644 index.html styles.css script.js
   ```

### Issue 5: "Fonts not loading"

**Symptoms:** Text appears but in different/default fonts

**Solution:** This is normal! Google Fonts may be blocked by:
- Ad blockers
- Privacy extensions
- Corporate firewalls
- Browser security settings

The website still works perfectly - it just uses system fonts as fallback.

### Issue 6: "Animations not working"

**Symptoms:** Page loads but no animations or interactive features

**Solutions:**

1. **Enable JavaScript in your browser**
2. **Check browser compatibility:**
   - Use a modern browser (Chrome, Firefox, Safari, Edge)
   - Update to the latest version

3. **Disable browser extensions temporarily:**
   - Ad blockers or script blockers may interfere

## Step-by-Step Launch Instructions

### Method 1: Using Launch Script (Recommended)

**On Linux/Mac:**
```bash
cd /path/to/ultron
chmod +x launch.sh
./launch.sh
```

**On Windows:**
```cmd
cd C:\path\to\ultron
launch.bat
```

### Method 2: Using npm

```bash
cd /path/to/ultron
npm start
```

### Method 3: Using Python Directly

```bash
cd /path/to/ultron
python3 -m http.server 8000
```

### Method 4: Direct Browser Access

For testing only (some features may not work):
1. Navigate to the ultron folder
2. Double-click `index.html`

## Verification Checklist

After starting the server, verify:

- [ ] Terminal shows "Serving HTTP on 0.0.0.0 port 8000"
- [ ] Browser shows the Ultron homepage at `http://localhost:8000`
- [ ] Navigation menu works (Home, Features, Services, About, Contact)
- [ ] Statistics counter animates (500, 250, 15)
- [ ] Page scrolls smoothly
- [ ] Contact form is visible
- [ ] No red errors in browser console (F12)

## Still Having Issues?

1. **Take a screenshot** of any error messages
2. **Check the browser console** (F12 > Console tab)
3. **Verify your setup:**
   ```bash
   python3 --version
   node --version
   npm --version
   ```

4. **Try a different browser** (Chrome, Firefox, Safari, Edge)

5. **Create an issue** on GitHub with:
   - Your operating system
   - Python/Node version
   - Browser and version
   - Screenshot of the error
   - Terminal output

## Success Indicators

✅ You should see this in your terminal:
```
🚀 Launching Ultron Website...

Starting server with Python 3...
⚡ Ultron will be available at: http://localhost:8000

Press Ctrl+C to stop the server

Serving HTTP on 0.0.0.0 port 8000 (http://0.0.0.0:8000/) ...
```

✅ Your browser should show:
- Ultron logo in top left
- "Innovation Through Technology" title with gradient text
- Get Started and Learn More buttons
- Statistics showing 500, 250, and 15

## Tips for Best Experience

- **Use Chrome or Firefox** for best compatibility
- **Enable JavaScript** for full functionality
- **Don't close the terminal** while using the website
- **Use Ctrl+C** to properly stop the server
- **Clear cache** if you see old content after updates

## Advanced Debugging

### Enable Verbose Logging

```bash
python3 -m http.server 8000 --log-file server.log
```

### Check Network Traffic

1. Open browser DevTools (F12)
2. Go to Network tab
3. Refresh page
4. Look for failed requests (red)

### Test with curl

```bash
# Test main page
curl -I http://localhost:8000/

# Test CSS
curl -I http://localhost:8000/styles.css

# Test JavaScript
curl -I http://localhost:8000/script.js
```

All should return `HTTP/1.0 200 OK`

---

**Need more help?** Check the [README.md](README.md) for general information or create an issue on GitHub.
