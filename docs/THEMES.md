```markdown
# Theme Development Guide

This guide covers creating and customizing themes for Koda SSG.

## Theme Architecture

Koda SSG uses a template inheritance system with Jinja2. Each theme consists of:

```
templates/themes/[theme-name]/
├── base.html          # Base template with site structure
├── index.html         # Homepage layout
├── blog.html          # Blog listing page
├── post.html          # Individual blog post
├── page.html          # Static pages
├── photos.html        # Photo gallery
├── status.html        # Status updates
└── ephemera.html      # Link collection

static/css/themes/[theme-name]/
└── style.css          # Theme-specific styling
```

## Available Themes

### Material Design
- **Style**: Modern cards with Material Design principles
- **Features**: Dark/light mode toggle, Material icons, smooth animations
- **Best for**: Tech blogs, modern portfolios, app documentation

### Bootstrap
- **Style**: Professional corporate design
- **Features**: Bootstrap 5 components, responsive grid, business aesthetics
- **Best for**: Business sites, corporate blogs, professional portfolios

### ReadTheDocs
- **Style**: Clean documentation layout
- **Features**: Fixed sidebar, breadcrumbs, search-friendly structure
- **Best for**: Technical documentation, guides, API docs

### Minimal
- **Style**: Ultra-clean typography focus
- **Features**: Maximum whitespace, elegant simplicity, distraction-free
- **Best for**: Writers, minimalists, personal blogs

### Magazine
- **Style**: Editorial layout with featured content
- **Features**: Hero sections, editorial typography, magazine aesthetics
- **Best for**: Publications, media sites, content-heavy blogs

### Default
- **Style**: Original minimal design
- **Features**: Simple, fast, clean typography
- **Best for**: Personal blogs, simple sites

## Creating a New Theme

### 1. Create Theme Directory

```bash
mkdir -p templates/themes/mytheme
mkdir -p static/css/themes/mytheme
```

### 2. Add Theme to Configuration

Edit `koda.py` and add your theme to the `THEMES` dictionary:

```python
THEMES = {
    # ... existing themes
    'mytheme': {
        'template_dir': 'templates/themes/mytheme',
        'css_file': 'themes/mytheme/style.css'
    }
}
```

### 3. Create Base Template

Create `templates/themes/mytheme/base.html`:

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{% block title %}{{ site_title }}{% endblock %}</title>
    <link rel="stylesheet" href="/static/css/{{ theme_css }}">
</head>
<body>
    <!-- Your theme structure -->
    <main>
        {% block content %}{% endblock %}
    </main>
</body>
</html>
```

### 4. Create Required Templates

Copy and customize these templates from an existing theme:
- `index.html` - Homepage
- `blog.html` - Blog listing
- `post.html` - Individual posts
- `page.html` - Static pages
- `photos.html` - Photo gallery
- `status.html` - Status updates
- `ephemera.html` - Link collection

### 5. Create Theme CSS

Create `static/css/themes/mytheme/style.css` with your custom styles.

## Template Variables

### Available in All Templates

- `site_title` - Site name
- `current_year` - Current year
- `theme_css` - Path to theme CSS file
- `current_theme` - Active theme name

### Content-Specific Variables

#### Blog/Posts
- `posts` - List of all posts
- `recent_posts` - Recent posts (usually 3-5)
- `post` - Individual post object

#### Photos
- `photos` - List of photo objects

#### Status/Ephemera
- `status_posts` - Status update objects
- `ephemera_items` - Link/ephemera objects

## Mobile-First Design

All themes should be mobile-first with responsive breakpoints:

```css
/* Mobile first (default) */
.container {
    padding: 1rem;
}

/* Tablet and up */
@media (min-width: 768px) {
    .container {
        padding: 2rem;
    }
}

/* Desktop and up */
@media (min-width: 1024px) {
    .container {
        max-width: 800px;
        margin: 0 auto;
    }
}
```

## Photo Display Standards

All themes should display photos with natural aspect ratios:

```css
.photo-grid {
    display: block; /* Not grid */
}

.photo-item {
    margin-bottom: 3rem;
}

.photo-item img {
    width: 100%;
    height: auto; /* Natural aspect ratio */
    max-width: 700px; /* Constrain on desktop */
}
```

## Theme Switching

Users can switch themes with:

```bash
./switch-theme.sh mytheme
python koda.py
```

## Testing Your Theme

Test your theme with different content types:

```bash
# Switch to your theme
./switch-theme.sh mytheme

# Build and test
python koda.py
cd site && python -m http.server 8000

# Test on mobile and desktop
```

## Contributing Themes

We welcome theme contributions! Please:

1. Follow the architecture guidelines above
2. Ensure mobile responsiveness
3. Test with all content types
4. Include documentation
5. Submit a pull request

## Best Practices

- **Mobile-first** responsive design
- **Semantic HTML** structure
- **Accessible** color contrasts and navigation
- **Fast loading** with minimal CSS
- **Natural photo** aspect ratios
- **Consistent** content type support
- **Clean code** with comments
```
