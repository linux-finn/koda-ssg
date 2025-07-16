# Complete Koda Site Maintenance & Management Guide for Arch Linux
stephenfinnegan.com - Your comprehensive reference for managing your Koda SSG blog

Updated: July 2025 - Reflecting current site configuration, bug fixes, and best practices

## Quick Start Checklist

**Every time you work on your site:**
1. `cd /DATA/AppData/koda-ssg`
2. `source koda-env/bin/activate`
3. Create/edit content
4. `python koda.py` (build)
5. `./deploy.sh` (deploy)

## Table of Contents
1. [Daily Operations](#daily-operations)
2. [Content Management](#content-management)
3. [Ephemera Posts](#ephemera-posts)
4. [Troubleshooting Guide](#troubleshooting-guide)
5. [File Transfer & Image Management](#file-transfer--image-management)
6. [Date Format Guidelines](#date-format-guidelines)
7. [Common Errors & Fixes](#common-errors--fixes)
8. [Site Configuration](#site-configuration)
9. [Backup & Recovery](#backup--recovery)
10. [Quick Reference](#quick-reference)

## Daily Operations

### Starting Your Work Session
Always begin here:
```bash
cd /DATA/AppData/koda-ssg
source koda-env/bin/activate
Terminal Issues (Fixed)
If you get Error opening terminal: xterm-kitty:

export TERM=xterm-256color
Or add to ~/.bashrc: echo 'export TERM=xterm-256color' >> ~/.bashrc

Writing a New Post
# Blog post
vim content/posts/your-post-title.md

# Photo post
vim content/photos/photo-name.md

# Status update
vim content/status/status-name.md

# Ephemera post
vim content/ephemera/post-name.md
Basic Vim Commands
i - Enter insert mode
Esc - Exit insert mode
:wq - Save and quit
:q! - Quit without saving
Publishing Changes
Essential 2-step process:

# Build the site
python koda.py

# Deploy to live site
./deploy.sh
Previewing Before Publishing
# Start local preview server
cd site
python -m http.server 9000
# Visit: http://localhost:9000
# Press Ctrl+C to stop
Content Management
Current Site Structure
Navigation: Blog | Photos | Projects | Bits | About

Additional pages:

Contact (/contact.html)
Now (/now.html)
Defaults (/defaults.html)
Status Logbook (/status.html)
Ephemera (/ephemera.html)
Content Templates
Blog Post Template:
---
title: Your Post Title
date: 2025-07-06
excerpt: Brief description for search engines and homepage preview
tags: [tag1, tag2, tag3]
---

Your content goes here in **Markdown** format.

## Subheadings work great

- Lists are supported
- As are [links](https://example.com)
- And `code snippets`

SF.
Photo Post Template:
---
title: Photo Title
date: 2025-07-06
image: /static/images/photo.jpg
---

Description of the photo...
Status Update Template:
---
date: 2025-07-06T15:30:00
---

Your micro-post content here...
Ephemera Post Template:
---
date: 2025-07-06T15:30:00
---

**LINK** · Interesting article about something

Brief description or your thoughts about the link and why it's worth sharing.

[Read more](https://example.com)
File Transfer & Image Management
Transferring Images from Local Machine
From your local Arch Linux machine:

# Method 1: rsync (preferred)
rsync -avz ~/Downloads/photo.jpg stephen@192.168.0.9:~/

# Method 2: scp
scp ~/Downloads/photo.jpg stephen@192.168.0.9:~/
On the server:

# Move to images directory
mv ~/photo.jpg /DATA/AppData/koda-ssg/static/images/

# Or copy if you want to keep original
cp ~/photo.jpg /DATA/AppData/koda-ssg/static/images/
Image Optimization (Arch Linux)
# Install optimization tools
sudo pacman -S imagemagick jpegoptim optipng

# Optimize images
jpegoptim --size=500k static/images/photo.jpg
optipng -o5 static/images/photo.png

# Convert to WebP
magick static/images/photo.jpg static/images/photo.webp
Date Format Guidelines
CRITICAL: Different content types use different date formats!

Photo Posts
date: 2025-07-06
Simple date format
No time component
No quotes
Status Posts & Ephemera Posts
date: 2025-07-06T15:30:00
DateTime format with time
Use current time
No quotes
Blog Posts
date: 2025-07-06
Simple date format like photos
No time component
Wrong formats that will cause errors:

date: "2025-07-06" (with quotes)
date: 2025-07-06T[current-time]:00 (placeholder text)
Mixing date and datetime formats in same content type
Common Errors & Fixes
Error: TypeError: can't compare datetime.datetime to datetime.date
Cause: Mixed date formats in photo posts
Fix: This has been fixed in koda.py (line 150), but if it happens again:

Check all photo posts have proper date format: date: 2025-07-06
No photo post should have datetime format: date: 2025-07-06T15:30:00
If error persists, the code fix is:
# In koda.py line 150, change:
'date': parsed['frontmatter'].get('date', datetime.now()),
# To:
'date': parsed['frontmatter'].get('date', datetime.now().date()),
Error: Error opening terminal: xterm-kitty
Fix:

export TERM=xterm-256color
Error: python: can't open file
Cause: Running commands together without spaces
Fix: Run commands separately:

python koda.py
./deploy.sh
Error: rsync: link_stat failed: No such file or directory
Cause: Wrong filename or running from wrong machine
Fix:

Check actual filename: ls ~/Downloads/*.jpg
Make sure you're on local machine, not server
Use actual filename, not placeholder
Error: SSH connection issues
Fix:

# Remove old host key
ssh-keygen -f "$HOME/.ssh/known_hosts" -R '192.168.0.9'

# Try connection again
ssh stephen@192.168.0.9
Troubleshooting Workflow
Site Won't Build
Check for syntax errors in frontmatter
Verify date formats are correct for content type
Check for missing content directories:
mkdir -p content/{posts,pages,photos,status,ephemera}
File is Empty After Vim
Cause: Didn't save properly in vim
Fix:

Check file size: ls -la content/photos/filename.md
If 0 bytes, re-edit and use :wq to save
Commands Not Working
Make sure you're in right directory: cd /DATA/AppData/koda-ssg
Make sure virtual environment is active: source koda-env/bin/activate
Check for typos in commands
Site Configuration
Navigation Structure
Current navigation in templates/base.html:

<div class="nav-links">
    <a href="/blog.html">Blog</a>
    <a href="/photos.html">Photos</a>
    <a href="/projects.html">Projects</a>
    <a href="/bits.html">Bits</a>
    <a href="/about.html">About</a>
</div>
Main Configuration Files
koda.py - Main site generator
templates/base.html - Navigation and site structure
templates/index.html - Homepage layout
static/css/style.css - Styling
Backup & Recovery
Quick Backup
# Content only
tar -czf content-backup-$(date +%Y%m%d).tar.gz content/

# Full site backup
tar -czf koda-backup-$(date +%Y%m%d).tar.gz content/ static/ templates/ koda.py
Git Integration (Recommended)
# Initialize git if not done
git init
git add .
git commit -m "Initial setup"

# Daily workflow
git add .
git commit -m "Content update: $(date +%Y-%m-%d)"
Performance Tips
Content Creation Workflow
Plan content type first - determines date format
Use descriptive filenames - helps with organization
Optimize images before upload - faster site loading
Preview locally - catch issues before deploying
Keep content focused - Koda's strength is simplicity
File Management
# Check content stats
ls content/posts/ | wc -l  # Blog posts count
ls content/photos/ | wc -l # Photo posts count
ls content/status/ | wc -l # Status posts count

# Check image sizes
du -sh static/images/*
Quick Reference
Essential Commands
Task	Command
Navigate to Koda	cd /DATA/AppData/koda-ssg
Activate environment	source koda-env/bin/activate
Fix terminal	export TERM=xterm-256color
New blog post	vim content/posts/title.md
New photo post	vim content/photos/title.md
New status update	vim content/status/title.md
New ephemera post	vim content/ephemera/title.md
Build site	python koda.py
Deploy site	./deploy.sh
Preview locally	cd site && python -m http.server 9000
Transfer file	rsync -avz ~/file.jpg stephen@192.168.0.9:~/
Move to images	mv ~/file.jpg static/images/
File Locations
Content Type	Location	Date Format
Blog posts	content/posts/	2025-07-06
Photo posts	content/photos/	2025-07-06
Status updates	content/status/	2025-07-06T15:30:00
Ephemera posts	content/ephemera/	2025-07-06T15:30:00
Static pages	content/pages/	2025-07-06
Images	static/images/	N/A
Templates	templates/	N/A
CSS	static/css/	N/A
Vim Quick Reference
Action	Command
Enter insert mode	i
Exit insert mode	Esc
Save and quit	:wq
Quit without saving	:q!
Search	/searchterm
Go to line	:150
Content Type Decision Tree
Writing about your thoughts/experiences? → Blog post
Sharing a photo/screenshot? → Photo post
Quick update/micro-thought? → Status post
Sharing interesting link/discovery? → Ephemera post
Static information about you? → Page

Recent Fixes Applied
July 6, 2025 Updates
Fixed date comparison error in photo posts (koda.py line 150)
Added terminal compatibility for xterm-kitty
Improved file transfer workflow with rsync
Enhanced error handling documentation
Streamlined vim workflow for content creation
Known Working Configuration
System: Arch Linux
Python: Default Arch python (aliased from python3)
Terminal: Works with xterm-256color export
File Transfer: rsync preferred over scp
Content Types: All working with proper date formats
Deployment: Automated with deploy.sh script
Monthly Maintenance Tasks
Content Review
Update Now page with current activities
Review and update outdated posts
Check all external links in ephemera posts
Review tag usage and consistency
Update Defaults page with new tools
Update Projects page with new work
Technical Maintenance
Create backup: tar -czf backup-$(date +%Y%m%d).tar.gz content/
Update system: sudo pacman -Syu
Check for broken links in ephemera posts
Optimize images if site is getting slow
Clean old backups
System Health
Check disk space: df -h /DATA
Monitor site performance
Test backup and restore process
Verify all content types building correctly
Remember These Key Points
✅ Different content types use different date formats
✅ Always activate virtual environment before working
✅ Use vim for editing on server (nano has terminal issues)
✅ Run commands separately with spaces between them
✅ Test builds locally before deploying
✅ Use rsync for file transfers (more reliable than scp)
✅ Keep content simple and focused
✅ Document any custom changes you make
✅ This guide is living documentation - update as you learn

Support Resources
Koda SSG Repository: github.com/linux-finn/koda-ssg
Markdown Guide: markdownguide.org
Arch Linux Wiki: wiki.archlinux.org
Vim Tutorial: Run vimtutor in terminal
This Guide: Save and update as reference
Your Koda setup is stable and battle-tested! This guide reflects real-world usage and fixes applied. Keep it updated as you discover new techniques or encounter new situations.

Last Updated: July 6, 2025
Site Version: Powered by Koda SSG v1.1.0
System: Arch Linux with verified fixes
Status: Production-ready with all major bugs resolved
