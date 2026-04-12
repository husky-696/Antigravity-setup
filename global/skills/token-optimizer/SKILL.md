---
name: token-optimizer
description: Activated when the agent needs to perform multi-file operations, large codebase exploration, or when the conversation is getting long. Provides strategies for minimizing token consumption while maintaining output quality.
---

# Token Optimizer Skill

## When to Use
- Tasks involving 3+ files
- Large codebases (>50 files)
- Conversations exceeding 10 turns
- User explicitly asks to "be efficient" or "save tokens"

## Core Strategies

### 1. Scout Before You Read

**Always** use lightweight tools first:

```
list_dir → grep_search → view_file (targeted)
```

Never jump straight to `view_file` on the entire file. Use this escalation ladder:

| Need | Tool | Token Cost |
|:-----|:-----|:-----------|
| "Does X exist?" | `list_dir` | ~50 |
| "Where is X used?" | `grep_search` | ~100 |
| "What does function X do?" | `view_file` (targeted range) | ~200 |
| "How does this file work?" | `view_file` (full file, up to 800 lines) | ~2,000+ |

### 2. Targeted File Reads

When you must read a file:
- Use `grep_search` first to find the relevant line numbers
- Then use `view_file` with `StartLine` and `EndLine` to read only what you need
- A 20-line read costs ~50 tokens. A 500-line read costs ~1,500 tokens.

### 3. Parallel Tool Calls

When you need information from multiple independent sources, make **parallel** tool calls:

```
✅ GOOD: list_dir + grep_search + grep_search (all at once)
❌ BAD:  list_dir → wait → grep_search → wait → grep_search
```

### 4. Context Reuse

- If you've already read a file in this conversation, reference your earlier understanding
- Don't re-read a file unless the user has explicitly modified it since you last read it
- Summarize long outputs internally rather than repeating them

### 5. Output Compression

- **Diffs over full files.** When showing changes, show only the changed lines with surrounding context.
- **Bullets over paragraphs.** Structured lists convey information more efficiently.
- **Skip obvious context.** Don't re-explain what the user already told you.
- **Batch updates.** If editing one file in multiple places, use `multi_replace_file_content` with multiple chunks, not separate calls.

### 6. The "Do I Need This?" Test

Before every file read, ask:
1. Do I already have this information from conversation context? → **Skip**
2. Can I get what I need from a grep instead? → **Grep**
3. Do I need the whole file or just a section? → **Targeted read**
4. Will this information change my approach? → If no, **skip**

## Token Budget Guidelines

| Task Type | Target Budget | Strategy |
|:----------|:-------------|:---------|
| Simple fix (1 file) | <3,000 tokens | Read only the relevant function |
| Feature (2-3 files) | <8,000 tokens | Scout → targeted reads → implement |
| Refactor (5+ files) | <15,000 tokens | Plan first, batch related changes |
| Exploration/audit | <10,000 tokens | Grep-first, read only flagged files |

## Anti-Patterns

- ❌ Reading `package.json` to check if a dependency exists (use `grep_search` instead)
- ❌ Reading an entire 500-line file to find one function definition
- ❌ Re-reading a file you read 2 turns ago with no modifications
- ❌ Making 5 separate `replace_file_content` calls on the same file
- ❌ Printing the full file content after making a 1-line change
