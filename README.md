# Organization Shared Workflows

This repository contains reusable GitHub Actions workflows that can be used across all repositories in this organization/account.

## Available Workflows

### 1. Auto Changelog

Automatically generates and updates `CHANGELOG.md` from commit history using [auto-changelog](https://github.com/cookpete/auto-changelog).

**Usage in your repository:**

Create `.github/workflows/docs.yml`:

```yaml
name: Update Documentation

on:
  push:
    branches: [main]
    paths:
      - 'lib/**'
      - 'components/**'
      - 'src/**'

jobs:
  changelog:
    uses: hahnsangkim/.github/.github/workflows/auto-changelog.yml@main
```

**With custom options:**

```yaml
jobs:
  changelog:
    uses: hahnsangkim/.github/.github/workflows/auto-changelog.yml@main
    with:
      commit-limit: '50'           # Limit commits per version
      template: 'keepachangelog'   # Template: keepachangelog, compact, json
      output-file: 'CHANGELOG.md'  # Output filename
```

## Commit Message Convention

For best changelog results, use [Conventional Commits](https://www.conventionalcommits.org/):

| Prefix | Description | Changelog Section |
|--------|-------------|-------------------|
| `feat:` | New feature | ✨ Features |
| `fix:` | Bug fix | 🐛 Bug Fixes |
| `docs:` | Documentation | 📝 Documentation |
| `style:` | Formatting | 💄 Styles |
| `refactor:` | Code refactoring | ♻️ Refactoring |
| `perf:` | Performance | ⚡ Performance |
| `test:` | Tests | ✅ Tests |
| `build:` | Build system | 📦 Build |
| `ci:` | CI/CD | 👷 CI |
| `chore:` | Maintenance | 🔧 Chores |

**Examples:**
```
feat: add user authentication
fix: resolve login timeout issue
docs: update API documentation
refactor: simplify database queries
```

## Setup Instructions

1. Create a repository named `.github` in your GitHub account
2. Copy the contents of this folder to that repository
3. Push to GitHub
4. Use the workflows in any of your other repositories

## Requirements

- The calling repository must have `contents: write` permission
- Works with public and private repositories

