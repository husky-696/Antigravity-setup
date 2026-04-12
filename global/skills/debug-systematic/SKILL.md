---
name: debug-systematic
description: Provides a systematic debugging methodology when the user reports a bug, error, crash, or unexpected behavior. Activates for "it's not working", "I'm getting an error", "this crashes", or any error message/stack trace.
---

# Systematic Debugging Skill

## When to Use
- User reports an error, bug, or unexpected behavior
- User pastes an error message or stack trace
- User says something "isn't working" or "is broken"

## Debugging Protocol

### Phase 1: Reproduce & Understand (DO NOT SKIP)

Before writing ANY fix:

1. **Read the error message carefully.** Extract:
   - Error type (TypeError, SyntaxError, 404, etc.)
   - File and line number
   - Stack trace (top 3 frames minimum)
   
2. **Identify the category:**
   - **Syntax** → typo, missing bracket, malformed import
   - **Runtime** → null reference, type mismatch, missing dependency
   - **Logic** → wrong output, incorrect condition, off-by-one
   - **Environment** → wrong Node version, missing env var, port conflict
   - **Build** → config error, dependency version mismatch

3. **Check the obvious first:**
   - Is the file saved?
   - Is the import path correct? (relative vs absolute)
   - Is the dependency installed? (`node_modules/` exists?)
   - Is there a typo in the variable/function name?

### Phase 2: Investigate

4. **Read the failing code.** Use targeted line ranges — don't read the entire file.

5. **Trace the data flow.** Follow the variable/value from input to error:
   - Where is it defined?
   - Where is it transformed?
   - Where does it fail?

6. **Check related files** (only if needed):
   - The file that imports/calls the failing code
   - Type definitions or interfaces
   - Configuration that affects the failing path

### Phase 3: Fix

7. **State your diagnosis** in 1-2 sentences before writing the fix.

8. **Apply the minimal fix.** Change only what's necessary to resolve the bug.

9. **Verify the fix** by:
   - Running the relevant test if one exists
   - Checking that the fix doesn't break related functionality
   - Confirming types still pass (in typed languages)

### Phase 4: Prevent

10. **If the bug was caused by a systemic issue**, suggest a preventive measure:
    - A type constraint
    - An input validation
    - A test case
    - A rule addition

## Anti-Patterns (DO NOT DO THESE)

- ❌ Don't guess-and-check by trying random fixes
- ❌ Don't rewrite large sections of code to fix a small bug
- ❌ Don't add a `try-catch` around the error without fixing the root cause
- ❌ Don't say "try restarting the server" unless you've ruled out code issues
- ❌ Don't read 10 files before understanding the error message

## Output Format

```
## 🐛 Diagnosis
[1-2 sentence explanation of the root cause]

## 🔧 Fix
[The code change, as a minimal diff]

## ✅ Verification
[How to verify the fix works]

## 🛡️ Prevention (optional)
[Suggestion to prevent this class of bug]
```
