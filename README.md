```markdown
# Koda SSG 🎨

> A powerful Python static site generator with beautiful themes and mobile-first design

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Python 3.7+](https://img.shields.io/badge/python-3.7+-blue.svg)](https://www.python.org/downloads/)
[![Themes](https://img.shields.io/badge/themes-6-brightgreen.svg)](#-themes)

Koda SSG transforms your content into beautiful websites with **6 professional themes**. Built for writers, developers, and creators who want stunning sites without complexity.

## 🎨 Themes

Choose from 6 carefully crafted themes, each with unique aesthetics:

| Theme | Style | Best For |
|-------|-------|----------|
| **🎯 Material** | Modern cards, dark/light mode | Tech blogs, portfolios |
| **💼 Bootstrap** | Professional, corporate | Business sites, documentation |
| **📚 ReadTheDocs** | Clean documentation layout | Technical docs, guides |
| **✨ Minimal** | Ultra-clean typography | Writers, minimalists |
| **📰 Magazine** | Editorial layout | Publications, media sites |
| **📝 Default** | Original minimal design | Personal blogs |

### 🔄 Easy Theme Switching

```bash
# Switch themes instantly
./switch-theme.sh material     # Modern Material Design
./switch-theme.sh bootstrap    # Professional corporate
./switch-theme.sh readthedocs  # Documentation style
./switch-theme.sh minimal      # Ultra-clean typography
./switch-theme.sh magazine     # Editorial magazine
./switch-theme.sh default      # Original minimal

# Build with new theme
python koda.py
```

## ✨ Features

- **🎨 6 Professional Themes** - Material, Bootstrap, ReadTheDocs, Minimal, Magazine, Default
- **📱 Mobile-First Design** - All themes optimized for mobile and desktop
- **⚡ Lightning Fast** - Minimal CSS, no JavaScript bloat
- **📝 Multiple Content Types** - Blog posts, photos, status updates, ephemera
- **🔧 Easy Theme Switching** - Change your site's look in seconds
- **📸 Perfect Photo Display** - Natural aspect ratios across all themes
- **🚀 Markdown-Powered** - Write in Markdown with YAML frontmatter
- **📡 RSS Feeds** - Automatically generated
- **🌐 Deploy Anywhere** - Works with any static hosting service
- **🔀 Git-Friendly** - File-based workflow

## 🚀 Quick Start

```bash
# Clone and setup
git clone https://github.com/linux-finn/koda-ssg.git
cd koda-ssg
python3 -m venv koda-env
source koda-env/bin/activate
pip install -r requirements.txt

# Try different themes
./switch-theme.sh material
python3 koda.py

# Preview your site
cd site && python3 -m http.server 8000
```

Visit `http://localhost:8000` to see your site!

## 📱 Mobile Responsive

All themes are optimized for:
- **📱 Mobile phones** - Touch-friendly navigation
- **💻 Desktop** - Full-featured layouts
- **📊 Tablets** - Adaptive grid systems
- **🖼️ Photos** - Natural aspect ratios on all devices

## 🛠 Content Types

| Type | Purpose | Location | Date Format |
|------|---------|----------|-------------|
| **Blog** | Long-form articles | `content/posts/` | `2025-07-17` |
| **Photos** | Image galleries | `content/photos/` | `2025-07-17` |
| **Status** | Micro-posts | `content/status/` | `2025-07-17T15:30:00` |
| **Pages** | Static content | `content/pages/` | `2025-07-17` |
| **Ephemera** | Link sharing | `content/ephemera/` | `2025-07-17T15:30:00` |

## 🎯 Theme Showcase

### 🎯 Material Design
Modern card-based design with:
- Material Design principles
- Dark/light mode toggle
- Smooth animations
- Material icons

### 💼 Bootstrap
Professional corporate styling with:
- Bootstrap 5 components
- Responsive grid system
- Business-friendly aesthetics
- Professional navigation

### 📚 ReadTheDocs
Clean documentation layout with:
- Fixed sidebar navigation
- Professional typography
- Search-friendly structure
- Breadcrumb navigation

### ✨ Minimal
Ultra-clean typography focus with:
- Maximum whitespace
- Elegant simplicity
- Typography-first design
- Distraction-free reading

### 📰 Magazine
Editorial layout with:
- Hero sections
- Featured content areas
- Magazine-style typography
- Editorial color schemes

### 📝 Default
Original minimal design with:
- Clean typography
- Simple navigation
- Fast loading
- Classic aesthetics

## 🚀 Deployment

Koda generates static HTML that works everywhere:

```bash
# Build your site
python koda.py

# Deploy to any static host:
# - GitHub Pages
# - Netlify  
# - Vercel
# - AWS S3
# - Any web server
```

## 🔧 Daily Workflow

```bash
# Start your session
cd /path/to/koda-ssg
source koda-env/bin/activate

# Switch theme (optional)
./switch-theme.sh magazine

# Create content
nano content/posts/new-post.md

# Build and preview
python koda.py
cd site && python -m http.server 8000

# Deploy (if using deploy script)
./deploy.sh
```

## 📚 Documentation

- **[User Guide](docs/USER_GUIDE.md)** - Complete usage guide
- **[Maintenance Guide](docs/MAINTENANCE_GUIDE.md)** - Technical operations
- **[Theme Development](docs/THEMES.md)** - Creating custom themes
- **[Changelog](docs/CHANGELOG.md)** - Version history

## 🛠 Built With

- **Python 3.7+** - Core language
- **Jinja2** - Templating engine  
- **Markdown** - Content formatting
- **PyYAML** - Frontmatter parsing

## 🌟 Perfect For

- **👥 Personal blogs** - Share your thoughts with style
- **📸 Photography sites** - Showcase your work beautifully
- **💼 Business websites** - Professional online presence
- **📖 Documentation** - Technical guides and manuals
- **📰 Publications** - Magazine-style content sites
- **🎨 Portfolios** - Creative showcase sites

## 🤝 Contributing

Contributions welcome! Areas where we'd love help:

- **🎨 New themes** - Create additional design options
- **🔧 Features** - Enhance core functionality  
- **📱 Mobile improvements** - Better responsive design
- **📚 Documentation** - Improve guides and examples
- **🐛 Bug fixes** - Help make Koda more reliable

Please read our [contributing guidelines](CONTRIBUTING.md) first.

## 📄 License

MIT License - see [LICENSE](LICENSE) for details.

## 🏆 Why Choose Koda SSG?

- **🎨 Beautiful themes out of the box** - No design skills required
- **📱 Mobile-first approach** - Your site looks great everywhere
- **⚡ Blazing fast performance** - Minimal overhead, maximum speed
- **🔧 Simple yet powerful** - Easy to use, flexible to customize
- **🚀 Deploy anywhere** - No vendor lock-in
- **📝 Content-focused** - Built for writers and creators

---

**[Stephen Finnegan](https://stephenfinnegan.com)** - Creator and maintainer

*Built with ❤️ for the modern web*
```
