# Organization Shared Workflows

This repository contains reusable GitHub Actions workflows that can be used across all repositories in this organization/account.

## Quick Install

Run this command in any project to add auto-changelog:

```bash
mkdir -p .github/workflows && curl -so .github/workflows/docs.yml https://raw.githubusercontent.com/hahnsangkim/.github/main/examples/docs-workflow.yml
```

Then commit and push:
```bash
git add .github/workflows/docs.yml && git commit -m "ci: add auto-changelog workflow" && git push
```

---

## Available Workflows

### 1. Auto Changelog

Automatically generates and updates `CHANGELOG.md` from commit history using [auto-changelog](https://github.com/cookpete/auto-changelog).

**Manual setup (alternative to Quick Install):**

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

---

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

---

## Requirements

- The calling repository must have `contents: write` permission
- Works with public and private repositories
