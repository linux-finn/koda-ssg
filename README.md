# Koda Static Site Generator

A minimal Python-based static site generator designed for clean, typography-focused personal websites and blogs. Inspired by the ultra-minimal aesthetic of sites like jarunmb.com.

![Koda Demo](https://img.shields.io/badge/demo-live-brightgreen)
![Python](https://img.shields.io/badge/python-3.7+-blue.svg)
![License](https://img.shields.io/badge/license-MIT-green.svg)

## ✨ Features

- **Ultra-minimal design** with abundant white space and clean typography
- **Fast-loading pages** with minimal CSS and no JavaScript bloat
- **Markdown-powered** content management with YAML frontmatter
- **Multiple content types**: Blog posts, static pages, photo galleries, micro-posts
- **Automatic RSS feed** generation
- **Mobile-responsive** design that works perfectly on all devices
- **Git-friendly workflow** with simple file-based content
- **Easy deployment** to any static hosting service

## 🚀 Quick Start

### Prerequisites

- Python 3.7 or higher
- Linux/macOS (Windows should work but untested)

### Installation

```bash
# Clone the repository
git clone https://github.com/linux-finn/koda-ssg.git
cd koda-ssg

# Create virtual environment
python3 -m venv koda-env
source koda-env/bin/activate

# Install dependencies
pip install -r requirements.txt

# Build the sample site
python3 koda.py

# Preview locally
cd site
python3 -m http.server 8000
# Visit http://localhost:8000

📁 Project Structure

koda-ssg/
├── koda.py              # Main generator script
├── requirements.txt     # Python dependencies
├── templates/           # Jinja2 HTML templates
│   ├── base.html       # Base template
│   ├── index.html      # Homepage
│   ├── blog.html       # Blog index
│   ├── post.html       # Individual blog post
│   ├── page.html       # Static pages
│   ├── photos.html     # Photo gallery
│   └── status.html     # Micro-posts
├── static/              # Static assets
│   └── css/
│       └── style.css   # Minimal CSS stylesheet
├── content/             # Your content (Markdown files)
│   ├── posts/          # Blog posts
│   ├── pages/          # Static pages
│   ├── photos/         # Photo posts
│   └── status/         # Micro-posts/status updates
└── site/               # Generated website (created on build)

✍️ Writing Content

Blog Posts
Create files in content/posts/ with YAML frontmatter:

---
title: My Blog Post
date: 2025-07-01
excerpt: A brief description of the post
tags: [python, web, minimal]
---

# My Blog Post

Your content goes here in **Markdown** format.

## Subheading

- Lists work great
- As do [links](https://example.com)
- And `code snippets`

Static Pages
Create files in content/pages/:

---
title: About
order: 1
---

# About Me

Tell your story here.

Photo Posts
Create files in content/photos/:

---
title: Beautiful Sunset
date: 2025-07-01
image: /static/images/sunset.jpg
---

Captured this amazing sunset from my balcony.

Status Updates (Micro-posts)
Create files in content/status/:

---
date: 2025-07-01T14:30:00
---

Just discovered this amazing new tool that solved my problem perfectly!

🎨 Customization
Styling
Edit static/css/style.css to customize:

Colors and typography
Layout and spacing
Responsive breakpoints

Templates
Modify templates in templates/ to change:

Page structure
Navigation layout
Content presentation

Site Configuration
Edit koda.py to update:

Site title and description
RSS feed settings
Build behavior

🚀 Deployment
Koda generates static HTML files that can be deployed anywhere:
GitHub Pages

# Build your site
python3 koda.py

# Push the site/ directory to your gh-pages branch
# Or use GitHub Actions (see docs/deployment.md)

Netlify

Build your site: python3 koda.py
Drag and drop the site/ folder to Netlify
Or connect your GitHub repo for automatic builds

Vercel, AWS S3, or any static host
Upload the contents of the site/ directory to your hosting service.
📚 Documentation

Installation Guide
Content Creation
Customization
Deployment
Troubleshooting

🤝 Contributing
Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.
📄 License
This project is licensed under the MIT License - see the LICENSE file for details.
🙏 Acknowledgments

Inspired by the minimal design of jarunmb.com
Built with Jinja2, Markdown, and PyYAML

📞 Support

🐛 Report bugs
💡 Request features
📖 Read the docs

Koda SSG - Simple, fast, and beautiful static sites.

### **LICENSE File**

```bash
nano LICENSE

MIT License

Copyright (c) 2025 Stephen

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

