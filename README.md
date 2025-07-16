# Koda SSG 🚀

> A minimal Python-based static site generator for clean, typography-focused websites.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Python 3.7+](https://img.shields.io/badge/python-3.7+-blue.svg)](https://www.python.org/downloads/)

Koda SSG is designed for writers and developers who want beautiful, fast-loading websites without the complexity of modern web frameworks. Built for the modern web with classic sensibilities.

## ✨ Features

- **Ultra-minimal design** with abundant white space and clean typography
- **Lightning fast** - No JavaScript bloat, minimal CSS
- **Multiple content types** - Blog posts, photos, status updates, ephemera
- **Markdown-powered** with YAML frontmatter
- **RSS feeds** automatically generated
- **Mobile-responsive** design that works everywhere
- **Git-friendly** workflow with file-based content
- **Deploy anywhere** - Works with any static hosting service

## 🚀 Quick Start

```bash
# Clone and setup
git clone https://github.com/linux-finn/koda-ssg.git
cd koda-ssg
python3 -m venv koda-env
source koda-env/bin/activate
pip install -r requirements.txt

# Create your first post
nano content/posts/hello-world.md

# Build and preview
python3 koda.py
cd site && python3 -m http.server 8000
```

Visit `http://localhost:8000` to see your site!

## 📚 Documentation

- **[User Guide](docs/USER_GUIDE.md)** - Complete guide for using Koda SSG
- **[Maintenance Guide](docs/MAINTENANCE_GUIDE.md)** - Technical operational guide
- **[Changelog](docs/CHANGELOG.md)** - Version history and updates

## 🎯 Perfect For

- Personal blogs and portfolios
- Photography sites
- Minimal business websites
- Technical documentation
- Anyone who values speed and simplicity

## 🛠️ Built With

- **Python 3.7+** - Core language
- **Jinja2** - Templating engine
- **Markdown** - Content formatting
- **PyYAML** - Frontmatter parsing

## 📦 Content Types

| Type | Purpose | Example |
|------|---------|---------|
| **Blog** | Long-form articles | `/content/posts/my-thoughts.md` |
| **Photos** | Image galleries | `/content/photos/sunset.md` |
| **Status** | Micro-posts | `/content/status/quick-update.md` |
| **Pages** | Static content | `/content/pages/about.md` |
| **Ephemera** | Link sharing | `/content/ephemera/interesting-link.md` |

## 🚀 Deployment

Koda generates static HTML that works anywhere:

- **GitHub Pages** - Free hosting with automatic builds
- **Netlify** - Drag-and-drop deployment
- **Vercel** - Git-based deployment
- **Any static host** - Upload the `site/` folder

## 🔧 Daily Workflow

```bash
# Start your session
cd /DATA/AppData/koda-ssg
source koda-env/bin/activate

# Create content
nano content/posts/new-post.md

# Build and deploy
python koda.py
./deploy.sh

# Commit to Git
git add .
git commit -m "Add new content"
git push origin main
```

## 🤝 Contributing

Contributions welcome! Please read our [contributing guidelines](CONTRIBUTING.md) first.

## 📄 License

MIT License - see [LICENSE](LICENSE) for details.

## 🙏 Acknowledgments

- Inspired by minimal design principles
- Built for the modern web with classic sensibilities

---

**[Stephen Finnegan](https://stephenfinnegan.com)** - Creator and maintainer
```
