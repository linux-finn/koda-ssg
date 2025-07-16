#!/bin/bash
# Koda backup script

cd /DATA/AppData/koda-ssg
DATE=$(date +%Y%m%d-%H%M%S)

# Create backup directory
mkdir -p /home/stephen/backups

# Backup content and configuration
tar -czf "/home/stephen/backups/koda-backup-$DATE.tar.gz" \
    content/ static/ templates/ koda.py requirements.txt deploy.sh

# Keep only last 7 backups
cd /home/stephen/backups
ls -t koda-backup-*.tar.gz | tail -n +8 | xargs rm -f 2>/dev/null || true

echo "Backup created: koda-backup-$DATE.tar.gz"
