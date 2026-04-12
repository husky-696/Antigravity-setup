# Installation Guide — Antigravity Setup Library

---

## Prerequisites

- [Antigravity IDE](https://antigravity.codes) installed
- A terminal with `cp` and `mkdir` available
- Git (for cloning and version control)

---

## Installation Methods

### Method 1: Full Install (Recommended for First Time)

This installs global rules + skills and gives you a workspace template.

```bash
# 1. Clone the repo
git clone https://github.com/YOUR_USERNAME/Antigravity-setup.git
cd Antigravity-setup

# 2. Install global rules
cp global/GEMINI.md ~/.gemini/GEMINI.md

# 3. Install global skills
mkdir -p ~/.gemini/antigravity/skills
cp -r global/skills/* ~/.gemini/antigravity/skills/

# 4. Verify
ls ~/.gemini/GEMINI.md
ls ~/.gemini/antigravity/skills/
```

### Method 2: Per-Project Install

Run this from **your project's root directory**:

```bash
SETUP_DIR="/path/to/Antigravity-setup"

# Create workspace config directories
mkdir -p .agent/rules .agent/workflows

# Copy workspace rules
cp "$SETUP_DIR/workspace/rules/"* .agent/rules/

# Copy workflows
cp "$SETUP_DIR/workspace/workflows/"* .agent/workflows/

# (Optional) Add stack-specific rules
# Choose ONE that matches your project:
cp "$SETUP_DIR/stacks/typescript-node/rules.md" .agent/rules/stack.md
# cp "$SETUP_DIR/stacks/react-nextjs/rules.md" .agent/rules/stack.md
# cp "$SETUP_DIR/stacks/python-fastapi/rules.md" .agent/rules/stack.md
```

### Method 3: Cherry-Pick

Only want specific pieces? Copy individual files:

```bash
# Just the safety guardrails
cp /path/to/Antigravity-setup/workspace/rules/safety-guardrails.md .agent/rules/

# Just the debug skill
cp -r /path/to/Antigravity-setup/global/skills/debug-systematic ~/.gemini/antigravity/skills/

# Just the bug-fix workflow
cp /path/to/Antigravity-setup/workspace/workflows/fix-bug.md .agent/workflows/
```

---

## Customization

### Editing Global Rules

Open `~/.gemini/GEMINI.md` in any editor. The file is organized into sections — modify or remove sections that don't apply to you.

**Keep total size under 2,000 tokens.** Global rules are loaded on every single interaction, so every word has a cost.

### Adding Stack Rules

The `stacks/` directory contains technology-specific rule packs. To create your own:

1. Create `stacks/your-stack/rules.md`
2. Define your stack's conventions, patterns, and gotchas
3. Copy it to your project: `cp stacks/your-stack/rules.md .agent/rules/stack.md`

### Creating Custom Skills

```bash
mkdir -p ~/.gemini/antigravity/skills/my-skill
```

Create `SKILL.md`:

```markdown
---
name: my-skill
description: Brief description of when this skill should activate.
---

# My Custom Skill

## When to Use
- Trigger condition 1
- Trigger condition 2

## Instructions
1. Step one...
2. Step two...

## Examples
### Good
...
### Bad
...
```

### Creating Custom Workflows

Create a file in `.agent/workflows/my-workflow.md`:

```markdown
# Workflow: My Custom Workflow

## Trigger
`/my-workflow`

## Objective
What this workflow accomplishes.

## Steps
1. First step...
2. Second step...
3. ...

## Exit Criteria
- Condition for "done"
```

---

## Verification

After installation, open Antigravity IDE and ask:

1. **"What global rules do you have?"** — Should describe your GEMINI.md contents
2. **"What skills are available?"** — Should list all installed skills by name
3. **"What workflows can I use?"** — Should list available slash commands

---

## Updating

```bash
cd /path/to/Antigravity-setup
git pull

# Re-copy global files
cp global/GEMINI.md ~/.gemini/GEMINI.md
cp -r global/skills/* ~/.gemini/antigravity/skills/

# Re-copy workspace files (from your project root)
cp /path/to/Antigravity-setup/workspace/rules/* .agent/rules/
cp /path/to/Antigravity-setup/workspace/workflows/* .agent/workflows/
```

---

## Troubleshooting

| Problem | Solution |
|:--------|:---------|
| Agent doesn't mention rules | Check `~/.gemini/GEMINI.md` exists and is valid Markdown |
| Skills not activating | Verify the `description` field in frontmatter is specific enough |
| Workflows not available | Check files are in `.agent/workflows/` (not `.agents/workflows/`) |
| Too many tokens used | Reduce rule file sizes; move details to skill `references/` directories |
| Rules conflict | Workspace rules override global rules; stack rules layer on top |
