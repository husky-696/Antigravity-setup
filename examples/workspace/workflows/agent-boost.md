# /agent-boost — Workflow & Capability Upgrade

Use this workflow when the user wants the agent to work faster, make fewer mistakes, improve slash commands, strengthen rules, or optimize project automation.

## Steps

1. **Inventory** existing `.agent`, `.gemini`, `AGENTS.md`, scripts, docs, tests, and stack files.
2. **Find friction**: repeated manual steps, missing validation commands, unclear rules, weak safety guardrails, or absent slash workflows.
3. **Add capability** in the smallest useful unit: a rule, workflow, skill note, script, or README section.
4. **Prefer reusable commands** over long instructions. Document the trigger, inputs, steps, and exit criteria.
5. **Strengthen validation** by listing exact lint, typecheck, test, build, format, and preview commands.
6. **Keep context lean** by moving specialized guidance out of global rules and into targeted workflows.
7. **Report** what changed, which slash commands are now available, and how to use them next.

## Exit Criteria

- The project has clear rules for safety, code quality, progress reporting, and validation.
- At least one repeatable slash workflow exists for the user's highest-friction task.
- The agent can identify the stack, run the right checks, and avoid destructive actions.
- Documentation tells a new teammate exactly which command to use next.
