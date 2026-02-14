// Mobile Menu Toggle
const hamburger = document.querySelector('.hamburger');
const navMenu = document.querySelector('.nav-menu');

hamburger.addEventListener('click', () => {
    hamburger.classList.toggle('active');
    navMenu.classList.toggle('active');
});

// Close mobile menu when clicking on a nav link
document.querySelectorAll('.nav-link').forEach(link => {
    link.addEventListener('click', () => {
        hamburger.classList.remove('active');
        navMenu.classList.remove('active');
    });
});

// Smooth scrolling for navigation links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            const offset = 80;
            const targetPosition = target.offsetTop - offset;
            window.scrollTo({
                top: targetPosition,
                behavior: 'smooth'
            });
        }
    });
});

// Add scroll effect to navbar
const navbar = document.querySelector('.navbar');

window.addEventListener('scroll', () => {
    if (window.pageYOffset > 100) {
        navbar.style.boxShadow = '0 4px 12px rgba(0, 0, 0, 0.15)';
    } else {
        navbar.style.boxShadow = '0 4px 6px rgba(0, 0, 0, 0.1)';
    }
});

// Animate elements on scroll
const observerOptions = {
    threshold: 0.1,
    rootMargin: '0px 0px -100px 0px'
};

const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.style.opacity = '1';
            entry.target.style.transform = 'translateY(0)';
        }
    });
}, observerOptions);

// Observe feature cards
document.querySelectorAll('.feature-card').forEach(card => {
    card.style.opacity = '0';
    card.style.transform = 'translateY(20px)';
    card.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
    observer.observe(card);
});

// Word Analyzer Functionality
const textInput = document.getElementById('textInput');
const wordCount = document.getElementById('wordCount');
const charCount = document.getElementById('charCount');
const charNoSpaceCount = document.getElementById('charNoSpaceCount');
const sentenceCount = document.getElementById('sentenceCount');
const paragraphCount = document.getElementById('paragraphCount');
const readingTime = document.getElementById('readingTime');
const avgWordLength = document.getElementById('avgWordLength');
const longestWord = document.getElementById('longestWord');
const clearBtn = document.getElementById('clearBtn');
const copyStatsBtn = document.getElementById('copyStatsBtn');

// Function to count words
function countWords(text) {
    const trimmed = text.trim();
    if (trimmed === '') return 0;
    return trimmed.split(/\s+/).length;
}

// Function to count sentences
function countSentences(text) {
    if (text.trim() === '') return 0;
    const sentences = text.match(/[.!?]+/g);
    return sentences ? sentences.length : 0;
}

// Function to count paragraphs
function countParagraphs(text) {
    if (text.trim() === '') return 0;
    const paragraphs = text.split(/\n\n+/).filter(para => para.trim() !== '');
    return paragraphs.length;
}

// Function to calculate reading time (average 200 words per minute)
function calculateReadingTime(wordCount) {
    const minutes = Math.ceil(wordCount / 200);
    return minutes;
}

// Function to get average word length
function getAverageWordLength(text) {
    const words = text.trim().split(/\s+/).filter(word => word.length > 0);
    if (words.length === 0) return 0;
    const totalLength = words.reduce((sum, word) => sum + word.length, 0);
    return (totalLength / words.length).toFixed(1);
}

// Function to get longest word
function getLongestWord(text) {
    const words = text.trim().split(/\s+/).filter(word => word.length > 0);
    if (words.length === 0) return '-';
    const longest = words.reduce((max, word) => word.length > max.length ? word : max, '');
    return longest.length > 15 ? longest.substring(0, 15) + '...' : longest;
}

// Update statistics
function updateStats() {
    const text = textInput.value;
    
    // Word count
    const words = countWords(text);
    wordCount.textContent = words;
    
    // Character count
    charCount.textContent = text.length;
    
    // Character count without spaces
    charNoSpaceCount.textContent = text.replace(/\s/g, '').length;
    
    // Sentence count
    sentenceCount.textContent = countSentences(text);
    
    // Paragraph count
    paragraphCount.textContent = countParagraphs(text);
    
    // Reading time
    const minutes = calculateReadingTime(words);
    readingTime.textContent = minutes === 1 ? '1 min' : `${minutes} min`;
    
    // Average word length
    avgWordLength.textContent = getAverageWordLength(text);
    
    // Longest word
    longestWord.textContent = getLongestWord(text);
}

// Event listeners for text input
textInput.addEventListener('input', updateStats);
textInput.addEventListener('paste', () => {
    setTimeout(updateStats, 10);
});

// Clear button
clearBtn.addEventListener('click', () => {
    textInput.value = '';
    updateStats();
    textInput.focus();
});

// Copy statistics button
copyStatsBtn.addEventListener('click', () => {
    const stats = `Text Statistics:
Words: ${wordCount.textContent}
Characters: ${charCount.textContent}
Characters (no spaces): ${charNoSpaceCount.textContent}
Sentences: ${sentenceCount.textContent}
Paragraphs: ${paragraphCount.textContent}
Reading Time: ${readingTime.textContent}
Average Word Length: ${avgWordLength.textContent}
Longest Word: ${longestWord.textContent}`;
    
    navigator.clipboard.writeText(stats).then(() => {
        const originalText = copyStatsBtn.textContent;
        copyStatsBtn.textContent = 'Copied!';
        setTimeout(() => {
            copyStatsBtn.textContent = originalText;
        }, 2000);
    }).catch(err => {
        console.error('Failed to copy stats:', err);
    });
});

// Initialize stats on page load
updateStats();
