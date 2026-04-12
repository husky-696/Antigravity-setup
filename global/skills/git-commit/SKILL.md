---
name: git-commit
description: Generates well-structured git commit messages following Conventional Commits. Activates when the user asks to commit, create a commit message, or stage changes.
---

# Git Commit Skill

## When to Use
- User asks to commit changes
- User asks for a commit message
- User says "commit this" or "save my changes"

## Commit Message Format

Follow [Conventional Commits](https://www.conventionalcommits.org/):

```
<type>(<scope>): <short description>

<optional body — only for complex changes>
```

### Types
| Type | When |
|:-----|:-----|
| `feat` | New feature or capability |
| `fix` | Bug fix |
| `refactor` | Code change that neither fixes a bug nor adds a feature |
| `style` | Formatting, semicolons, whitespace (no logic change) |
| `docs` | Documentation only |
| `test` | Adding or updating tests |
| `chore` | Build, tooling, dependency updates |
| `perf` | Performance improvement |

### Rules
- Subject line ≤ 72 characters
- Use imperative mood: "add feature" not "added feature"
- No period at the end of the subject line
- Scope is optional but encouraged (e.g., `feat(auth):`, `fix(api):`)
- Body is only needed if the "why" isn't obvious from the subject

### Examples

**Simple change:**
```
fix(auth): handle expired token gracefully
```

**Complex change:**
```
feat(api): add rate limiting to public endpoints

Implements a sliding window rate limiter at 100 req/min per IP.
Uses Redis for distributed state when available, falls back to
in-memory for single-instance deployments.
```

## Process

1. Check `git status` to see what's changed
2. Check `git diff --stat` for a summary
3. If changes span multiple concerns, suggest splitting into separate commits
4. Generate the commit message
5. Run the commit command (with user approval if needed)

## Anti-Patterns
- ❌ "Update files" — too vague
- ❌ "Fix bug" — which bug? where?
- ❌ Committing `.env` or secret files
- ❌ Giant commits with unrelated changes
