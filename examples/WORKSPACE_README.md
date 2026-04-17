# Workspace Examples

These are **example** rules and workflows you can copy into your project and customize.

## Quick Setup

From your project root:

```bash
# Create the config directories
mkdir -p .agent/rules .agent/workflows

# Copy everything
cp /path/to/Antigravity-setup/examples/workspace/rules/* .agent/rules/
cp /path/to/Antigravity-setup/examples/workspace/workflows/* .agent/workflows/

# Or use the installer
/path/to/Antigravity-setup/setup.sh --with-workspace .
```

## What's Included

### Rules (`.agent/rules/`)
| File | Purpose |
|:-----|:--------|
| `code-quality.md` | Code style, naming, and structure conventions |
| `safety-guardrails.md` | Protected files, destructive action prevention |
| `token-efficiency.md` | Minimize token waste, output compression |
| `progress-reporting.md` | Status updates, forward momentum, anti-stuck |

### Workflows (`.agent/workflows/`)
| File | Trigger | Purpose |
|:-----|:--------|:--------|
| `build-feature.md` | `/build-feature` | Plan → Build → Verify cycle |
| `fix-bug.md` | `/fix-bug` | Systematic debugging |
| `refactor.md` | `/refactor` | Safe code transformation |
| `setup-project.md` | `/setup-project` | New project scaffolding |

## Customization

These files are **yours to edit**. Common customizations:

- **Remove rules** that don't apply to your stack
- **Add stack rules**: `cp stacks/typescript-node/rules.md .agent/rules/stack.md`
- **Write your own workflows** for team-specific processes
- **Adjust token rules** based on your usage patterns

## Tips

- Keep total rule size under 3,000 tokens — every word has a per-turn cost
- Be specific, not aspirational — "use camelCase" beats "write clean code"
- Test your rules: ask the agent "what rules do you have?" after adding them
