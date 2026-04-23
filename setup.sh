#!/usr/bin/env bash
# ============================================================================
# Antigravity Setup — One-Command Installer
# Detects bun/npm, installs global rules + skills with rich progress output.
# ============================================================================
set -euo pipefail

# ── Colors ───────────────────────────────────────────────────────────────────
B='\033[1m'; D='\033[2m'; R='\033[0;31m'; G='\033[0;32m'; Y='\033[0;33m'
BL='\033[0;34m'; M='\033[0;35m'; C='\033[0;36m'; N='\033[0m'

info()    { echo -e "  ${BL}ℹ${N}  $1"; }
ok()      { echo -e "  ${G}✔${N}  $1"; }
warn()    { echo -e "  ${Y}⚠${N}  $1"; }
err()     { echo -e "  ${R}✖${N}  $1"; }
step()    { echo -e "\n${B}${M}▸ $1${N}"; }

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GEMINI="$HOME/.gemini"
SKILLS="$GEMINI/antigravity/skills"

echo ""
echo -e "${B}${C}  🚀 Antigravity Setup Installer${N}"
echo -e "${D}  ─────────────────────────────────${N}"

# ── Pre-flight ───────────────────────────────────────────────────────────────
step "Pre-flight checks"

[ ! -f "$DIR/global/GEMINI.md" ] && err "Cannot find global/GEMINI.md" && exit 1
ok "Source files found"

if command -v bun &>/dev/null; then
    ok "Detected ${B}bun${N} v$(bun --version 2>/dev/null) ${D}(preferred)${N}"
elif command -v npm &>/dev/null; then
    ok "Detected ${B}npm${N} v$(npm --version 2>/dev/null)"
    warn "Install ${B}bun${N} for faster performance: ${D}https://bun.sh${N}"
fi

# ── Global Rules ─────────────────────────────────────────────────────────────
step "Installing global rules"

mkdir -p "$GEMINI"
if [ -f "$GEMINI/GEMINI.md" ]; then
    cp "$GEMINI/GEMINI.md" "$GEMINI/GEMINI.md.bak.$(date +%s)"
    warn "Backed up existing GEMINI.md"
fi
cp "$DIR/global/GEMINI.md" "$GEMINI/GEMINI.md"
ok "Global rules → ${D}~/.gemini/GEMINI.md${N}"

# ── Global Skills ────────────────────────────────────────────────────────────
step "Installing global skills"

# Check if user wants to fetch latest from awesome-skills
FETCH_AWESOME=false
for arg in "$@"; do
    if [ "$arg" = "--fetch-awesome" ]; then
        FETCH_AWESOME=true
    fi
done

if [ "$FETCH_AWESOME" = true ]; then
    info "Fetching curated skills for your tech stack..."
    npx -y antigravity-awesome-skills --path "$DIR/global/skills" --tags supabase,firebase,expo,vercel,nextjs,react,bun,ai,agent,mcp,database,mobile,frontend,backend,cloud,infrastructure,devops,security,testing,development,essentials
    ok "Curated library updated"
fi

mkdir -p "$SKILLS"
COUNT=0
for d in "$DIR/global/skills"/*/; do
    [ -d "$d" ] || continue
    name=$(basename "$d")
    cp -r "$d" "$SKILLS/"
    ok "Skill: ${B}$name${N}"
    COUNT=$((COUNT + 1))
done
info "${COUNT} skills installed to ${D}${SKILLS}${N}"

# ── Workspace Examples (Optional) ────────────────────────────────────────────
step "Workspace examples"

if [[ "$*" == *"--with-workspace"* ]]; then
    # Extract target path if provided after --with-workspace
    TARGET="."
    args=("$@")
    for i in "${!args[@]}"; do
        if [ "${args[$i]}" = "--with-workspace" ]; then
            if [ -n "${args[$((i+1))]:-}" ] && [[ ! "${args[$((i+1))]}" == --* ]]; then
                TARGET="${args[$((i+1))]}"
            fi
        fi
    done
    
    TARGET="$(cd "$TARGET" && pwd)"
    mkdir -p "$TARGET/.agent/rules" "$TARGET/.agent/workflows"

    for f in "$DIR/examples/workspace/rules/"*.md; do
        [ -f "$f" ] && cp "$f" "$TARGET/.agent/rules/" && ok "Rule: ${B}$(basename "$f")${N}"
    done
    for f in "$DIR/examples/workspace/workflows/"*.md; do
        [ -f "$f" ] && cp "$f" "$TARGET/.agent/workflows/" && ok "Workflow: ${B}$(basename "$f")${N}"
    done
    info "Edit files in ${B}.agent/${N} to match your project"
else
    info "Skipped ${D}(run with --with-workspace to install examples)${N}"
    info "Templates in: ${D}examples/workspace/${N}"
fi

# ── Done ─────────────────────────────────────────────────────────────────────
echo ""
echo -e "${B}${G}  ✅ Setup complete!${N}"
echo ""
echo -e "  ${B}Installed:${N}"
echo -e "    ${G}•${N} Global rules      → ${D}~/.gemini/GEMINI.md${N}"
echo -e "    ${G}•${N} ${COUNT} skills          → ${D}~/.gemini/antigravity/skills/${N}"
echo ""
echo -e "  ${B}Next:${N} Open Antigravity IDE and ask ${D}\"What rules and skills do you have?\"${N}"
echo ""
echo -e "  ${B}Useful Commands:${N}"
echo -e "    ${D}./setup.sh --fetch-awesome${N}          Update library from GitHub"
echo -e "    ${D}./setup.sh --with-workspace [path]${N}  Install project templates"
echo ""
echo -e "  ${B}Stack rules:${N} ${D}cp stacks/<your-stack>/rules.md /project/.agent/rules/stack.md${N}"
echo ""
