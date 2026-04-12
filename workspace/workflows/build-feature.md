# Workflow: Build Feature

## Trigger
`/build-feature`

## Objective
Build a new feature from requirements to working implementation, following a structured plan-build-verify cycle.

## Input
The user provides a feature description. If vague, ask for:
1. What should this feature **do**? (behavior)
2. Where should it **live**? (files/modules)
3. Any **constraints**? (dependencies, patterns to follow)

## Steps

### Phase 1: Plan (Before writing any code)

1. **Understand the scope.** Read the feature description carefully. Identify:
   - New files to create
   - Existing files to modify
   - Dependencies needed (if any)

2. **Scout the codebase.**
   - `list_dir` the relevant directories
   - `grep_search` for related patterns, similar features, or existing utilities
   - Read the closest existing feature as a pattern to follow

3. **Present the plan.** Briefly outline:
   - Files to create/modify (with purpose of each)
   - Architecture approach
   - Any new dependencies needed (must get user approval first)
   - Estimated complexity (simple / medium / complex)

4. **Wait for user confirmation** before proceeding.

### Phase 2: Build

5. **Create types/interfaces first** (in typed languages). This catches design issues early.

6. **Implement core logic.** Write the feature's main functionality:
   - Follow existing codebase patterns and style
   - Keep functions small and focused
   - Handle errors at boundary points

7. **Wire it up.** Connect the feature to the rest of the application:
   - Update routing, exports, or configuration
   - Add necessary imports

8. **Add edge case handling.** After the happy path works:
   - Input validation
   - Error states
   - Loading states (for UI features)

### Phase 3: Verify

9. **Self-review.** Mentally walk through the feature:
   - Does the data flow make sense?
   - Are there missing error handlers?
   - Did I follow existing patterns?

10. **Test.** If tests exist in the project:
    - Write at least one test for the core behavior
    - Run the test suite to check for regressions

11. **Summary.** Report what was built:
    - Files created/modified
    - Key decisions made
    - Any follow-up work needed

## Exit Criteria
- Feature is implemented and functional
- Code follows existing project patterns
- No regressions introduced
- User has a clear summary of what was done
