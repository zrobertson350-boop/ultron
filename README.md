# Word Analyzer

A powerful, free text analysis tool that provides instant statistics about your writing. Whether you're a writer, student, or professional, get comprehensive insights about word count, character count, reading time, and more.

## Features

- 📊 **Real-time Analysis** - Get instant word and character counts as you type or paste text
- 🔒 **Privacy First** - Your text never leaves your browser - all processing happens locally
- ⏱️ **Reading Time** - Estimate how long it takes to read your content at average speed
- 📝 **Detailed Stats** - Track sentences, paragraphs, word length, and more metrics
- 📱 **Responsive Design** - Works perfectly on desktop, tablet, and mobile devices

## Statistics Provided

1. **Word Count** - Total number of words
2. **Character Count** - Total characters including spaces
3. **Characters (no spaces)** - Character count excluding spaces
4. **Sentence Count** - Number of sentences detected
5. **Paragraph Count** - Number of paragraphs
6. **Reading Time** - Estimated reading time (200 words/minute)
7. **Average Word Length** - Mean length of words
8. **Longest Word** - The longest word in your text

## 🚀 How to Launch

### Option 1: Quick Launch (Recommended)

**On Linux/Mac:**
```bash
./launch.sh
```

**On Windows:**
```cmd
launch.bat
```

### Option 2: Using npm

```bash
npm start
```

### Option 3: Using Python directly

**Python 3 (Recommended):**
```bash
python3 -m http.server 8000
```

**Or if 'python' points to Python 3:**
```bash
python -m http.server 8000
```

### Option 4: Open directly in browser

Simply open `index.html` in your web browser. This works but some features may be limited without a server.

## After Launching

Once the server is running, open your browser and navigate to:
```
http://localhost:8000
```

Press `Ctrl+C` in the terminal to stop the server.

## Usage

1. **Type or Paste Text** - Enter your text in the large text area
2. **View Statistics** - Statistics update in real-time as you type
3. **Clear Text** - Click "Clear Text" to reset the text area
4. **Copy Statistics** - Click "Copy Statistics" to copy all stats to clipboard

## Technical Details

- **No Dependencies** - Pure HTML, CSS, and JavaScript
- **Client-Side Processing** - All text analysis happens in your browser
- **Privacy Focused** - No data is sent to any server
- **Cross-Platform** - Works on all modern browsers

## Browser Compatibility

- ✅ Chrome/Edge (latest)
- ✅ Firefox (latest)
- ✅ Safari (latest)
- ✅ Opera (latest)

## License

MIT License - Feel free to use and modify as needed.

## Development

The project consists of three main files:
- `index.html` - Main HTML structure
- `styles.css` - Styling and responsive design
- `script.js` - Text analysis functionality

No build process required - it's ready to run!
