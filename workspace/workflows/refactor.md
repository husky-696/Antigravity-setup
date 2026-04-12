# Workflow: Refactor

## Trigger
`/refactor`

## Objective
Refactor code to improve quality, readability, or performance without changing external behavior.

## Input
The user specifies what to refactor. If vague, ask:
1. **Which file or module?**
2. **What's the goal?** (readability, performance, DRY, modularity)
3. **Any constraints?** (don't change public API, keep backward compat, etc.)

## Steps

### Phase 1: Assess

1. **Read the target code.** Understand its current structure and responsibility.

2. **Identify the smells:**
   - Functions too long (>30 lines)
   - Too many parameters (>3)
   - Deep nesting (>3 levels)
   - Duplicated logic
   - Mixed responsibilities
   - Dead code or unused variables
   - Inconsistent naming
   - Magic numbers or strings

3. **Check dependencies.**
   - What imports this module?
   - What does this module import?
   - Are there tests for this code?

4. **Present the refactoring plan:**
   - What changes you'll make
   - What will NOT change (public API, behavior)
   - Risk assessment (low/medium/high)

### Phase 2: Execute

5. **Refactor incrementally.** Make one type of change at a time:
   - First: extract functions
   - Then: rename for clarity
   - Then: simplify logic
   - Then: remove dead code
   
   This is easier to review and revert if something breaks.

6. **Preserve the interface.** Unless explicitly asked to change it:
   - Same function names
   - Same parameter signatures
   - Same return types
   - Same side effects

7. **Update related code.** If you change a function signature:
   - Update all call sites
   - Update type definitions
   - Update tests

### Phase 3: Validate

8. **Run tests.** If tests exist, verify all pass.

9. **Diff review.** Show a summary of all changes:
   ```
   ## Refactoring Summary
   
   **Goal:** [what was improved]
   **Files Modified:** [list with brief description per file]
   **Changes:**
   - Extracted [X] into [Y]
   - Renamed [A] to [B] for clarity
   - Removed [dead code description]
   **Risk:** [low/medium/high]
   **Tests:** [passing/added/none]
   ```

## Golden Rules

- ✅ Refactoring changes structure, NOT behavior
- ✅ Every refactoring step should leave the code working
- ✅ If you're not sure a change is safe, ask
- ❌ Don't mix refactoring with feature work
- ❌ Don't refactor code that's about to be deleted
- ❌ Don't chase perfection — "good enough" is good enough

## Exit Criteria
- Code is cleaner/simpler than before
- All existing tests still pass
- Public API unchanged (unless user requested otherwise)
- User has a clear diff of what changed
