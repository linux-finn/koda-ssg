# Installation Guide

## System Requirements

- Python 3.7 or higher
- Linux, macOS, or Windows
- Git (for cloning the repository)

## Installation Methods

### Method 1: Clone from GitHub (Recommended)

```bash
# Clone the repository
git clone https://github.com/linux-finn/koda-ssg.git
cd koda-ssg

# Create virtual environment
python3 -m venv koda-env
source koda-env/bin/activate  # On Windows: koda-env\Scripts\activate

# Install dependencies
pip install -r requirements.txt

Method 2: Download ZIP

Download the ZIP file from GitHub releases
Extract to your desired directory
Follow the same virtual environment setup as above

Linux-Specific Setup
If you encounter virtual environment issues on Debian/Ubuntu:

# Install required packages
sudo apt update
sudo apt install python3-venv python3-pip

# Then proceed with normal installation

Verification
Test your installation:

# Activate virtual environment
source koda-env/bin/activate

# Build sample site
python3 koda.py

# Should output: "Site built successfully in site"

Next Steps

Read Content Creation Guide
Customize your site with Customization Guide
Deploy your site with Deployment Guide

### **docs/content.md**

```bash
nano docs/content.md

# Content Creation Guide

Learn how to create and manage content with Koda SSG.

## Content Types

Koda supports four types of content:

### 1. Blog Posts (`content/posts/`)

Blog posts are your main articles and writings.

**File naming:** Use descriptive filenames like `2025-07-01-my-first-post.md`

**Example:**
```markdown
---
title: Getting Started with Koda
date: 2025-07-01
excerpt: Learn how to build beautiful minimal websites with Koda SSG
tags: [koda, static-site, tutorial]
---

# Getting Started with Koda

Welcome to Koda! This static site generator helps you create beautiful, minimal websites.

## Why Choose Koda?

- Clean, minimal design
- Fast loading times
- Easy to customize
- Git-friendly workflow

Frontmatter options:

title (required): Post title
date (required): Publication date (YYYY-MM-DD)
excerpt (optional): Short description for listings
tags (optional): List of tags
slug (optional): Custom URL slug

2. Static Pages (content/pages/)
Static pages are for content like About, Contact, Projects.
Example:

---
title: About
order: 1
---

# About Me

I'm a developer who loves minimal design and clean code.

Frontmatter options:

title (required): Page title
order (optional): Navigation order (lower numbers first)
slug (optional): Custom URL slug

3. Photo Posts (content/photos/)
Share your photography with descriptions.
Example:

---
title: Mountain Sunrise
date: 2025-07-01
image: /static/images/mountain-sunrise.jpg
---

Caught this incredible sunrise during my morning hike in the Rockies.

Frontmatter options:

title (optional): Photo title
date (required): Date taken/posted
image (required): Path to image file

4. Status Updates (content/status/)
Micro-blog posts for quick thoughts and updates.
Example:

---
date: 2025-07-01T14:30:00
---

Just shipped a new feature! Feeling great about the clean implementation.

Frontmatter options:

date (required): Timestamp with time

Markdown Features
Koda supports full Markdown syntax:

Typography

# Heading 1
## Heading 2
### Heading 3

**Bold text**
*Italic text*
`Inline code`

Lists

- Unordered list
- Another item

1. Ordered list
2. Another item

Links and Images

[Link text](https://example.com)
![Alt text](/static/images/photo.jpg)

Code Blocks

```python
def hello_world():
    print("Hello, Koda!")
```

Quotes

> This is a blockquote
> It can span multiple lines

Managing Images
For Photo Posts

Add images to static/images/
Reference them in frontmatter: image: /static/images/photo.jpg

For Content Images

Add images to static/images/
Reference in markdown: ![Description](/static/images/photo.jpg)

Content Organization
Recommended Structure

content/
├── posts/
│   ├── 2025-07-01-welcome.md
│   ├── 2025-07-02-koda-features.md
│   └── 2025-07-03-deployment.md
├── pages/
│   ├── about.md
│   ├── projects.md
│   └── contact.md
├── photos/
│   ├── sunrise-hike.md
│   └── city-nights.md
└── status/
    ├── 2025-07-01-excited.md
    └── 2025-07-02-shipping.md

Tips

Use descriptive filenames for better organization
Include excerpts for better post previews
Tag posts for future organization features
Keep status updates short and conversational
Use high-quality images for photo posts
Write in a conversational, personal tone

### **docs/customization.md**

```bash
nano docs/customization.md

# Customization Guide

Make Koda your own with these customization options.

## Basic Customization

### Site Information

Edit `templates/base.html` to update:

```html
<!-- Change site title -->
<title>{% block title %}Your Name{% endblock %}</title>

<!-- Update navigation -->
<a href="/" class="home-link">Your Name</a>

Colors and Typography
Edit static/css/style.css:

/* Main colors */
body {
    color: #333;           /* Main text color */
    background-color: #fff; /* Background */
}

/* Links */
a {
    color: #333;           /* Link color */
}

a:hover {
    color: #666;           /* Hover color */
}

/* Typography */
body {
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
    font-size: 16px;       /* Base font size */
    line-height: 1.6;      /* Line spacing */
}

Advanced Customization
Adding New Page Types

Create template in templates/:

<!-- templates/portfolio.html -->
{% extends "base.html" %}
{% block title %}Portfolio - Your Name{% endblock %}
{% block content %}
<h1>Portfolio</h1>
<!-- Your custom layout -->
{% endblock %}

Modify koda.py to handle new content type:

# Add to load_content method
portfolio_dir = self.source_dir / "portfolio"
if portfolio_dir.exists():
    # Handle portfolio files

Custom CSS Classes
Add utility classes to style.css:

/* Utility classes */
.text-center { text-align: center; }
.text-muted { color: #666; }
.mb-large { margin-bottom: 3rem; }

/* Custom components */
.highlight-box {
    background: #f8f9fa;
    padding: 1.5rem;
    border-radius: 8px;
    margin: 2rem 0;
}

Navigation Customization
Modify templates/base.html:

<div class="nav-links">
    <a href="/blog.html">Writing</a>
    <a href="/projects.html">Work</a>
    <a href="/photos.html">Photos</a>
    <a href="/about.html">About</a>
    <!-- Add custom pages -->
    <a href="/portfolio.html">Portfolio</a>
</div>

Theme Variations
Dark Mode
Add to style.css:

@media (prefers-color-scheme: dark) {
    body {
        background-color: #1a1a1a;
        color: #e0e0e0;
    }
    
    a {
        color: #e0e0e0;
    }
    
    a:hover {
        color: #b0b0b0;
    }
}

Custom Fonts
Add Google Fonts or custom fonts:

@import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap');

body {
    font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
}

Layout Variations
Modify container width in style.css:

.container {
    max-width: 800px;  /* Wider layout */
    /* or */
    max-width: 600px;  /* Narrower layout */
}

Template Customization
Homepage Layout
Edit templates/index.html:

{% extends "base.html" %}
{% block content %}
<!-- Custom homepage content -->
<div class="hero-section">
    <h1>Welcome to my digital garden</h1>
    <p class="lead">Thoughts, projects, and discoveries.</p>
</div>

<!-- Rest of content -->
{% endblock %}

Post Layout
Customize templates/post.html:

<!-- Add reading time -->
<div class="post-meta">
    <time>{{ post.date.strftime('%B %d, %Y') }}</time>
    <span class="reading-time">5 min read</span>
</div>

<!-- Add tags -->
{% if post.tags %}
<div class="post-tags">
    {% for tag in post.tags %}
    <span class="tag">{{ tag }}</span>
    {% endfor %}
</div>
{% endif %}

RSS Customization
Edit the generate_rss method in koda.py:

def generate_rss(self):
    # Update RSS metadata
    SubElement(channel, 'title').text = "Your Blog Title"
    SubElement(channel, 'link').text = "https://yourdomain.com"
    SubElement(channel, 'description').text = "Your blog description"

Configuration File
Create config.yaml for settings:

site:
  title: "Your Name"
  description: "Personal blog and thoughts"
  url: "https://yourdomain.com"
  author: "Your Name"

build:
  posts_per_page: 10
  recent_posts: 5

social:
  twitter: "@yourhandle"
  github: "yourusername"

Then load in koda.py:

import yaml

with open('config.yaml', 'r') as f:
    config = yaml.safe_load(f)

Tips

Test changes locally before deploying
Keep backups of working configurations
Use Git to track customization changes
Start with small changes and build up
Consider mobile responsiveness for all customizations

### **docs/deployment.md**

```bash
nano docs/deployment.md

# Deployment Guide

Deploy your Koda site to various hosting platforms.

## GitHub Pages

### Method 1: Manual Deployment

```bash
# Build your site
python3 koda.py

# Create gh-pages branch
git checkout -b gh-pages

# Copy site contents to root
cp -r site/* .

# Commit and push
git add .
git commit -m "Deploy site"
git push origin gh-pages

Method 2: GitHub Actions (Recommended)
Create .github/workflows/deploy.yml:

name: Deploy to GitHub Pages

on:
  push:
    branches: [ main ]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    
    - name: Setup Python
      uses: actions/setup-python@v2
      with:
        python-version: '3.9'
    
    - name: Install dependencies
      run: |
        pip install -r requirements.txt
    
    - name: Build site
      run: python3 koda.py
    
    - name: Deploy to GitHub Pages
      uses: peaceiris/actions-gh-pages@v3
      with:
        github_token: ${{ secrets.GITHUB_TOKEN }}
        publish_dir: ./site

Netlify
Drag and Drop

Build your site: python3 koda.py
Drag the site/ folder to Netlify dashboard
Your site is live!

Git Integration

Connect your GitHub repository
Set build command: python3 koda.py
Set publish directory: site
Deploy!

netlify.toml Configuration

[build]
  command = "python3 koda.py"
  publish = "site"

[build.environment]
  PYTHON_VERSION = "3.9"

[[redirects]]
  from = "/*"
  to = "/index.html"
  status = 404

Vercel
CLI Deployment

# Install Vercel CLI
npm i -g vercel

# Build site
python3 koda.py

# Deploy
cd site
vercel --prod

Git Integration

Connect repository to Vercel
Set build command: python3 koda.py
Set output directory: site

AWS S3

# Build site
python3 koda.py

# Sync to S3 bucket
aws s3 sync site/ s3://your-bucket-name --delete

# Enable static website hosting in S3 console

Custom Server
Upload the site/ directory contents to any web server:

# Example: rsync to your server
rsync -avz site/ user@yourserver.com:/var/www/html/

Domain Configuration
Custom Domain on GitHub Pages

Add CNAME file to your repository root:

yourdomain.com

Configure DNS:

Type: CNAME
Name: www
Value: yourusername.github.io

Custom Domain on Netlify

Add domain in Netlify dashboard
Update DNS to point to Netlify

Build Automation
Build Script
Create build.sh:

#!/bin/bash
set -e

echo "Building Koda site..."

# Activate virtual environment
source koda-env/bin/activate

# Build site
python3 koda.py

echo "Build complete!"

Make executable:

chmod +x build.sh

Pre-deploy Checks
Create scripts/pre-deploy.py:

#!/usr/bin/env python3
"""Pre-deployment checks for Koda site"""

import os
import sys
from pathlib import Path

def check_required_files():
    """Check if all required files exist"""
    required = [
        'site/index.html',
        'site/static/css/style.css',
        'site/rss.xml'
    ]
    
    for file_path in required:
        if not Path(file_path).exists():
            print(f"❌ Missing: {file_path}")
            return False
    
    print("✅ All required files present")
    return True

def check_links():
    """Basic link checking"""
    # Add your link checking logic here
    print("✅ Links checked")
    return True

if __name__ == "__main__":
    if not check_required_files():
        sys.exit(1)
    
    if not check_links():
        sys.exit(1)
    
    print("🚀 Ready for deployment!")

Performance Optimization
Image Optimization
Use tools like imagemin to optimize images:

# Install imagemin-cli
npm install -g imagemin-cli imagemin-mozjpeg imagemin-pngquant

# Optimize images
imagemin static/images/* --out-dir=static/images --plugin=mozjpeg --plugin=pngquant

Gzip Compression
Most hosting platforms enable this automatically, but for custom servers:

# nginx configuration
gzip on;
gzip_types text/css application/javascript text/plain application/xml;

Monitoring
Analytics
Add to templates/base.html:

<!-- Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=GA_TRACKING_ID"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'GA_TRACKING_ID');
</script>

Uptime Monitoring
Use services like:

UptimeRobot
Pingdom
StatusCake

Troubleshooting
Common Issues
Build fails on hosting platform:

Check Python version compatibility
Verify all dependencies in requirements.txt
Check file permissions

CSS not loading:

Verify static files are copied correctly
Check relative vs absolute paths
Ensure hosting serves static files

404 errors:

Check file naming conventions
Verify routing configuration
Test links locally first

Best Practices

Test deployments on staging first
Use version control for all changes
Monitor site performance post-deployment
Keep build logs for debugging
Set up automated backups

### **docs/troubleshooting.md**

```bash
nano docs/troubleshooting.md

# Troubleshooting Guide

Common issues and solutions for Koda SSG.

## Installation Issues

### Python Virtual Environment Fails

**Problem:** `ensurepip is not available`

**Solution (Ubuntu/Debian):**
```bash
sudo apt install python3-venv
# or
sudo apt install python3.12-venv

Solution (Alternative):

sudo apt install python3-virtualenv
virtualenv koda-env

Module Import Errors
Problem: ModuleNotFoundError: No module named 'markdown'
Solution:

# Ensure virtual environment is activated
source koda-env/bin/activate

# Reinstall requirements
pip install -r requirements.txt

Build Issues
Empty Site Directory
Problem: No files generated in site/ directory
Checklist:

Virtual environment activated?
All templates present in templates/?
Content files exist in content/?
No Python errors in output?

Debug:

# Run with verbose output
python3 koda.py --verbose

# Check content structure
find content -name "*.md" -type f

Template Errors
Problem: TemplateNotFound: index.html
Solution:

# Verify template files exist
ls templates/

# Required templates:
# - base.html
# - index.html
# - blog.html
# - post.html
# - page.html
# - photos.html
# - status.html

YAML Frontmatter Errors
Problem: yaml.parser.ParserError
Common causes:

Missing quotes around dates with colons
Incorrect indentation
Special characters in titles

Solution:

---
title: "My Post: A Story"  # Quote titles with colons
date: 2025-07-01          # Simple date format
tags: [web, python]       # Simple array format
---

Preview Issues
Local Server Not Working
Problem: python3 -m http.server fails
Solution:

# Ensure you're in the site directory
cd site
pwd  # Should show /path/to/your/project/site

# Try different port
python3 -m http.server 8080

# Check if port is in use
lsof -i :8000

CSS Not Loading
Problem: Site appears unstyled
Checklist:

Are you serving from site/ directory?
Does site/static/css/style.css exist?
Are paths correct in templates?

Solution:

# Check static files were copied
ls -la site/static/css/

# Rebuild if missing
cd .. && python3 koda.py

404 Errors on Pages
Problem: Navigation links show 404
Common causes:

Missing content files
Empty content directories
Incorrect file naming

Solution:

# Check what was generated
find site -name "*.html" -type f

# Verify content exists
ls content/pages/
ls content/posts/

Content Issues
Posts Not Showing
Problem: Blog posts don't appear
Checklist:

Files in content/posts/?
Valid YAML frontmatter?
Required fields present?

Debug:

# Check post files
ls -la content/posts/

# Verify frontmatter format
head -10 content/posts/your-post.md

Dates Not Working
Problem: Posts appear in wrong order
Solution:

# Use consistent date format
---
date: 2025-07-01
# or
date: 2025-07-01T14:30:00
---

Photos Not Displaying
Problem: Images don't load in photo gallery
Checklist:

Image files exist in static/images/?
Correct paths in frontmatter?
Image URLs accessible?

Solution:

# Correct image path format
---
image: /static/images/photo.jpg  # Note leading slash
---

Deployment Issues
GitHub Pages Not Updating
Problem: Changes don't appear on live site

Solutions:

# Force rebuild (GitHub Actions)
git commit --allow-empty -m "Trigger rebuild"
git push

# Check GitHub Actions logs for errors
# Verify gh-pages branch is set as source

CSS Missing on Deployed Site
Problem: Styles work locally but not online

Solution:

<!-- Use absolute paths in templates -->
<link rel="stylesheet" href="/static/css/style.css">
<!-- not relative paths -->
<link rel="stylesheet" href="static/css/style.css">

Large File Issues
Problem: Site won't deploy due to file size

Solution:

# Check for large files
find . -size +100M

# Optimize images
# Use image compression tools
# Consider external image hosting

Performance Issues
Slow Build Times
Problem: python3 koda.py takes too long
Solutions:

Reduce number of content files
Optimize image processing
Use incremental builds (future feature)

Large Site Size
Problem: Generated site is too large

Solutions:

# Check site size
du -sh site/

# Optimize images
# Remove unused static files
# Minimize CSS

Development Issues
Changes Not Reflected
Problem: Updates don't appear in preview
Checklist:

Rebuilt site after changes?
Cleared browser cache?
Restarted local server?

Solution:

# Full rebuild process
python3 koda.py
cd site
python3 -m http.server 8000
# Hard refresh browser (Ctrl+Shift+R)

File Permission Errors
Problem: Can't write to directories

Solution:

# Check permissions
ls -la

# Fix permissions if needed
chmod 755 .
chmod -R 644 content/
chmod -R 755 templates/ static/

Common Error Messages
"Permission denied"

Check file permissions
Ensure you own the directories
Run without sudo when possible

"File not found"

Verify working directory
Check file paths in code
Ensure all required files exist

"YAML parsing error"

Validate YAML syntax online
Check for special characters
Ensure proper indentation

Community Support

🐛 Report bugs
💬 Ask questions
📧 Email support

Useful Commands

# Complete rebuild from scratch
rm -rf site/
python3 koda.py

# Check Python environment
which python3
pip show markdown jinja2 pyyaml

# Validate content files
find content -name "*.md" -exec head -5 {} \;

# Check template syntax
python3 -c "from jinja2 import Environment, FileSystemLoader; env = Environment(loader=FileSystemLoader('templates')); env.get_template('base.html')"

## **Step 3: Initialize Git Repository**

```bash
# Initialize git repository
git init

# Add all files
git add .

# Create initial commit
git commit -m "Initial commit: Koda Static Site Generator

- Complete Python-based static site generator
- Minimal design inspired by jarunmb.com  
- Support for blog posts, pages, photos, and status updates
- Mobile-responsive design
- Automatic RSS feed generation
- Comprehensive documentation"
