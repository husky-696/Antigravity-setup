# /theme — Premium Theme Upgrade

Use this workflow when the user asks for a nicer theme, visual polish, brand refresh, dark mode, light mode, or UI that feels more premium.

## Inputs

If the user did not specify a vibe, pick one based on the product:

- **midnight glass** — deep dark UI, glass cards, violet/cyan accents
- **aurora gradient** — colorful premium SaaS, soft gradients, high energy
- **editorial light** — clean light UI, refined typography, subtle borders
- **brutalist monochrome** — bold type, hard contrast, minimal color
- **warm studio** — cream backgrounds, amber accents, friendly surfaces

## Steps

1. **Scout** existing styling files, theme config, component primitives, and layout files.
2. **Plan tokens** for background, text, accent, card, border, shadow, and focus states.
3. **Centralize** tokens in the project's theme layer before touching individual components.
4. **Upgrade surfaces**: app shell, navigation, cards, buttons, forms, modals, and empty states.
5. **Add motion** only where it improves feedback: hover, press, focus, entrance, loading.
6. **Validate** with available lint/build/type checks and responsive reasoning.
7. **Report** the changed files, theme vibe, verification commands, and any follow-up polish ideas.

## Exit Criteria

- The project has a named visual direction.
- Theme tokens are reusable and documented in code or comments where helpful.
- Core UI states are covered: default, hover, active, focus, disabled, error, and loading.
- No inaccessible low-contrast text or invisible focus states are introduced.
