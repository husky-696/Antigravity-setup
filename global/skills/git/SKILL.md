---
name: 🌿 git
description: Automated git commits (Conventional) and repository synchronization.
category: utility
---

# Git Commit & Sync

Use `/git` to manage your version control with precision and speed.

## Standard Workflow
1. **Stage**: Identify changed files and stage appropriately.
2. **Commit**: Generate a message following **Conventional Commits**:
   - `feat:` for new features.
   - `fix:` for bug fixes.
   - `chore:` for maintenance.
   - `docs:` for documentation.
3. **Sync**: Pull latest changes and push your local commits.

## Commit Guidelines
- **Conciseness**: Keep the first line under 50 characters.
- **Clarity**: Explain *what* changed and *why*.
- **Atomicity**: One commit per logical change.

## Commands
- `/git-commit`: Stages all changes and generates a professional commit message.
- `/git-sync`: Performs a git pull followed by a git push.
- `/git-undo`: Safely reverts the last commit while keeping changes.
