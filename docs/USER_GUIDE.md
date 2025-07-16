```markdown
# Koda SSG User Guide

Complete guide for using Koda SSG to create and manage your static website.

## Getting Started

### Initial Setup
```bash
# Navigate to your project
cd your-koda-project

# Activate virtual environment
source koda-env/bin/activate

# Verify installation
python koda.py --help
```

### Daily Workflow
```bash
# 1. Activate environment
source koda-env/bin/activate

# 2. Create content
nano content/posts/my-new-post.md

# 3. Build site
python koda.py

# 4. Preview locally
cd site && python -m http.server 8000
# Visit: http://localhost:8000

# 5. Deploy (if you have a deploy script)
./deploy.sh
```

## Content Creation

### Content Types Overview

Koda supports multiple content types, each with specific purposes:

| Type | Purpose | Location | Date Format |
|------|---------|----------|-------------|
| **Blog** | Long-form articles | `content/posts/` | `2025-07-06` |
| **Photos** | Image galleries | `content/photos/` | `2025-07-06` |
| **Status** | Micro-posts | `content/status/` | `2025-07-06T15:30:00` |
| **Ephemera** | Link sharing | `content/ephemera/` | `2025-07-06T15:30:00` |
| **Pages** | Static content | `content/pages/` | `2025-07-06` |

### Content Templates

#### Blog Post Template
```markdown
---
title: Your Post Title
date: 2025-07-06
excerpt: Brief description for search engines and homepage preview
tags: [technology, web, tutorial]
---

# Your Post Title

Your content goes here in **Markdown** format.

## Subheadings work great

- Lists are supported
- As are [links](https://example.com)
- And `code snippets`

Write your thoughts, experiences, and tutorials here.
```

#### Photo Post Template
```markdown
---
title: Photo Title
date: 2025-07-06
image: /static/images/photo.jpg
---

Description of the photo, the story behind it, or technical details about how it was taken.
```

#### Status Update Template
```markdown
---
date: 2025-07-06T15:30:00
---

Your micro-post content here. Keep it short and focused - like a tweet but on your own site.
```

#### Ephemera Post Template
```markdown
---
date: 2025-07-06T15:30:00
---

**LINK** · Interesting article about something

Brief description or your thoughts about the link and why it's worth sharing.

[Read more](https://example.com)
```

#### Static Page Template
```markdown
---
title: About
order: 1
---

# About Me

Static content that doesn't change often. Perfect for About pages, Contact info, etc.
```

## Critical Date Format Rules

⚠️ **Different content types use different date formats!**

### Simple Date Format
Used for: Blog posts, Photo posts, Static pages
```yaml
date: 2025-07-06
```
- No time component
- No quotes around the date
- YYYY-MM-DD format

### DateTime Format  
Used for: Status updates, Ephemera posts
```yaml
date: 2025-07-06T15:30:00
```
- Includes time component
- Use current time or specific time
- No quotes around the date

### Common Date Format Errors
❌ **Don't do this:**
```yaml
date: "2025-07-06"          # Has quotes
date: 2025-07-06T15:30:00   # Wrong format for blog posts
date: 2025-07-06            # Wrong format for status posts
```

## Image Management

### Adding Images
1. Place images in `static/images/` directory
2. Reference in content: `/static/images/photo.jpg`
3. For photo posts, use the `image` frontmatter field

### Image Optimization Tips
- Optimize images before adding them to your site
- Use descriptive filenames
- Consider WebP format for better compression
- Keep images under 1MB for faster loading

### Image Optimization Commands
```bash
# JPEG optimization (if jpegoptim installed)
jpegoptim --size=500k static/images/photo.jpg

# PNG optimization (if optipng installed)  
optipng -o5 static/images/photo.png

# Convert to WebP (if ImageMagick installed)
magick static/images/photo.jpg static/images/photo.webp
```

## Site Building & Preview

### Building Your Site
```bash
# Build the site
python koda.py
```

This generates your static site in the `site/` directory.

### Local Preview
```bash
# Start preview server
cd site
python -m http.server 8000

# Visit in browser
# http://localhost:8000

# Stop server
# Press Ctrl+C
```

### Project Structure
```
your-koda-project/
├── koda.py                 # Main generator script
├── requirements.txt        # Python dependencies
├── content/               # Your content (Markdown files)
│   ├── posts/            # Blog posts
│   ├── pages/            # Static pages
│   ├── photos/           # Photo posts
│   ├── status/           # Status updates
│   └── ephemera/         # Link sharing
├── templates/            # HTML templates
├── static/              # Static assets (CSS, images)
│   ├── css/
│   └── images/
└── site/                # Generated website (after build)
```

## Customization

### Styling
- Edit `static/css/style.css` to customize appearance
- Modify colors, typography, layout, spacing
- Koda's strength is simplicity - keep changes minimal

### Templates
- Modify files in `templates/` directory
- `base.html` - Overall site structure and navigation
- `index.html` - Homepage layout
- `post.html` - Individual blog post layout
- `page.html` - Static page layout

### Navigation
Edit the navigation in `templates/base.html`:
```html
<div class="nav-links">
    <a href="/blog.html">Blog</a>
    <a href="/photos.html">Photos</a>
    <a href="/projects.html">Projects</a>
    <a href="/about.html">About</a>
</div>
```

## Troubleshooting

### Site Won't Build
1. Check for syntax errors in YAML frontmatter
2. Verify date formats are correct for content type
3. Ensure all content directories exist:
   ```bash
   mkdir -p content/{posts,pages,photos,status,ephemera}
   ```

### File is Empty After Editing
1. Check file size: `ls -la content/posts/filename.md`
2. If 0 bytes, re-edit and save properly
3. Make sure your editor saved the file

### Commands Not Working
1. Ensure you're in the project directory
2. Verify virtual environment is active: `source koda-env/bin/activate`
3. Check for typos in commands
4. Run commands separately, not together

### Common Error Messages

**"Error opening terminal"**
- Solution: `export TERM=xterm-256color`

**"TypeError: can't compare datetime.datetime to datetime.date"**
- Cause: Mixed date formats in same content type
- Solution: Check all posts use correct date format for their type

**"python: can't open file"**
- Cause: Running commands without spaces
- Solution: Run `python koda.py` and `./deploy.sh` separately

## Best Practices

### Content Creation
- Plan content type first (determines date format)
- Use descriptive filenames for organization
- Optimize images before uploading
- Preview locally before deploying
- Keep content focused - Koda's strength is simplicity

### File Organization
- Use consistent naming conventions
- Group related content logically
- Keep static assets organized in subdirectories

### Performance
- Optimize images for web
- Keep CSS minimal
- Test site loading speed regularly
- Monitor generated site size

## Backup & Version Control

### Git Integration
```bash
# Initialize git (if not done)
git init
git add .
git commit -m "Initial setup"

# Daily workflow
git add .
git commit -m "Add new content"
git push origin main
```

### Manual Backups
```bash
# Content only
tar -czf content-backup-$(date +%Y%m%d).tar.gz content/

# Full project backup
tar -czf site-backup-$(date +%Y%m%d).tar.gz content/ static/ templates/ koda.py
```

## Deployment

Koda generates static HTML that can be deployed anywhere:

### Popular Hosting Options
- **GitHub Pages** - Free hosting with Git integration
- **Netlify** - Drag-and-drop deployment or Git-based
- **Vercel** - Git-based deployment with automatic builds
- **Traditional hosting** - Upload `site/` folder contents

### Basic Deployment Process
1. Build your site: `python koda.py`
2. Upload contents of `site/` directory to your web host
3. Point your domain to the hosting service

## Quick Reference

### Essential Commands
| Task | Command |
|------|---------|
| Activate environment | `source koda-env/bin/activate` |
| New blog post | `nano content/posts/title.md` |
| New photo post | `nano content/photos/title.md` |
| New status update | `nano content/status/title.md` |
| Build site | `python koda.py` |
| Preview locally | `cd site && python -m http.server 8000` |

### Content Type Decision Tree
- **Writing about thoughts/experiences?** → Blog post
- **Sharing a photo/screenshot?** → Photo post  
- **Quick update/micro-thought?** → Status post
- **Sharing interesting link/discovery?** → Ephemera post
- **Static information that rarely changes?** → Page

## Getting Help

- **Documentation**: Check this guide and other docs in the `docs/` folder
- **Issues**: Report bugs or request features on GitHub
- **Community**: Join discussions on the project repository

---

*This guide covers the essentials of using Koda SSG. For advanced customization and development, see the other documentation files.*
```
