# Installation Guide — Antigravity Setup Library

---

## ⚡ Super Easy Install (Recommended)

Run our automatic installer from your terminal. It detects your environment, prefers `bun` for speed, and installs global skills.

```bash
git clone https://github.com/YOUR_USERNAME/Antigravity-setup.git
cd Antigravity-setup
./setup.sh
```

### Install Workspace Examples
If you want to copy the template workspace rules to a specific project:

```bash
./setup.sh --with-workspace /path/to/your/project
```

---

## Manual Installation

If you prefer to configure components manually:

### 1. Global Rules
```bash
cp global/GEMINI.md ~/.gemini/GEMINI.md
```

### 2. Global Skills
```bash
mkdir -p ~/.gemini/antigravity/skills
cp -r global/skills/* ~/.gemini/antigravity/skills/
```

### 3. Workspace Examples (Per-Project)
From your project's root directory:
```bash
SETUP_DIR="/path/to/Antigravity-setup"

mkdir -p .agent/rules .agent/workflows

cp "$SETUP_DIR/examples/workspace/rules/"* .agent/rules/
cp "$SETUP_DIR/examples/workspace/workflows/"* .agent/workflows/
```

### 4. Stack Overlays
Choose ONE that matches your project and copy into your project's `.agent/rules/` directory:
```bash
cp "$SETUP_DIR/stacks/typescript-node/rules.md" .agent/rules/stack.md
# cp "$SETUP_DIR/stacks/react-nextjs/rules.md" .agent/rules/stack.md
# cp "$SETUP_DIR/stacks/python-fastapi/rules.md" .agent/rules/stack.md
```

---

## Verification

After installation, open Antigravity IDE and ask:

1. **"What global rules do you have?"** — Should describe your GEMINI.md contents.
2. **"What skills are available?"** — Should list all installed skills by name.
