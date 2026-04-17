# 🚀 Antigravity Setup

> A curated library of global rules, agent skills, and workflows for [Antigravity IDE](https://antigravity.codes) — designed to make your AI agent smarter, faster, cheaper, and more reliable.

---

## Why This Exists

Out of the box, Antigravity's agents are powerful but generic. Without guardrails they:

- **Waste tokens** — reading files they don't need, repeating context, generating verbose output.
- **Get Stuck** — looping on failed edits instead of progressing, keeping you waiting in the dark.
- **Hallucinate** — inventing APIs, file structures, or dependencies that don't exist.
- **Break things** — modifying config files, deleting code, or installing packages without asking.

This repo is a **drop-in library** that solves all of that. 

---

## ⚡ Super Easy Install

We provide a one-command installer that auto-detects `bun` vs `npm` and configures your IDE globally.

```bash
git clone https://github.com/YOUR_USERNAME/Antigravity-setup.git
cd Antigravity-setup
./setup.sh
```

**Want project-specific examples too?**
```bash
./setup.sh --with-workspace /path/to/your/project
```

---

## 📂 Repository Structure

```text
Antigravity-setup/
├── README.md                          # You are here
├── DESIGN.md                          # Architecture decisions & philosophy
├── INSTALL.md                         # Detailed setup & manual steps
├── setup.sh                           # ⚡ 1-click Installer
│
├── global/                            # ── Global config (applies to ALL projects) ──
│   ├── GEMINI.md                      # Global rules file (~/.gemini/GEMINI.md)
│   └── skills/                        # Global skills (~/.gemini/antigravity/skills/)
│       ├── code-review/
│       ├── debug-systematic/
│       ├── git-commit/
│       └── token-optimizer/
│
├── examples/workspace/                # ── Templates for your project ──
│   ├── rules/                         # Project rules (.agent/rules/)
│   │   ├── code-quality.md
│   │   ├── safety-guardrails.md
│   │   ├── token-efficiency.md
│   │   └── progress-reporting.md      # Anti-stuck & status rules
│   └── workflows/                     # Project workflows (.agent/workflows/)
│       ├── build-feature.md
│       ├── fix-bug.md
│       ├── refactor.md
│       └── setup-project.md
│
└── stacks/                            # ── Stack-specific rule packs ──
    ├── typescript-node/
    ├── react-nextjs/
    └── python-fastapi/
```

---

## 🧠 What It Does

1. **Prioritizes `bun`** for faster execution. 
2. **Enforces explicit progress reporting** so you always know what the agent is doing.
3. **Implements anti-stuck mechanisms** preventing infinite loops on file edits.
4. **Minimizes token costs** progressively loading only the files and workflows needed.
5. **Protects core files** from unprompted modification.

See [DESIGN.md](./DESIGN.md) for full architectural logic.