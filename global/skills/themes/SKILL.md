---
name: 🌈 themes
description: Premium theme systems, icon direction, dark/light modes, design tokens, and visual polish workflows.
category: design
---

# Premium Themes & Icons

Use `/themes` when the user asks for a nicer look, better icons, color palette, dark mode, light mode, brand vibe, or visual polish.

## Preset Library

### 🌌 Command Center
- Best for AI tools, dashboards, devtools, and technical apps.
- Palette: `#070A12`, `#0D1220`, `#7C3AED`, `#22D3EE`, `#E5E7EB`.
- Feel: precise, luminous, focused, premium dark mode.

### 🌈 Aurora Bloom
- Best for SaaS, creator tools, marketing pages, and launches.
- Palette: `#0B1020`, `#111827`, `#8B5CF6`, `#F472B6`, `#34D399`.
- Feel: vibrant, optimistic, gradient-rich, polished.

### 📰 Editorial Ivory
- Best for docs, portfolios, blogs, and text-heavy products.
- Palette: `#FAF7F0`, `#FFFFFF`, `#1F2937`, `#B45309`, `#111827`.
- Feel: refined, readable, calm, high-trust.

### 🧱 Graphite Pro
- Best for B2B, fintech, productivity, security, and dense dashboards.
- Palette: `#0A0A0B`, `#151517`, `#F8FAFC`, `#A3E635`, `#71717A`.
- Feel: serious, sharp, data-dense, confident.

### ☀️ Solar Studio
- Best for friendly consumer, education, wellness, and mobile-first apps.
- Palette: `#FFF7ED`, `#FFFBF5`, `#EA580C`, `#14B8A6`, `#2A1810`.
- Feel: warm, human, approachable, soft.

## Icon Direction

- Use **Lucide** for crisp SaaS/devtools, **Phosphor** for friendly products, **Heroicons** for classic dashboards, and native icon sets for mobile.
- Keep one family, one stroke weight, and predictable sizes across the app.
- Icons must clarify actions or states; remove purely decorative clutter.

## Workflow

1. Inspect existing tokens, Tailwind config, CSS variables, icon imports, component library, and layout.
2. Choose a preset and icon family based on the product's job-to-be-done.
3. Define semantic tokens before editing components.
4. Apply tokens across app shell, cards, buttons, forms, focus rings, empty states, errors, tables, and charts.
5. Normalize icon usage by size, stroke, label pairing, and accessibility text.
6. Add tasteful motion and hover states without hurting accessibility.
7. Verify contrast, responsive behavior, and available build/lint checks.

## Commands

- `/themes-audit`: Review current UI, tokens, and icon consistency.
- `/themes-generate`: Create semantic tokens for a named preset.
- `/themes-icons`: Recommend or normalize an icon family and usage rules.
- `/theme`: Workspace slash workflow for applying a full theme and icon upgrade.
