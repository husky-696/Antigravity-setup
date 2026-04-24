---
name: 🔍 debug
description: Systematic root-cause analysis and resolution for complex bugs and crashes.
category: core
---

# Systematic Debugging

Use `/debug` when things break. No guesswork—only evidence-based fixes.

## Methodology
1. **Isolate**: Reproduce the bug in the smallest possible environment.
2. **Trace**: Check logs (server, console, native) and identify the exact line of failure.
3. **Analyze**: Understand *why* it failed, not just *that* it failed. Check state, types, and race conditions.
4. **Fix**: Implement a robust fix that addresses the root cause, not just the symptom.
5. **Validate**: Verify the fix and ensure no regressions.

## Tooling
- **Web**: React DevTools, Network tab, `console.table` for state analysis.
- **Mobile**: `npx expo start --dev-client`, Flipper, or native Xcode/Android Studio logs.
- **Backend**: Supabase logs, Drizzle logging, Bun inspector.

## Commands
- `/debug-trace`: Performs a deep scan of the codebase to trace an error message.
- `/debug-fix`: Proposes and implements a surgical fix for a verified bug.
