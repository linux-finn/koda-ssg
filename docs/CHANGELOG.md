# Changelog

All notable changes to Koda SSG will be documented in this file.

# Changelog

All notable changes to Koda SSG will be documented in this file.

## [1.2.0] - 2025-07-17

### 🎨 Major Theme System Release

#### Added
- **Complete Theme System** with 6 professional themes:
  - Material Design theme with dark/light mode toggle
  - Bootstrap theme with professional corporate styling
  - ReadTheDocs theme with documentation-focused layout
  - Minimal theme with ultra-clean typography
  - Magazine theme with editorial layout and mobile optimization
  - Default theme (original design preserved)
- **Theme Switching System** with `./switch-theme.sh` script
- **Mobile-First Responsive Design** across all themes
- **Perfect Photo Display** with natural aspect ratios on all themes
- **Theme Configuration System** integrated into koda.py
- **Professional Template Architecture** using Jinja2 inheritance

#### Enhanced
- **Mobile Optimization** for all themes with proper breakpoints
- **Photo Display System** with consistent 700px max-width on desktop
- **Template Context System** for theme variables and configuration
- **Content Type Support** across all themes (blog, photos, status, ephemera)

#### Technical Improvements
- Theme directory structure: `templates/themes/[theme-name]/`
- CSS organization: `static/css/themes/[theme-name]/`
- Automatic theme fallback system
- Template inheritance with base.html patterns
- Responsive design patterns across all themes

## [Unreleased]

### Planned
- Theme customization documentation
- Additional theme variations
- Theme preview screenshots
- Performance optimizations

## [1.0.0] - 2025-07-16

### Added
- Initial release of Koda SSG
- Support for multiple content types (blog, photos, status, ephemera)
- Minimal, typography-focused design
- RSS feed generation
- Mobile-responsive templates
- Markdown content with YAML frontmatter
- Static site generation with Python
- Deployment automation

### Fixed
- Date comparison error in photo posts (koda.py line 150)
- Terminal compatibility for xterm-kitty
- File transfer workflow improvements

### Technical Features
- Python 3.7+ compatibility
- Jinja2 templating
- YAML frontmatter parsing
- Automatic content type detection
- Clean URL structure
