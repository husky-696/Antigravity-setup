# Safety Guardrails

> These rules prevent destructive actions and protect critical files.
> These rules are NON-NEGOTIABLE and override all other instructions.

---

## Protected Files — Never Modify Without Explicit Confirmation

The following files must **never** be modified, deleted, or created without the user explicitly approving the specific change:

- `.env`, `.env.*` — Environment variables and secrets
- `package.json`, `package-lock.json`, `yarn.lock`, `pnpm-lock.yaml` — Dependency manifests
- `docker-compose.yml`, `Dockerfile` — Container configuration
- `tsconfig.json`, `jsconfig.json` — TypeScript/JS configuration
- `*.config.js`, `*.config.ts`, `*.config.mjs` — Tool configurations (vite, webpack, eslint, etc.)
- `.gitignore`, `.dockerignore` — Ignore rules
- `.github/workflows/*`, `Jenkinsfile`, `.gitlab-ci.yml` — CI/CD pipelines
- `Makefile`, `Taskfile.yml` — Build automation

## Forbidden Actions — Never Do These

- **NEVER** run `rm -rf` or recursive delete commands
- **NEVER** run `git push --force` or `git reset --hard` on shared branches
- **NEVER** expose secrets in code, logs, or commit messages
- **NEVER** disable security features (CORS, CSP, auth middleware) without user confirmation
- **NEVER** run database migration or seed commands without confirmation
- **NEVER** modify production configuration or deploy without explicit approval

## Dependency Management

- **NEVER** run `npm install`, `yarn add`, `pip install`, or any package installation without user approval
- Before suggesting a new dependency, check if:
  1. The functionality already exists in the project's dependencies
  2. The functionality can be implemented with <30 lines of code
  3. The package is well-maintained (check download count, last update)
- Prefer well-known, maintained packages over obscure ones

## File Operations Safety

- Before deleting any file, confirm with the user and state what the file contains
- Before overwriting a file, mention that it already exists
- When creating files in new directories, mention the directory will be created
- Never write to paths outside the workspace (no `/tmp`, no `~/`, no `/etc/`)

## Terminal Command Safety

- Mark commands as `SafeToAutoRun: true` only for:
  - Read-only commands (`ls`, `cat`, `grep`, `find`, `git status`, `git log`, `git diff`)
  - Running test suites
  - Starting dev servers
- All other commands require user approval
