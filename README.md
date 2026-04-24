# Antigravity Setup

> Drop-in global rules, agent skills, and workflows for [Antigravity IDE](https://antigravity.codes).  
> Makes your AI agent smarter, faster, cheaper, and harder to break.

---

## The Problem

Out of the box, Antigravity agents are powerful but unconstrained. Without guardrails they:

- **Waste tokens** — reading irrelevant files, repeating context, generating verbose output
- **Get stuck** — looping on failed edits with no visible progress
- **Hallucinate** — inventing APIs, file paths, or packages that don't exist
- **Break things** — touching config files, deleting code, or installing packages without asking

This repo is the fix.

---

## Install

```bash
git clone https://github.com/YOUR_USERNAME/Antigravity-setup.git
cd Antigravity-setup
./setup.sh
```

Auto-detects `bun` vs `npm`. Configures global IDE rules and skills in one shot.

**Pull 1,400+ community playbooks from [antigravity-awesome-skills](https://github.com/sickn33/antigravity-awesome-skills):**

```bash
./setup.sh --fetch-awesome
```

**Apply project-specific workspace templates:**

```bash
./setup.sh --with-workspace /path/to/your/project
```

---

## Repository Structure

```text
Antigravity-setup/
├── README.md                        # You are here
├── CATALOG.md                       # Full searchable skill index
├── DESIGN.md                        # Architecture decisions & philosophy
├── INSTALL.md                       # Manual setup steps
├── setup.sh                         # One-click installer
│
├── global/                          # Applies to ALL projects
│   ├── GEMINI.md                    # Global rules → ~/.gemini/GEMINI.md
│   └── skills/                      # Global skills → ~/.gemini/antigravity/skills/
│       ├── brand/
│       ├── clean/
│       ├── debug/
│       ├── elite-backend/
│       ├── elite-code/
│       ├── elite-design/
│       ├── elite-mobile/
│       ├── elite-ship/
│       ├── elite-web/
│       ├── git/
│       ├── improve/
│       ├── profile/
│       ├── security/
│       └── setup/
│
├── examples/workspace/              # Per-project templates
│   ├── rules/                       # Drop into .agent/rules/
│   │   ├── code-quality.md
│   │   ├── safety-guardrails.md
│   │   └── progress-reporting.md
│   └── workflows/                   # Drop into .agent/workflows/
│       ├── build-feature.md
│       ├── fix-bug.md
│       ├── refactor.md
│       └── setup-project.md
│
└── stacks/                          # Stack-specific rule packs
    ├── typescript-node/
    ├── react-nextjs/
    ├── expo-react-native/
    └── python-fastapi/
```

---

## What Gets Configured

| Concern | Mechanism |
| :--- | :--- |
| Token efficiency | Progressive file loading; skills only activate on explicit trigger |
| Anti-stuck | Hard loop limits; forced progress reporting every N steps |
| Hallucination guard | File-existence checks before edits; package validation before installs |
| Core file protection | Blocklist for `package.json`, lock files, CI config unless explicitly unlocked |
| Package manager | `bun` preferred; fallback to `npm` if `bun` not found |

---

## Skill Catalog

| Trigger | Skill | Stack |
| :--- | :--- | :--- |
| `🚀 /elite-web` | Next.js App Router, Tailwind v4, Framer Motion | Web |
| `📱 /elite-mobile` | Expo SDK 51+, Reanimated, Lucide, native layouts | Mobile |
| `⚡ /elite-backend` | Supabase, Drizzle ORM, Auth, RLS modeling | Backend |
| `🎨 /elite-design` | Typography, motion, premium UI/UX patterns | Design |
| `🎨 /brand` | Logos, palettes, marketing copy | Design |
| `🚢 /elite-ship` | Vercel, EAS Build, repo hygiene | DevOps |
| `🌿 /git` | Conventional Commits, branch sync | DevOps |
| `🧹 /clean` | Project auditing, dead-code pruning | Utility |
| `🔍 /debug` | Isolate → Trace → Analyze protocol | Quality |
| `⚙️ /setup` | Workspace init, environment config | Core |
| `💎 /elite-code` | Refactoring, high-performance patterns | Core |
| `✨ /improve` | Systematic design + functionality evolution | Core |
| `⚡ /profile` | Performance auditing, speed optimization | Quality |
| `🔐 /security` | Biometrics, encryption, RLS hardening | Quality |

Full descriptions → [CATALOG.md](./CATALOG.md)

---

## Common Workflows

### Build a feature

```
/elite-web     → scaffold UI with Premium Design Rules
/elite-backend → wire data persistence
/elite-ship    → deploy
```

### Fix a bug

```
/debug         → Isolate → Trace → Analyze
/elite-ship    → ship the fix
```

### Start a new project

```
/setup         → audit environment, init workspace
/elite-web or /elite-mobile → begin building
```

---

## Design Philosophy

Full rationale in [DESIGN.md](./DESIGN.md). Short version:

- Skills are **opt-in by trigger**, not always-on — avoids polluting context on unrelated tasks
- Rules are **additive, not overriding** — project-level rules layer on top of global rules
- Token budget is treated as a **first-class constraint**, not an afterthought
- Agent is expected to **report progress explicitly** — no silent multi-minute execution

---

## Contributing

PRs welcome. Adding a new skill: follow the template in `global/skills/_template/` and open a PR against `main`. Skills merged here are candidates for upstream submission to [antigravity-awesome-skills](https://github.com/sickn33/antigravity-awesome-skills).