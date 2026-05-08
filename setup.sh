#!/usr/bin/env bash
# ============================================================================
# Antigravity Setup — One-Command Installer
# Installs global rules, skills, workspace workflows, stack rules, and themes.
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

FETCH_AWESOME=false
INSTALL_WORKSPACE=false
WORKSPACE_TARGET="."
STACK_NAME=""
INSTALL_THEMES=false
INSTALL_ALL=false
BACKUP=true

usage() {
    cat <<USAGE
Antigravity Setup

Usage:
  ./setup.sh [options]

Options:
  --fetch-awesome              Pull curated community skills into global/skills before install
  --with-workspace [path]      Install .agent rules and slash-command workflows into a project
  --with-stack <name>          Add stack rules to the workspace (typescript-node, react-nextjs, expo-react-native, python-fastapi)
  --with-themes                Add premium theme rules to the workspace (included in --all)
  --all [path]                 Install global config plus workspace workflows, themes, and auto stack detection
  --no-backup                  Replace existing installed files without creating timestamped backups
  -h, --help                   Show this help message

Examples:
  ./setup.sh
  ./setup.sh --with-workspace ~/app --with-stack react-nextjs --with-themes
  ./setup.sh --all ~/app --fetch-awesome
USAGE
}

while [ "$#" -gt 0 ]; do
    case "$1" in
        --fetch-awesome)
            FETCH_AWESOME=true
            shift
            ;;
        --with-workspace)
            INSTALL_WORKSPACE=true
            if [ -n "${2:-}" ] && [[ ! "$2" == --* ]]; then
                WORKSPACE_TARGET="$2"
                shift 2
            else
                shift
            fi
            ;;
        --with-stack)
            if [ -z "${2:-}" ] || [[ "$2" == --* ]]; then
                err "--with-stack requires one of: typescript-node, react-nextjs, expo-react-native, python-fastapi"
                exit 1
            fi
            STACK_NAME="$2"
            INSTALL_WORKSPACE=true
            if [ -n "${3:-}" ] && [[ ! "$3" == --* ]]; then
                WORKSPACE_TARGET="$3"
                shift 3
            else
                shift 2
            fi
            ;;
        --with-themes)
            INSTALL_THEMES=true
            INSTALL_WORKSPACE=true
            shift
            ;;
        --all)
            INSTALL_ALL=true
            INSTALL_WORKSPACE=true
            INSTALL_THEMES=true
            if [ -n "${2:-}" ] && [[ ! "$2" == --* ]]; then
                WORKSPACE_TARGET="$2"
                shift 2
            else
                shift
            fi
            ;;
        --no-backup)
            BACKUP=false
            shift
            ;;
        -h|--help)
            usage
            exit 0
            ;;
        *)
            err "Unknown option: $1"
            usage
            exit 1
            ;;
    esac
done

backup_file() {
    local path="$1"
    if [ -f "$path" ] && [ "$BACKUP" = true ]; then
        cp "$path" "$path.bak.$(date +%s)"
        warn "Backed up ${D}$path${N}"
    fi
}

copy_file() {
    local source="$1"
    local target="$2"
    backup_file "$target"
    cp "$source" "$target"
}

copy_dir() {
    local source="$1"
    local target_parent="$2"
    local name
    name="$(basename "$source")"
    local target="$target_parent/$name"
    if [ -d "$target" ]; then
        if [ "$BACKUP" = true ]; then
            mv "$target" "$target.bak.$(date +%s)"
            warn "Backed up ${D}$target${N}"
        else
            rm -rf "$target"
        fi
    fi
    cp -R "$source" "$target_parent/"
}

detect_stack() {
    local target="$1"
    if [ -f "$target/next.config.js" ] || [ -f "$target/next.config.mjs" ] || [ -f "$target/next.config.ts" ]; then
        echo "react-nextjs"
    elif [ -f "$target/app.json" ] || [ -f "$target/app.config.js" ] || [ -f "$target/app.config.ts" ]; then
        echo "expo-react-native"
    elif [ -f "$target/pyproject.toml" ] || [ -f "$target/requirements.txt" ]; then
        echo "python-fastapi"
    elif [ -f "$target/package.json" ] || [ -f "$target/tsconfig.json" ]; then
        echo "typescript-node"
    else
        echo ""
    fi
}

echo ""
echo -e "${B}${C}  🚀 Antigravity Setup Installer${N}"
echo -e "${D}  Rules • skills • slash workflows • premium themes${N}"
echo -e "${D}  ───────────────────────────────────────────────${N}"

# ── Pre-flight ───────────────────────────────────────────────────────────────
step "Pre-flight checks"

[ ! -f "$DIR/global/GEMINI.md" ] && err "Cannot find global/GEMINI.md" && exit 1
[ ! -d "$DIR/global/skills" ] && err "Cannot find global/skills" && exit 1
ok "Source files found"

if command -v bun &>/dev/null; then
    ok "Detected ${B}bun${N} v$(bun --version 2>/dev/null) ${D}(preferred)${N}"
elif command -v npm &>/dev/null; then
    ok "Detected ${B}npm${N} v$(npm --version 2>/dev/null)"
    warn "Install ${B}bun${N} for faster performance: ${D}https://bun.sh${N}"
else
    warn "No bun or npm detected; core rules still install, but community fetch is unavailable"
fi

# ── Global Rules ─────────────────────────────────────────────────────────────
step "Installing global rules"

mkdir -p "$GEMINI"
copy_file "$DIR/global/GEMINI.md" "$GEMINI/GEMINI.md"
ok "Global rules → ${D}~/.gemini/GEMINI.md${N}"

# ── Global Skills ────────────────────────────────────────────────────────────
step "Installing global skills"

if [ "$FETCH_AWESOME" = true ]; then
    info "Fetching curated skills for your tech stack..."
    if command -v bunx &>/dev/null; then
        bunx antigravity-awesome-skills --path "$DIR/global/skills" --tags supabase,firebase,expo,vercel,nextjs,react,bun,ai,agent,mcp,database,mobile,frontend,backend,cloud,infrastructure,devops,security,testing,development,essentials
    elif command -v npx &>/dev/null; then
        npx -y antigravity-awesome-skills --path "$DIR/global/skills" --tags supabase,firebase,expo,vercel,nextjs,react,bun,ai,agent,mcp,database,mobile,frontend,backend,cloud,infrastructure,devops,security,testing,development,essentials
    else
        err "Cannot fetch community skills without bunx or npx"
        exit 1
    fi
    ok "Curated library updated"
fi

mkdir -p "$SKILLS"
COUNT=0
for d in "$DIR/global/skills"/*/; do
    [ -d "$d" ] || continue
    name=$(basename "$d")
    copy_dir "${d%/}" "$SKILLS"
    ok "Skill: ${B}$name${N}"
    COUNT=$((COUNT + 1))
done
info "${COUNT} skills installed to ${D}${SKILLS}${N}"

# ── Workspace Kit (Optional) ─────────────────────────────────────────────────
if [ "$INSTALL_WORKSPACE" = true ]; then
    step "Installing workspace kit"

    mkdir -p "$WORKSPACE_TARGET"
    WORKSPACE_TARGET="$(cd "$WORKSPACE_TARGET" && pwd)"
    mkdir -p "$WORKSPACE_TARGET/.agent/rules" "$WORKSPACE_TARGET/.agent/workflows"

    for f in "$DIR/examples/workspace/rules/"*.md; do
        [ -f "$f" ] || continue
        if [ "$INSTALL_THEMES" = false ] && [ "$(basename "$f")" = "premium-themes.md" ]; then
            continue
        fi
        copy_file "$f" "$WORKSPACE_TARGET/.agent/rules/$(basename "$f")"
        ok "Rule: ${B}$(basename "$f")${N}"
    done

    for f in "$DIR/examples/workspace/workflows/"*.md; do
        [ -f "$f" ] || continue
        copy_file "$f" "$WORKSPACE_TARGET/.agent/workflows/$(basename "$f")"
        ok "Slash workflow: ${B}/$(basename "$f" .md)${N}"
    done

    if [ "$INSTALL_ALL" = true ] && [ -z "$STACK_NAME" ]; then
        STACK_NAME="$(detect_stack "$WORKSPACE_TARGET")"
        [ -n "$STACK_NAME" ] && info "Auto-detected stack: ${B}$STACK_NAME${N}"
    fi

    if [ -n "$STACK_NAME" ]; then
        if [ ! -f "$DIR/stacks/$STACK_NAME/rules.md" ]; then
            err "Unknown stack: $STACK_NAME"
            info "Available stacks: ${D}typescript-node react-nextjs expo-react-native python-fastapi${N}"
            exit 1
        fi
        copy_file "$DIR/stacks/$STACK_NAME/rules.md" "$WORKSPACE_TARGET/.agent/rules/stack.md"
        ok "Stack rules: ${B}$STACK_NAME${N} → ${D}.agent/rules/stack.md${N}"
    fi

    info "Workspace kit installed in ${D}$WORKSPACE_TARGET/.agent${N}"
else
    step "Workspace kit"
    info "Skipped ${D}(run with --with-workspace, --with-themes, or --all)${N}"
fi

# ── Done ─────────────────────────────────────────────────────────────────────
echo ""
echo -e "${B}${G}  ✅ Setup complete!${N}"
echo ""
echo -e "  ${B}Installed:${N}"
echo -e "    ${G}•${N} Global rules      → ${D}~/.gemini/GEMINI.md${N}"
echo -e "    ${G}•${N} ${COUNT} skills          → ${D}~/.gemini/antigravity/skills/${N}"
if [ "$INSTALL_WORKSPACE" = true ]; then
    echo -e "    ${G}•${N} Workspace kit     → ${D}$WORKSPACE_TARGET/.agent/${N}"
fi
echo ""
echo -e "  ${B}Best next commands:${N}"
echo -e "    ${D}/setup${N}          Audit workspace and activate the right stack"
echo -e "    ${D}/agent-boost${N}    Improve rules, workflows, and automation"
echo -e "    ${D}/theme${N}          Generate or upgrade a premium visual theme"
echo -e "    ${D}/debug${N}          Isolate → trace → fix bugs"
echo ""
echo -e "  ${B}Installer shortcuts:${N}"
echo -e "    ${D}./setup.sh --all [path]${N}                         Full workspace upgrade"
echo -e "    ${D}./setup.sh --with-stack react-nextjs [path]${N}      Add stack-specific rules"
echo -e "    ${D}./setup.sh --help${N}                               Show every option"
echo ""
