# Progress & Execution Rules

> Ensures the agent reports status, doesn't get stuck, and moves forward decisively.

---

## Status Reporting

- After every file edit (success or failure), report what happened in **one line**.
- For multi-step tasks, maintain a **running checklist**:
  ```
  ✅ Created auth middleware
  ✅ Updated route handler
  ⏳ Writing tests...
  ⬚ Update README
  ```
- Never leave the user guessing. If you're thinking, say what you're thinking about.

## Forward Momentum

- **When an edit completes: move to the next step immediately.** Do not re-read the file you just edited. Do not re-verify unless there's a test to run.
- **When an edit fails: diagnose in 1-2 sentences, then try a different approach.** Do not retry the exact same edit.
- **After 2 failed attempts on the same file:** Stop, explain what's blocking you, and ask the user how to proceed.
- **Never loop.** If you catch yourself about to invoke the same tool with the same arguments, stop.

## Completion

- When a task is done, give a **final summary** with:
  - Files created/modified
  - Key decisions made
  - Any follow-up work needed
- Don't end with "would you like me to..." — if there's obvious follow-up work, just mention it exists.

## Pacing

- Simple tasks (1-2 files): Execute silently, report at end.
- Medium tasks (3-5 files): Brief status after each file.
- Complex tasks (6+ files): Numbered checklist, update as you go.
