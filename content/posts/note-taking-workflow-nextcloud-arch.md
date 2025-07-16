---
title: Building a Cross-Device Note-Taking Workflow with Nextcloud and Arch Linux
date: 2025-07-12
excerpt: A comprehensive guide to setting up Joplin, QOwnNotes, and RedNotebook with secure remote access via Tailscale VPN on a fresh Arch Linux installation.
tags: [arch-linux, nextcloud, joplin, workflow, productivity, ssh, tailscale, documentation, ssd, sync]
---

After upgrading to a 1TB SSD and doing a fresh Arch Linux installation, I decided to completely rebuild my note-taking workflow from the ground up. What started as a simple setup turned into a comprehensive system that handles everything from quick mobile capture to structured documentation and personal journaling.

## The Problem

I needed a note-taking system that could handle different types of content across multiple devices:

- **Quick capture** on mobile that syncs instantly
- **Structured documentation** for technical projects
- **Personal journaling** that stays private to my desktop machines
- **Secure remote access** from anywhere
- **Reliable sync** that works even with intermittent connectivity

## The Solution Architecture

After testing various combinations, I settled on a multi-application approach that leverages each tool's strengths:

### Application Stack

**Joplin** handles structured documentation and knowledge management. It syncs via WebDAV to my Nextcloud server and supports rich formatting, notebooks, tags, and end-to-end encryption. Perfect for technical docs, project notes, and anything that needs organisation.

**QOwnNotes** bridges the gap between mobile quick capture and desktop processing. It integrates directly with Nextcloud's Notes app, so anything I capture on my phone with QuillPad appears instantly on my desktop for proper formatting and filing.

**RedNotebook** manages personal journaling and daily reflection. It syncs at the file level through Nextcloud directories, keeping my personal thoughts separate from work content whilst maintaining cross-device access.

### Infrastructure

The backbone is a **Nextcloud server** running on Ubuntu 24.04 at home, accessible both locally (192.168.x.x:8082) and remotely via **Tailscale VPN**. This provides secure, encrypted access from anywhere without exposing services to the public internet.

**SSH access** with key-based authentication allows for remote server management and troubleshooting. The Tailscale mesh network means I can reach my home server from any device, anywhere, as if I were on my local network.

## Key Implementation Details

### Date Format Consistency

One of the trickiest parts was getting date formats right across different content types. Koda SSG (my static site generator) expects different formats for different post types:

- **Blog and photo posts**: `date: 2025-07-12`
- **Status and ephemera posts**: `date: 2025-07-12T15:30:00`

Mixing these formats causes build errors, so consistency is critical.

### Sync Architecture

The sync setup creates clear data flows:

- **Mobile (QuillPad)** → Nextcloud Notes → **QOwnNotes (Desktop)**
- **All Devices (Joplin)** → Nextcloud WebDAV
- **PC/Laptop (RedNotebook)** → Nextcloud Files

Each application handles its specific use case whilst maintaining a unified sync infrastructure.

### Security Considerations

- **SSH keys** without passphrases for convenience (acceptable risk for home network)
- **Tailscale VPN** provides end-to-end encryption for remote access
- **UFW firewall** blocks unnecessary incoming connections
- **Joplin encryption** protects sensitive documents at rest

## The Documentation Process

What started as setup notes evolved into a 15,000-word comprehensive guide covering:

- Fresh Arch Linux installation procedures
- SSD optimisation and maintenance
- Complete application configuration
- Troubleshooting common issues
- Disaster recovery procedures
- Performance monitoring scripts

Writing documentation whilst implementing forced me to think through edge cases and failure scenarios I might have otherwise missed. The act of explaining the setup revealed gaps in my understanding and led to better configuration choices.

## Lessons Learnt

**Multi-application approaches work** when each tool has a clear purpose. Rather than trying to force one application to handle everything, embracing specialised tools for specific content types creates a more robust workflow.

**Documentation during implementation is invaluable**. Taking time to document each step whilst setting up the system created a reference that's already proved useful for troubleshooting and will be essential for future reinstalls.

**SSD optimisation matters**. Proper TRIM setup, noatime mounting, and swappiness tuning make a noticeable difference in both performance and longevity.

**Backup procedures are only good if tested**. I built restore testing into the monthly maintenance schedule to ensure backups actually work when needed.

## Performance Results

The final setup delivers:

- **Sub-2 second** application startup times
- **Real-time sync** between mobile and desktop for quick notes
- **>99% sync reliability** across all applications
- **Secure remote access** from any location
- **1TB storage** with room for years of growth

## Future Enhancements

The modular architecture makes it easy to add new tools or expand capabilities:

- Calendar integration with RedNotebook for better daily planning
- Automated backup verification with email alerts
- Performance monitoring with Grafana dashboards
- Voice note transcription for mobile capture

## Conclusion

This workflow represents the sweet spot between functionality and complexity. Each component serves a specific purpose, the sync infrastructure is reliable and secure, and the whole system is maintainable by one person.

The time invested in proper setup and documentation pays dividends in daily productivity. Having the right tool for each type of content, accessible from any device, with secure remote access has fundamentally improved how I capture, process, and organise information.

Sometimes the best solutions aren't the simplest ones, but rather the ones that acknowledge the complexity of real-world use cases whilst maintaining operational simplicity.

SF.
