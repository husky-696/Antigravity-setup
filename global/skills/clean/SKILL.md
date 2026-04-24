---
name: 🧹 clean
description: Codebase auditing, dependency pruning, and project structure optimization.
category: utility
---

# Codebase Cleanup

Use `/clean` to remove technical debt, unused code, and project clutter.

## Cleanup Protocol
1. **Unused Code**: Identify and remove dead exports, unused variables, and abandoned files.
2. **Dependencies**: Prune unused npm/bun packages. Audit for outdated versions.
3. **Structure**: Enforce consistent directory organization (e.g., move components to `/components`).
4. **Optimization**: Minify assets, clean up logs, and optimize large files.

## Best Practices
- **Pruning**: Use `depcheck` or similar to find unused packages.
- **Linting**: Run `eslint --fix` and `prettier --write` globally.
- **Hygiene**: Ensure `.gitignore` is comprehensive and no secrets are committed.

## Commands
- `/clean-audit`: Scans the project for junk, unused code, and structural issues.
- `/clean-run`: Executes a full cleanup (lint, prune, organize).
