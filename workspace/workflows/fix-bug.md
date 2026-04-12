# Workflow: Fix Bug

## Trigger
`/fix-bug`

## Objective
Diagnose and fix a bug using systematic debugging methodology. Avoid guess-and-check.

## Input
The user describes a bug. If the description is insufficient, ask for:
1. **What's happening?** (actual behavior)
2. **What should happen?** (expected behavior)
3. **Error message?** (paste the exact error, stack trace, or log output)
4. **When did it start?** (recent change? always broken?)

## Steps

### Phase 1: Diagnose (DO NOT SKIP)

1. **Parse the error.** If there's an error message:
   - Extract the error type
   - Extract the file and line number
   - Read the top 3 stack trace frames

2. **Categorize the bug:**
   - Syntax → check the specific line
   - Runtime → check types, null values, missing data
   - Logic → trace the condition or algorithm
   - Environment → check config, versions, env vars

3. **Read the failing code.** Use targeted line ranges only.

4. **Trace the data flow.** Follow the failing value backward from the error:
   - Where was it created?
   - Where was it transformed?
   - Where did it break?

5. **State your diagnosis** in 1-2 sentences.

### Phase 2: Fix

6. **Apply the minimal fix.** Change only what's necessary:
   - Don't refactor unrelated code
   - Don't add features while fixing bugs
   - Don't change working code "just in case"

7. **Handle edge cases** if the bug reveals a gap in validation or error handling.

### Phase 3: Verify

8. **Run the relevant test** (if one exists). If no test exists for this code path, suggest writing one.

9. **Check for side effects.** Did the fix break anything related?

10. **Report:**
    ```
    ## 🐛 Bug: [brief description]
    
    **Root Cause:** [1-2 sentences]
    **Fix:** [what was changed and why]
    **Files Modified:** [list]
    **Verification:** [how it was verified]
    ```

## Anti-Patterns
- ❌ Guessing at fixes without understanding the cause
- ❌ Rewriting large sections of code
- ❌ Adding `try-catch` wrappers instead of fixing the root cause
- ❌ Modifying more than 3 files for a single bug (usually means you're off track)

## Exit Criteria
- Root cause is identified and explained
- Fix is applied and verified
- No regressions introduced
- User understands what was wrong and what was fixed
