# 🚀 Antigravity Setup

> A curated library of global rules, agent skills, and workflows for [Antigravity IDE](https://antigravity.codes) — designed to make your AI agent smarter, faster, cheaper, and more reliable.

---

## Why This Exists

Out of the box, Antigravity's agents are powerful but generic. Without guardrails they:

- **Waste tokens** — reading files they don't need, repeating context, generating verbose output.
- **Hallucinate** — inventing APIs, file structures, or dependencies that don't exist.
- **Break things** — modifying config files, deleting code, or installing packages without asking.
- **Ignore your conventions** — formatting, naming, architecture patterns — all ignored unless told.

This repo is a **drop-in library** that solves all of that. Copy what you need, customize it for your stack, and commit it alongside your code.

---

## 📂 Repository Structure

```text
Antigravity-setup/
├── README.md                          # You are here
├── DESIGN.md                          # Architecture decisions & philosophy
├── INSTALL.md                         # Step-by-step setup guide
│
├── global/                            # ── Global config (applies to ALL projects) ──
│   ├── GEMINI.md                      # Global rules file (~/.gemini/GEMINI.md)
│   └── skills/                        # Global skills (~/.gemini/antigravity/skills/)
│       ├── code-review/
│       │   └── SKILL.md
│       ├── debug-systematic/
│       │   └── SKILL.md
│       ├── git-commit/
│       │   └── SKILL.md
│       └── token-optimizer/
│           └── SKILL.md
│
├── workspace/                         # ── Workspace config (per-project) ──
│   ├── rules/                         # Workspace rules (.agent/rules/)
│   │   ├── code-quality.md
│   │   ├── safety-guardrails.md
│   │   └── token-efficiency.md
│   └── workflows/                     # Workspace workflows (.agent/workflows/)
│       ├── build-feature.md
│       ├── fix-bug.md
│       ├── refactor.md
│       └── setup-project.md
│
└── stacks/                            # ── Stack-specific rule packs ──
    ├── typescript-node/
    │   └── rules.md
    ├── react-nextjs/
    │   └── rules.md
    └── python-fastapi/
        └── rules.md
```

---

## ⚡ Quick Start

### 1. Clone

```bash
git clone https://github.com/YOUR_USERNAME/Antigravity-setup.git
cd Antigravity-setup
```

### 2. Install Global Rules

```bash
# Copy the global rules file
cp global/GEMINI.md ~/.gemini/GEMINI.md

# Copy global skills
cp -r global/skills/* ~/.gemini/antigravity/skills/
```

### 3. Install Workspace Rules (per project)

```bash
# From your project root:
mkdir -p .agent/rules .agent/workflows

# Copy workspace rules
cp /path/to/Antigravity-setup/workspace/rules/* .agent/rules/

# Copy workflows
cp /path/to/Antigravity-setup/workspace/workflows/* .agent/workflows/

# (Optional) Add stack-specific rules
cp /path/to/Antigravity-setup/stacks/typescript-node/rules.md .agent/rules/stack.md
```

### 4. Verify

Open Antigravity IDE in your project. Ask the agent:

> "What rules and skills do you have access to?"

It should list everything you just installed.

---

## 🤖 Automatic Installation (For Antigravity Agents)

If you are using an Antigravity Agent, paste this prompt into the chat to have it install the global layers for you:

> "Act as a systems engineer. I want to install this Antigravity-setup configuration onto my local IDE. Please:
> 1. Sync `global/GEMINI.md` to `~/.gemini/GEMINI.md`
> 2. Install all skills in `global/skills/` to `~/.gemini/antigravity/skills/`
> 3. Install all global workflows in `workspace/workflows/` to `~/.gemini/antigravity/global_workflows/`
> 4. Verify the installation and give me a summary of my new capabilities."

---

## 🧠 Core Concepts

| Concept      | Scope     | Location                            | Activation    |
|:-------------|:----------|:------------------------------------|:--------------|
| **Rules**    | Global    | `~/.gemini/GEMINI.md`               | Always on     |
| **Rules**    | Workspace | `<project>/.agent/rules/*.md`       | Always on     |
| **Skills**   | Global    | `~/.gemini/antigravity/skills/`     | On-demand     |
| **Skills**   | Workspace | `<project>/.agents/skills/`         | On-demand     |
| **Workflows**| Global    | `~/.gemini/antigravity/global_workflows/` | Slash command |
| **Workflows**| Workspace | `<project>/.agent/workflows/`       | Slash command  |

### Rules vs Skills vs Workflows

- **Rules** = *Always-on guardrails.* Think of them as the agent's constitution. They define what the agent must always (or never) do. Low token cost because they're loaded once per session.
- **Skills** = *Context-aware modules.* The agent reads the `name` + `description` from frontmatter, and only loads the full instructions when relevant. This is how you teach the agent complex procedures without burning tokens every turn.
- **Workflows** = *Saved prompts as slash commands.* You trigger them manually (e.g., `/fix-bug`). They define a multi-step procedure the agent follows.

---

## 📊 Token Efficiency Impact

Based on real-world usage, this library reduces token consumption by approximately:

| Metric                    | Before | After  | Reduction |
|:--------------------------|:-------|:-------|:----------|
| Avg. tokens per task      | ~12k   | ~7k    | **~42%**  |
| Unnecessary file reads    | ~8/task| ~2/task| **~75%**  |
| Correction follow-ups     | ~3/task| ~0.5/task| **~83%** |
| Destructive action errors | ~1/5 tasks | ~0  | **~100%** |

> These are estimates based on personal tracking. Your results will vary by project complexity and model used.

---

## 🤝 Contributing

1. Fork the repo
2. Add or improve a rule/skill/workflow
3. Test it in a real project for at least 3 sessions
4. Open a PR with:
   - What problem it solves
   - Before/after examples
   - Token impact if measurable

---

## 📚 Further Reading

- [DESIGN.md](./DESIGN.md) — Architecture philosophy and design decisions
- [INSTALL.md](./INSTALL.md) — Detailed installation and customization guide
- [Antigravity Docs](https://antigravity.codes) — Official IDE documentation
- [awesome-cursorrules](https://github.com/PatrickJS/awesome-cursorrules) — Inspiration from the Cursor community

---

## License

MIT — Use freely, customize aggressively, share generously.