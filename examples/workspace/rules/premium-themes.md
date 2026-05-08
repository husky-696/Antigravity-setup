# Premium Theme Rules

> Use these rules when the user asks for a nicer UI, theme polish, landing-page polish, app-store polish, or `/theme`.

## Theme Quality Bar

- Start from a named preset instead of random colors: **Command Center**, **Aurora Bloom**, **Editorial Ivory**, **Graphite Pro**, or **Solar Studio**.
- Define semantic tokens first: background, foreground, muted text, primary, secondary, accent, border, card, popover, success, warning, danger, ring, and shadow.
- Prefer variables (`--background`, `--foreground`, `--primary`) over one-off component colors.
- Make light and dark modes intentional; never create dark mode by simply inverting colors.
- Maintain accessible contrast for body text, buttons, form labels, links, charts, and focus states.

## Ready Theme Presets

### 🌌 Command Center
- Use for dashboards, devtools, AI products, and technical apps.
- Base `#070A12`, surface `#0D1220`, primary `#7C3AED`, accent `#22D3EE`, text `#E5E7EB`.
- Pair glass panels with thin cyan/violet borders and restrained glow.

### 🌈 Aurora Bloom
- Use for SaaS, creator tools, marketing pages, and launch screens.
- Base `#0B1020`, surface `#111827`, primary `#8B5CF6`, accent `#F472B6`, highlight `#34D399`.
- Use soft mesh gradients behind hero sections and CTAs.

### 📰 Editorial Ivory
- Use for docs, portfolios, blogs, admin tools, and text-heavy products.
- Base `#FAF7F0`, surface `#FFFFFF`, primary `#1F2937`, accent `#B45309`, text `#111827`.
- Use strong typography, clean borders, and almost no glow.

### 🧱 Graphite Pro
- Use for serious B2B, fintech, security, and productivity apps.
- Base `#0A0A0B`, surface `#151517`, primary `#F8FAFC`, accent `#A3E635`, muted `#71717A`.
- Use monochrome contrast, precise spacing, and sharp data density.

### ☀️ Solar Studio
- Use for friendly consumer apps, wellness, education, and mobile-first products.
- Base `#FFF7ED`, surface `#FFFBF5`, primary `#EA580C`, accent `#14B8A6`, text `#2A1810`.
- Use warm cards, gentle shadows, rounded controls, and approachable copy.

## Icon & UI System

- Pick one icon family per project: **Lucide** for SaaS/devtools, **Phosphor** for friendly apps, **Heroicons** for classic dashboards, or native SF Symbols/Material Icons on mobile.
- Icons must match stroke width, corner radius, size, and visual weight.
- Use icons to clarify actions, not decorate every label.
- Standard sizes: 16px inline, 20px buttons/nav, 24px feature cards, 32px+ hero/empty states.
- Pair destructive actions with clear color and text; never rely on icon alone.

## Implementation Checklist

1. Inspect existing design tokens, icon libraries, and component primitives before editing.
2. Choose one preset and document the chosen mood in the theme file or PR summary.
3. Add or update centralized semantic tokens first.
4. Apply the theme to layout, navigation, cards, buttons, inputs, tables, empty states, and error states.
5. Normalize icon usage and replace mismatched emoji/icon styles with a single icon family where the stack supports it.
6. Verify responsive behavior at mobile, tablet, and desktop widths.
7. Run available lint/build checks and report any visual or environment limitations.
