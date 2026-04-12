# Stack Rules: React + Next.js

> Copy to `.agent/rules/stack.md` in React/Next.js projects.

---

## Next.js Conventions

- **App Router** (`app/` directory) is the default. Don't use Pages Router unless the project already uses it.
- **Server Components by default.** Only add `"use client"` when the component needs interactivity, state, or browser APIs.
- **Route handlers** go in `app/api/*/route.ts`. Use named exports: `GET`, `POST`, `PUT`, `DELETE`.
- **Metadata** — use `export const metadata` or `generateMetadata()` in layouts/pages, not manual `<head>` tags.
- **Loading/Error states** — use `loading.tsx` and `error.tsx` files per route segment.
- **Server Actions** — prefer over API routes for form submissions and mutations.

## React Patterns

- **Functional components only.** No class components.
- **Custom hooks** for reusable logic. Prefix with `use` (e.g., `useAuth`, `usePagination`).
- **Props interfaces** — define inline for simple components, extract for complex/reused ones.
- **Avoid prop drilling** beyond 2 levels. Use context or composition patterns instead.
- **Memoization** — don't prematurely optimize. Only add `useMemo`/`useCallback`/`React.memo` when you've identified a performance problem.
- **Key props** — use stable, unique identifiers. Never use array index as key for dynamic lists.

## Component Structure

```typescript
// 1. Imports
// 2. Types/Interfaces
// 3. Component definition
// 4. Helper functions (if small — otherwise extract to utils)
```

- **One component per file** (small helper components are okay).
- **Component files:** `PascalCase.tsx`
- **Utility/hook files:** `kebab-case.ts`
- **Test files:** `ComponentName.test.tsx`

## Styling

- Follow the project's existing pattern (CSS Modules, Tailwind, styled-components, etc.)
- Don't mix styling approaches within a project
- Use CSS variables for theming and dynamic values
- Responsive design: mobile-first approach with min-width breakpoints

## Common Gotchas

- Can't use hooks inside conditions, loops, or nested functions
- `useEffect` cleanup function is critical for subscriptions, timers, and event listeners
- Server Components can't use `useState`, `useEffect`, or event handlers
- `"use client"` marks the client boundary — all children become client-rendered too
- `fetch()` in Server Components is automatically cached in Next.js — use `{ cache: 'no-store' }` or `revalidate` for dynamic data
- Dynamic `import()` for heavy components to reduce initial bundle size

## SEO (Always Apply)

- Every page must have a unique `<title>` and `<meta description>`
- Use semantic HTML: `<header>`, `<main>`, `<nav>`, `<article>`, `<section>`, `<footer>`
- Single `<h1>` per page, proper heading hierarchy (h1 → h2 → h3, no skipping)
- All images must have descriptive `alt` text
- All interactive elements must have unique `id` attributes
