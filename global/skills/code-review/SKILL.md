---
name: code-review
description: Performs a structured code review when the user asks to review, audit, or check code quality. Activates for requests like "review this code", "check for issues", or "audit this file."
---

# Code Review Skill

## When to Use
- User asks to review, audit, or critique code
- User asks "is this code good?" or "any issues with this?"
- User asks for a PR/MR review

## Review Process

### Step 1: Scope
Identify the files to review. If the user hasn't specified:
- Check the current active file
- Check recently modified files (via `git diff` or `git status`)

### Step 2: Read Efficiently
- Read only the relevant files and line ranges
- Don't read test files unless reviewing test quality specifically
- Don't read config files unless the review is about configuration

### Step 3: Analyze (Use This Checklist)

**Critical Issues** (must fix):
- [ ] Security vulnerabilities (injection, exposed secrets, auth bypass)
- [ ] Logic errors (wrong conditions, off-by-one, null handling)
- [ ] Data loss risks (missing error handling, no rollback)
- [ ] Race conditions or concurrency issues

**Important Issues** (should fix):
- [ ] Missing error handling or edge cases
- [ ] Performance problems (N+1 queries, unnecessary loops, memory leaks)
- [ ] Missing input validation
- [ ] Broken or missing types (in typed languages)

**Suggestions** (nice to have):
- [ ] Code readability improvements
- [ ] Naming clarity
- [ ] Dead code or unused imports
- [ ] Opportunities for DRY/extraction

### Step 4: Report

Format the review as:

```
## Code Review: [file/feature name]

### 🔴 Critical
- [Issue with file:line reference]

### 🟡 Important  
- [Issue with file:line reference]

### 🟢 Suggestions
- [Suggestion with file:line reference]

### ✅ What's Good
- [Positive observation]
```

## Rules
- Always include at least ONE positive observation
- Reference specific line numbers
- Suggest fixes, don't just identify problems
- Keep the review under 500 words unless the code is very complex
