---
name: ⚙️ setup
description: Instant project initialization and workspace configuration.
category: core
---

# Project Setup

Use `/setup` to instantly configure a new workspace or project for elite development.

## Setup Workflow
1. **Analyze Environment**: Detect stack (Next.js, Expo, Supabase, etc.).
2. **Apply Rules**: Copy core `.agent/rules` for code quality and safety.
3. **Configure Tools**: Initialize Bun, Prettier, and ESLint if missing.
4. **Activate Skills**: Verify the correct `/elite-*` skills are active.

## Core Templates
- **Rules**: `premium-ui.md`, `safety.md`, `git-flow.md`.
- **Scripts**: `dev.sh`, `deploy.sh`.

## Commands
- `/setup-init`: Performs a full workspace audit and configuration.
- `/setup-stack`: Adds stack-specific rules to an existing project.
