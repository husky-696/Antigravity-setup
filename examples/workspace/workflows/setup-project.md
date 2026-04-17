# Workflow: Setup Project

## Trigger
`/setup-project`

## Objective
Initialize or configure a new project with proper structure, tooling, and documentation.

## Input
The user describes the project. Ask for any missing info:
1. **Project name**
2. **Technology stack** (language, framework, runtime)
3. **Project type** (library, API, web app, CLI tool, etc.)
4. **Package manager preference** (npm, yarn, pnpm, pip, etc.)

## Steps

### Phase 1: Scaffold

1. **Check current state.** Is this an empty directory or does it have existing files?

2. **Initialize the project:**
   - Use the appropriate scaffold tool (e.g., `npx -y create-vite@latest ./`)
   - Run with `--help` first to find non-interactive flags
   - Initialize in the current directory, not a subdirectory
   - Select sensible defaults based on the user's stated preferences

3. **Set up version control** (if not already):
   - `git init`
   - Create a `.gitignore` appropriate for the tech stack

### Phase 2: Structure

4. **Create the directory structure:**
   ```
   src/          # Source code
   tests/        # Test files
   docs/         # Documentation (if applicable)
   scripts/      # Build/utility scripts (if applicable)
   ```
   Adapt to the framework's conventions (e.g., Next.js uses `app/`, `components/`).

5. **Create essential files:**
   - `README.md` — Project name, description, setup instructions, usage
   - `.gitignore` — Appropriate for the tech stack
   - Entry point file(s) for the chosen framework

### Phase 3: Tooling

6. **Configure development tools** (with user approval for each):
   - Linter (ESLint, Ruff, etc.)
   - Formatter (Prettier, Black, etc.)
   - TypeScript config (if applicable)
   - Test runner (Jest, Vitest, pytest, etc.)

7. **Set up scripts** in package.json (or equivalent):
   - `dev` — Start development server
   - `build` — Production build
   - `test` — Run tests
   - `lint` — Run linter

### Phase 4: Agent Config

8. **Create workspace rules:**
   ```
   mkdir -p .agent/rules .agent/workflows
   ```
   
   Create a minimal `.agent/rules/project.md` with:
   - Tech stack declaration
   - Project structure overview
   - Key conventions for this project

### Phase 5: Verify

9. **Test the setup:**
   - Run `npm install` (or equivalent)
   - Run the dev server to verify it starts
   - Run the test suite to verify it passes

10. **Initial commit:**
    - Stage all files
    - Commit with `chore: initial project setup`

11. **Report:**
    ```
    ## 🚀 Project Setup Complete
    
    **Stack:** [technology choices]
    **Structure:** [key directories]
    **Scripts:** [available npm scripts]
    **Next Steps:**
    - [ ] Step 1 the user should take
    - [ ] Step 2
    ```

## Exit Criteria
- Project runs with `npm run dev` (or equivalent)
- Tests pass with `npm test` (or equivalent)
- README exists with setup instructions
- Initial git commit created
