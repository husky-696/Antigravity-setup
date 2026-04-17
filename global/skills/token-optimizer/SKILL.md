---
name: token-optimizer
description: Activated when the agent needs to perform multi-file operations, large codebase exploration, or when the conversation is getting long. Provides strategies for minimizing token consumption while maintaining output quality.
---

# Token Optimizer Skill

## When to Use
- Working across more than 3 files in a single task
- Conversation has exceeded 10 back-and-forth exchanges
- User mentions the agent is "slow", "expensive", or "using too many tokens"
- Exploring a large or unfamiliar codebase for the first time

## Strategy: Progressive Discovery

### Level 1 — Structure (cheapest)
```
list_dir → understand folder layout → identify likely targets
```
Cost: ~20 tokens per directory

### Level 2 — Search (cheap)
```
grep_search → find exact locations of relevant code
```
Cost: ~30-50 tokens per search

### Level 3 — Targeted Read (moderate)
```
view_file with StartLine/EndLine → read only relevant sections
```
Cost: ~50-200 tokens per read (vs ~1,500 for a full file)

### Level 4 — Full Read (expensive, avoid)
```
view_file without line ranges → read entire file
```
Only use for: files under 100 lines, or when you truly need full context.

## Rules

### File Reading
- **Never read a file you've already read** in this conversation unless it was modified
- **Never read more than 50 lines** when grep already told you what you need
- **Always use parallel tool calls** when reading multiple independent files
- **Prefer grep over read** — if you just need to know "does X exist in file Y", grep it

### Output Compression
- **Diffs over full files** — after editing, show only what changed
- **Bullets over prose** — summarize in 3-5 bullet points
- **Skip the preamble** — no "I'll now proceed to..." or "Let me explain what I did"
- **One summary at the end** — don't summarize after every single edit

### Edit Efficiency
- **Batch non-contiguous edits** into a single `multi_replace_file_content` call
- **Don't re-read after editing** — you know what the file contains because you just wrote it
- **Move on after edits** — if the edit succeeded, proceed to the next step immediately. Don't re-verify unless there's a specific reason to doubt it worked.

### When Stuck
- If an edit fails, **diagnose once** then try a different approach
- If a second attempt fails, **stop and report** what happened
- **Never retry identical tool calls** — the result will be the same

## Anti-Patterns

- ❌ Reading an entire 500-line file to find a function name (use grep)
- ❌ Reading the same file 3 times in one conversation
- ❌ Showing the full updated file after making a 2-line change
- ❌ Writing "I'll now proceed to make the following changes..." before every edit
- ❌ Retrying a failed edit with the exact same arguments
- ❌ Asking "should I continue?" after every step
