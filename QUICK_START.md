# Quick Reference - Ultron Website

## 🚀 Fastest Way to Get Started

```bash
# 1. Navigate to the ultron directory
cd /path/to/ultron

# 2. Run verification (optional but recommended)
./verify.sh       # Linux/Mac
verify.bat        # Windows

# 3. Launch the website
./launch.sh       # Linux/Mac
launch.bat        # Windows

# 4. Open in browser
# Go to: http://localhost:8000
```

## ❓ Common Commands

### Check if it's working
```bash
curl http://localhost:8000
```

### Check what's on port 8000
```bash
# Linux/Mac
lsof -i :8000

# Windows
netstat -ano | findstr :8000
```

### Kill process on port 8000
```bash
# Linux/Mac
lsof -ti :8000 | xargs kill -9

# Windows (replace PID with actual process ID)
taskkill /PID <PID> /F
```

### Use a different port
```bash
python3 -m http.server 8080
# Then access: http://localhost:8080
```

## ✅ Quick Checklist

When you launch, you should see:

**Terminal:**
- ✓ "🚀 Launching Ultron Website..."
- ✓ "⚡ Ultron will be available at: http://localhost:8000"
- ✓ "Serving HTTP on 0.0.0.0 port 8000"

**Browser (http://localhost:8000):**
- ✓ ULTRON logo (⚡)
- ✓ "Innovation Through Technology" title
- ✓ Animated counters (500, 250, 15)
- ✓ Navigation menu works
- ✓ Page scrolls smoothly

## 🆘 Getting Help

1. **Not working?** → See [TROUBLESHOOTING.md](TROUBLESHOOTING.md)
2. **Need setup help?** → See [README.md](README.md)
3. **Still stuck?** → Create an issue on GitHub

## 📁 File Overview

| File | Purpose |
|------|---------|
| `index.html` | Main website page |
| `styles.css` | All styling |
| `script.js` | Interactive features |
| `launch.sh` | Launch script (Unix/Mac) |
| `launch.bat` | Launch script (Windows) |
| `verify.sh` | Environment check (Unix/Mac) |
| `verify.bat` | Environment check (Windows) |
| `README.md` | Full documentation |
| `TROUBLESHOOTING.md` | Problem-solving guide |
| `QUICK_START.md` | This file |

## 💡 Pro Tips

- **Always launch from the ultron directory**
- **Don't close the terminal while using the site**
- **Use Ctrl+C to stop the server properly**
- **Clear browser cache if you see old content** (Ctrl+Shift+R)
- **Check browser console for errors** (F12)

## 🔗 Quick Links

- Main documentation: [README.md](README.md)
- Troubleshooting: [TROUBLESHOOTING.md](TROUBLESHOOTING.md)
- Python download: https://www.python.org/downloads/
- Report issues: [GitHub Issues](https://github.com/zrobertson350-boop/ultron/issues)
