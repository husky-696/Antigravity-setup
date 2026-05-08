# /theme — Premium Theme & Icon Upgrade

Use this workflow when the user asks for a nicer theme, better icons, visual polish, brand refresh, dark mode, light mode, or UI that feels more premium.

## Inputs

If the user did not specify a vibe, choose the best preset for the product:

- **🌌 Command Center** — AI tools, dashboards, devtools, technical products
- **🌈 Aurora Bloom** — SaaS, creator tools, launch pages, high-energy marketing
- **📰 Editorial Ivory** — docs, portfolios, blogs, clean admin surfaces
- **🧱 Graphite Pro** — B2B, fintech, productivity, security, dense data apps
- **☀️ Solar Studio** — friendly consumer, mobile, education, wellness

## Steps

1. **Scout** existing styling files, design tokens, icon libraries, component primitives, and layout files.
2. **Select** one theme preset and one icon family that fits the stack and product personality.
3. **Plan tokens** for background, text, muted text, primary, secondary, accent, card, border, ring, shadow, success, warning, and danger.
4. **Centralize** tokens in the project's theme layer before touching individual components.
5. **Upgrade surfaces**: app shell, navigation, cards, buttons, forms, tables, modals, charts, empty states, and error states.
6. **Improve icons** by standardizing size, stroke, family, and semantic usage.
7. **Add motion** only where it improves feedback: hover, press, focus, entrance, loading, and state transitions.
8. **Validate** contrast, responsive behavior, and available lint/build/type checks.
9. **Report** the chosen preset, icon family, changed files, verification commands, and follow-up polish ideas.

## Exit Criteria

- The project has a named visual direction and a consistent icon system.
- Theme tokens are reusable and documented in code or comments where helpful.
- Core UI states are covered: default, hover, active, focus, disabled, error, loading, and empty.
- Icons improve comprehension and do not create clutter.
- No inaccessible low-contrast text or invisible focus states are introduced.
