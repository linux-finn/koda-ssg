#!/bin/bash

# Koda SSG Theme Switcher
# Usage: ./switch-theme.sh [theme-name]

THEMES=("default" "material" "bootstrap" "readthedocs" "minimal" "magazine")

if [ $# -eq 0 ]; then
    echo "Available themes:"
    for theme in "${THEMES[@]}"; do
        echo "  - $theme"
    done
    echo ""
    echo "Usage: ./switch-theme.sh [theme-name]"
    echo ""
    echo "Current theme:"
    grep "CURRENT_THEME = " koda.py
    exit 1
fi

THEME=$1

# Check if theme exists
if [[ ! " ${THEMES[@]} " =~ " ${THEME} " ]]; then
    echo "Error: Theme '$THEME' not found!"
    echo "Available themes: ${THEMES[*]}"
    exit 1
fi

# Update koda.py
sed -i "s/CURRENT_THEME = '[^']*'/CURRENT_THEME = '$THEME'/" koda.py

echo "✅ Switched to '$THEME' theme!"
echo "📁 Run 'python koda.py' to rebuild with new theme."

# Show current theme
echo ""
echo "Current theme setting:"
grep "CURRENT_THEME = " koda.py
