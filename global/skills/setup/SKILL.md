---
name: 🧭 setup
description: Instant project initialization and workspace configuration.
category: core
---

# Project Setup

Use `/setup` to instantly configure a new workspace or project for elite development.

## Setup Workflow
1. **Analyze Environment**: Detect stack (Next.js, Expo, Supabase, etc.).
2. **Apply Rules**: Copy core `.agent/rules` for code quality, safety, progress, and optional premium themes and icon polish.
3. **Install Workflows**: Add slash workflows such as `/build-feature`, `/fix-bug`, `/theme`, and `/agent-boost`.
4. **Configure Tools**: Initialize Bun, Prettier, and ESLint if missing.
5. **Activate Skills**: Verify the correct `/elite-*`, `/themes`, and `/agent-boost` skills are active.

## Core Templates
- **Rules**: `code-quality.md`, `safety-guardrails.md`, `progress-reporting.md`, `premium-themes.md`, and stack overlays.
- **Workflows**: `/setup-project`, `/build-feature`, `/fix-bug`, `/refactor`, `/theme`, and `/agent-boost`.
- **Scripts**: Prefer existing project scripts; add `dev`, `lint`, `test`, and `build` only when the project lacks them.

## Commands
- `/setup-init`: Performs a full workspace audit and configuration.
- `/setup-stack`: Adds stack-specific rules to an existing project.
- `/setup-all`: Installs workspace rules, workflows, theme and icon guidance, and stack detection.
