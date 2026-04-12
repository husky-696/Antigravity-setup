# Design Document — Antigravity Setup Library

> This document explains the **why** behind every design decision in this library. Read this before modifying or extending the rules.

---

## 1. Design Philosophy

### 1.1 The Agent is a Junior Engineer, Not a Magic Wand

The single most important mental model: **treat the AI agent like a brilliant but inexperienced team member.** It has encyclopedic knowledge but zero context about *your* project until you provide it.

This means:
- **Explicit > Implicit.** Never assume the agent "knows" your conventions.
- **Constraints > Freedom.** A well-constrained agent produces better output than an unconstrained one.
- **Show, don't tell.** Examples of good/bad patterns beat abstract descriptions every time.

### 1.2 The Token Budget is Real

Every token the agent reads or writes costs money and time. This library is designed around **token austerity**:

- **Progressive disclosure.** Don't dump everything into the context window. Rules are loaded always (small), skills are loaded on-demand (medium), and reference docs are only read when explicitly needed (large).
- **Compression over verbosity.** A 5-line rule that says "use camelCase for variables, PascalCase for types" beats a 200-line style guide with rationale.
- **Output brevity.** Rules explicitly instruct the agent to be concise in responses and avoid re-explaining code it just wrote.

### 1.3 Safety as a First-Class Concern

An unconstrained AI agent with terminal access is dangerous. This library treats safety guardrails as **non-negotiable foundations**, not optional add-ons:

- **Destructive operations require confirmation.** Always.
- **Config files are protected.** `.env`, `package.json`, `docker-compose.yml` — never modified silently.
- **No external requests without approval.** The agent cannot `curl`, `wget`, or `npm install` without the user seeing and approving the command.

---

## 2. Architecture Decisions

### 2.1 Three-Tier Configuration Hierarchy

```
┌─────────────────────────────────────────────┐
│              Global Rules (GEMINI.md)        │ ← Universal, rarely changes
│  ┌─────────────────────────────────────────┐ │
│  │        Workspace Rules (.agent/rules/)  │ │ ← Per-project, committed to git
│  │  ┌─────────────────────────────────────┐│ │
│  │  │    Stack Rules (stacks/*.md)        │ │ │ ← Technology-specific overlays
│  │  └─────────────────────────────────────┘│ │
│  └─────────────────────────────────────────┘ │
└─────────────────────────────────────────────┘
```

**Why three tiers?**

- **Global** handles universal truths — response format, safety, token efficiency. These apply whether you're writing TypeScript or Python.
- **Workspace** handles project-specific conventions — folder structure, naming, testing strategy.
- **Stack** provides technology-specific patterns — framework idioms, library-specific gotchas, type conventions.

This separation means you never repeat yourself. A TypeScript project inherits global rules automatically, adds workspace conventions, and layers on TypeScript-specific patterns.

### 2.2 Skills as Lazy-Loaded Modules

Skills use a **two-phase loading** pattern:

1. **Phase 1 (Always):** Agent reads frontmatter only (`name` + `description`). Cost: ~50 tokens per skill.
2. **Phase 2 (On-demand):** Agent reads the full `SKILL.md` body when it determines the skill is relevant. Cost: ~500–2000 tokens.

This is critical for token efficiency. If you have 10 skills but only 2 are relevant to the current task, you save ~8,000 tokens compared to loading everything.

**Design rule: Keep the `description` field honest and specific.** A vague description like "helps with code" will cause false-positive activations. A precise description like "Generates a systematic debugging plan when the user reports a runtime error" gives the agent a clear activation signal.

### 2.3 Workflows as Deterministic Procedures

Workflows are fundamentally different from rules and skills:

- **Rules** = constraints (what NOT to do)
- **Skills** = knowledge (HOW to do something)
- **Workflows** = procedures (WHAT to do, step by step)

A workflow should read like a checklist. The agent follows it linearly, checking off each step. This reduces hallucination because the agent isn't inventing a process — it's following yours.

**Design rule: Every workflow must have explicit exit criteria.** The agent needs to know when it's "done." Without this, it will keep going and burn tokens on unnecessary polish.

---

## 3. Token Efficiency Architecture

### 3.1 The Token Cost Model

Understanding where tokens go:

```
┌────────────────────────────────────────────┐
│              Token Budget Per Turn          │
├────────────────────────────────────────────┤
│  System prompt + Rules      │ ~2,000 fixed │
│  Conversation history       │ ~1,000-5,000 │
│  File contents (reads)      │ ~500-10,000  │ ← BIGGEST VARIABLE
│  Agent response             │ ~500-3,000   │
│  Tool calls                 │ ~200-1,000   │
└────────────────────────────────────────────┘
```

The biggest controllable cost is **file reads.** This library attacks it from two angles:

1. **Rules that prevent unnecessary reads.** The agent is instructed to check file structure first (via `list_dir` or `grep`) before opening files.
2. **Skills that teach efficient reading patterns.** The `token-optimizer` skill explicitly teaches the agent to read only the relevant lines of a file rather than the entire thing.

### 3.2 Response Compression Rules

The global rules enforce a compressed response format:

| Pattern | Before (verbose) | After (compressed) |
|:--------|:------------------|:-------------------|
| Explanation | "I've made the following changes to address your request..." (50 tokens) | "Changes:" (2 tokens) |
| Code context | Re-prints the entire function with 1 changed line | Shows only the diff |
| Confirmation | "Would you like me to proceed with this approach?" | Just does it (per rules) |
| Summary | Paragraph explaining what was done | Bullet list, 3-5 items |

### 3.3 The "Ask Before Reading" Protocol

One of the most impactful rules in this library:

> Before reading a file, check if you already have enough context from the conversation, file listing, or grep results. Only read a file if you cannot answer the question without it.

This alone can cut file-read tokens by 50-70% in a typical session.

---

## 4. Safety Architecture

### 4.1 The Permission Model

```
┌──────────────────────────────────────────┐
│           Action Classification          │
├──────────────────────────────────────────┤
│  SAFE (no approval needed)               │
│  • Reading files                         │
│  • Listing directories                   │
│  • Running grep/search                   │
│  • Generating code suggestions           │
│                                          │
│  CAUTION (auto-run if confident)         │
│  • Writing new files                     │
│  • Running dev servers                   │
│  • Running test suites                   │
│                                          │
│  DANGEROUS (always ask)                  │
│  • Deleting files                        │
│  • Modifying .env, package.json, etc.    │
│  • Installing dependencies               │
│  • Running build/deploy commands         │
│  • Any git push/force operation          │
│  • External network requests             │
└──────────────────────────────────────────┘
```

### 4.2 Protected Files

The following files are **never** modified without explicit user confirmation:

- `.env`, `.env.*` — Secrets and configuration
- `package.json`, `package-lock.json` — Dependency manifest
- `docker-compose.yml`, `Dockerfile` — Container config
- `*.config.js`, `*.config.ts` — Build/tool configuration
- `.gitignore` — Version control rules
- `CI/CD files` — `.github/workflows/`, `Jenkinsfile`, etc.

---

## 5. Rule Writing Guidelines

### 5.1 The CARES Framework

Every rule should satisfy **CARES**:

- **C**lear — No ambiguity. The agent should never have to "interpret" a rule.
- **A**ctionable — Must describe a concrete behavior, not a vague aspiration.
- **R**easonable — The rule must be followable in all realistic scenarios.
- **E**fficient — Must not increase token usage. If a rule requires reading extra files, it should save more tokens than it costs.
- **S**pecific — Must include examples of both correct and incorrect behavior.

### 5.2 Anti-Patterns to Avoid

❌ **Vague aspirational rules:**
> "Write high-quality, maintainable code."
> (Meaningless — the agent already tries to do this)

✅ **Specific, actionable rules:**
> "Functions must be ≤30 lines. If longer, extract helper functions. Exception: switch statements with >5 cases."

❌ **Redundant with model training:**
> "Use proper indentation and formatting."
> (All models already do this)

✅ **Project-specific overrides:**
> "Use tabs for indentation, 4 spaces wide. This overrides your default 2-space preference."

❌ **Rules that require reading entire codebases:**
> "Before writing any code, understand the entire project architecture."
> (This burns thousands of tokens)

✅ **Rules that enable targeted reading:**
> "Before modifying a module, read the module's index file and any relevant test file."

---

## 6. Maintenance Strategy

### 6.1 The "Two Strikes" Rule

If you find yourself correcting the agent for the same mistake **twice**, create a rule. This is your feedback loop:

```
Agent makes mistake → You correct it → Agent does it again → CREATE A RULE
```

### 6.2 Quarterly Review

Every 3 months, review your rules:

1. **Delete stale rules** — frameworks update, patterns change.
2. **Merge overlapping rules** — consolidate redundancy.
3. **Check token cost** — if your rules exceed 3,000 tokens total, you're probably over-specifying.
4. **Test activation** — ask the agent "what skills/rules do you have?" and verify.

### 6.3 Version Control

All rules, skills, and workflows should be committed to git. This provides:
- **Team alignment** — everyone's agent behaves the same.
- **History** — you can see *when* a rule was added and *why*.
- **Rollback** — if a rule causes problems, revert it.

---

## 7. Metrics

Track these to measure the effectiveness of your setup:

| Metric | How to Measure | Target |
|:-------|:---------------|:-------|
| Token cost per task | Check IDE usage stats | <8k avg |
| Correction rate | Count "no, I meant..." messages | <1 per task |
| Destructive errors | Count unintended file changes | 0 |
| First-attempt success | Did the agent get it right on try 1? | >70% |
| Skill activation accuracy | Does the agent load the right skills? | >90% |
