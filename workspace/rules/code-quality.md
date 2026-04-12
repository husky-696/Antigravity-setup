# Code Quality Rules

> These rules enforce code quality standards across the workspace.
> Customize for your project's specific needs.

---

## Naming Conventions

- **Variables & Functions:** `camelCase`
- **Types & Interfaces:** `PascalCase`
- **Constants:** `UPPER_SNAKE_CASE`
- **Files:** `kebab-case` for utilities, `PascalCase` for components
- **Boolean variables:** prefix with `is`, `has`, `should`, `can` (e.g., `isLoading`, `hasAccess`)

## Function Design

- Maximum function length: **30 lines** (excluding type definitions)
- Maximum parameters: **3** (use an options object for more)
- Every function should have a **single clear responsibility**
- Prefer **pure functions** — avoid side effects unless the function's name implies them

## Error Handling

- Never silently swallow errors (`catch (e) {}` is banned)
- Always log or propagate errors with context
- Use early returns for guard clauses instead of deep nesting
- Validate inputs at module boundaries, not deep in the call stack

## Imports

- Group imports: external → internal → relative → types
- Remove unused imports before committing
- Prefer named exports over default exports (easier to grep, rename, and refactor)

## Testing

- New features require at least one test
- Bug fixes require a regression test that reproduces the bug
- Test the behavior, not the implementation
- Don't test private/internal functions directly

## Comments

- Comment the **why**, not the **what**
- Remove commented-out code — use git for history
- TODO comments must include a reason and (optionally) assignee: `// TODO(haj): refactor after v2 migration`
