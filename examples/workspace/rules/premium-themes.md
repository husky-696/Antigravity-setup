# Premium Theme Rules

> Use these rules when the user asks for a nicer UI, theme polish, landing-page polish, or `/theme`.

## Theme Quality Bar

- Build themes around a clear mood: **midnight glass**, **aurora gradient**, **editorial light**, **brutalist monochrome**, or **warm studio**.
- Define tokens first: background, foreground, muted text, primary accent, secondary accent, border, card surface, success, warning, and danger.
- Prefer semantic variables (`--background`, `--foreground`, `--primary`) over one-off colors in components.
- Make both light and dark modes intentional; do not simply invert colors.
- Keep contrast accessible for body text, buttons, form labels, and focus states.

## Visual System

- Use layered depth: base background, subtle radial gradient, card surface, thin border, then focused accent glow.
- Use a 4px spacing grid, generous section padding, and consistent radii.
- Pair typography deliberately: one display face or weight for headings, one readable face for body text.
- Add tasteful micro-interactions: hover lift, pressed state, focus ring, and 150–250ms transitions.
- Avoid noisy gradients, random shadows, low-contrast gray text, and generic blue-on-white defaults.

## Implementation Checklist

1. Inspect existing design tokens and component primitives before editing.
2. Add or update centralized tokens first.
3. Apply the theme to shared layout, navigation, cards, buttons, inputs, and empty states.
4. Verify responsive behavior at mobile, tablet, and desktop widths.
5. Run available lint/build checks and report any visual or environment limitations.
