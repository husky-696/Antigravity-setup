---
name: ⚡ profile
description: Performance auditing and extreme optimization for speed and bundle size.
category: core
---

# Performance Profiling & Optimization

Use `/profile` to make your apps feel "instant." No lag, no bloat—only peak performance.

## Profiling Protocol
1. **Render Audit**: Identify unnecessary re-renders in React/React Native. Use `React.memo`, `useMemo`, and `useCallback` surgically.
2. **Bundle Scan**: Audit dependencies and bundle sizes. Identify and remove or lazy-load heavy packages.
3. **API Latency**: Profile network requests. Optimize database queries (indexes, RLS) and edge function execution.
4. **Memory Check**: Scan for memory leaks or excessive resource consumption (especially on mobile).

## Extreme Optimization
- **FlashList**: Enforce FlashList for all heavy lists.
- **Image Cache**: Ensure high-performance image caching and progressive loading.
- **Zero-Config**: Minimize initial load time by deferring non-critical assets.

## Commands
- `/profile-audit`: Performs a deep performance scan of the codebase.
- `/profile-optimize`: Implements specific fixes for identified performance bottlenecks.
