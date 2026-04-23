---
name: ⭐ setup-project
description: Automatically sets up workspace-specific rules, workflows, and stack-specific guidelines for a new project using the Antigravity Setup Library.
---

# Project Setup Skill

## When to Use
- You are starting a new project or entering an unconfigured workspace.
- The user asks to "setup the project", "configure workspace", or "add project rules".

## Setup Protocol

### Phase 1: Environment Analysis
1. **Identify the project stack.** Look at:
   - `package.json` (Node, React, Next.js, etc.)
   - `requirements.txt` or `pyproject.toml` (Python, FastAPI, etc.)
   - `go.mod`, `Cargo.toml`, etc.
2. **Locate the Antigravity Setup Library.** 
   - Check if the environment variable `ANTIGRAVITY_SETUP_DIR` is set.
   - If not, check if `~/Desktop/projects/Antigravity-setup` exists (common default).
   - If not found, ask the user for the path to the setup repository.

### Phase 2: Configuration Recommendation
1. **Suggest a Stack Rule Pack.** 
   - Match the project stack to a directory in `stacks/` (e.g., `typescript-node`, `react-nextjs`).
2. **Suggest Workspace Templates.**
   - Rules: `code-quality.md`, `safety-guardrails.md`, `progress-reporting.md`
   - Workflows: `build-feature.md`, `fix-bug.md`, `refactor.md`

### Phase 3: Execution
1. **Create target directories:** `.agent/rules` and `.agent/workflows`.
2. **Copy the selected files.**
   - Copy stack rules to `.agent/rules/stack.md`.
   - Copy workspace rules and workflows to their respective directories.
3. **Customize if needed.** Briefly check the copied files and offer to tune them for the specific project.

### Phase 4: Skill Fetching & Verification
1. **Identify missing specific skills.** If the project requires something specialized (e.g., `convex`, `inngest`, `clerk-auth`) not in the curated set:
   - Use `bunx antigravity-awesome-skills --path ~/.gemini/antigravity/skills --tags <specialty>` to fetch them.
2. **Verify activation.** Ensure the user knows which `/skills` are now active for their project.

## Automation Script
If you have access to a shell, you can run the setup script directly:
```bash
/path/to/Antigravity-setup/setup.sh --with-workspace .
```

## Anti-Patterns
- ❌ Don't overwrite existing `.agent` configs without asking.
- ❌ Don't copy unnecessary stacks (e.g., don't add Python rules to a Node project).
- ❌ Don't forget to explain what you are adding and why.

## How to Invoke
- Use `/setup-project` when starting a task in this domain.
- I will apply these patterns and best practices immediately.