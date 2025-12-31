#!/bin/bash
# Initialize documentation automation for a new project
# Usage: curl -s https://raw.githubusercontent.com/hahnsangkim/.github/main/scripts/init-docs.sh | bash

set -e

echo "🚀 Initializing documentation setup..."
echo ""

# Create directory structure
echo "📁 Creating directory structure..."
mkdir -p .github/workflows docs/guides docs/features docs/archive

# Download workflow file
echo "📥 Downloading auto-docs workflow..."
curl -so .github/workflows/docs.yml https://raw.githubusercontent.com/hahnsangkim/.github/main/examples/docs-workflow.yml

# Download changelog config
echo "📥 Downloading changelog config..."
curl -so .auto-changelog https://raw.githubusercontent.com/hahnsangkim/.github/main/examples/.auto-changelog

# Create docs index
echo "📝 Creating docs/README.md..."
cat > docs/README.md << 'EOF'
# Documentation

This folder contains all project documentation, organized by purpose.

## Structure

| Folder | Purpose |
|--------|---------|
| `/guides` | How-to guides (deployment, testing, etc.) |
| `/features` | Feature documentation |
| `/archive` | Historical implementation notes |

## Core Docs (in root)

- `README.md` - Project overview
- `ARCHITECTURE.md` - System design and configuration
- `CHANGELOG.md` - Version history (auto-generated)
- `CONTRIBUTING.md` - Contribution guidelines
EOF

# Create ARCHITECTURE.md template if it doesn't exist
if [ ! -f "ARCHITECTURE.md" ]; then
  echo "📝 Creating ARCHITECTURE.md template..."
  cat > ARCHITECTURE.md << 'EOF'
# 🏗️ Technical Architecture

## Overview

[Brief description of the project architecture]

## Tech Stack

| Layer | Technology |
|-------|------------|
| Frontend | |
| Backend | |
| Database | |
| Deployment | |

## Project Structure

```
src/
├── components/
├── lib/
└── app/
```

## Configuration

[Document key configuration values here]

## Data Flow

[Describe how data flows through the system]

---

*This document is kept up-to-date with the codebase. Last verified: [date]*
EOF
fi

echo ""
echo "✅ Documentation setup complete!"
echo ""
echo "Created:"
echo "  📄 .github/workflows/docs.yml (auto-changelog workflow)"
echo "  📄 .auto-changelog (changelog config)"
echo "  📁 docs/guides/"
echo "  📁 docs/features/"
echo "  📁 docs/archive/"
echo "  📄 docs/README.md"
if [ -f "ARCHITECTURE.md" ]; then
  echo "  📄 ARCHITECTURE.md (template)"
fi
echo ""
echo "Next steps:"
echo "  1. Create/update README.md"
echo "  2. Fill in ARCHITECTURE.md"
echo "  3. Commit and push:"
echo "     git add -A && git commit -m 'ci: add documentation automation' && git push"
echo ""
echo "📚 Use conventional commits for better changelogs:"
echo "   feat: add new feature"
echo "   fix: bug fix"
echo "   docs: documentation update"

