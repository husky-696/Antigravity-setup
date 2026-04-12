# Stack Rules: TypeScript + Node.js

> Copy to `.agent/rules/stack.md` in TypeScript/Node.js projects.

---

## TypeScript Conventions

- **Strict mode always.** `"strict": true` in tsconfig. No `any` unless genuinely unavoidable (and then add `// eslint-disable-next-line @typescript-eslint/no-explicit-any` with a comment explaining why).
- **Use interfaces for object shapes**, types for unions/intersections/utility types.
- **Export types separately** when they're part of the public API: `export type { MyType }`.
- **Prefer `unknown` over `any`** for truly unknown values. Narrow with type guards.
- **Use `const` assertions** for literal values: `const ROLES = ['admin', 'user'] as const`.
- **Avoid enums.** Use `const` objects with `as const` or literal union types instead.
- **No optional chaining abuse.** If something should never be null, assert the type — don't paper over it with `?.`.

## Node.js Patterns

- **Use ES modules** (`"type": "module"` in package.json) unless backward compat requires CommonJS.
- **Async/await over callbacks.** Never use raw callbacks for async operations.
- **Handle process signals** for long-running services: `SIGTERM`, `SIGINT`.
- **Use `node:` prefix** for built-in modules: `import fs from 'node:fs/promises'`.
- **Environment variables:** Access via `process.env` only at the entry point or config module. Pass config down as function parameters, not global reads.

## Error Handling

- Create custom error classes extending `Error` for domain-specific errors.
- Include actionable context in error messages: `throw new Error(\`User ${userId} not found in org ${orgId}\`)`.
- Use error codes for programmatic handling: `error.code = 'USER_NOT_FOUND'`.

## File Naming

- `kebab-case.ts` for all source files
- `kebab-case.test.ts` for test files
- `kebab-case.d.ts` for type declaration files
- `index.ts` for module barrel exports (keep minimal — avoid re-exporting everything)

## Common Gotchas

- `===` always, never `==`
- Don't use `parseInt` without specifying radix: `parseInt(str, 10)`
- `Array.isArray()` over `instanceof Array` (handles cross-realm)
- `Date` is mutable — clone before modifying
- `JSON.stringify` drops `undefined` values and functions
