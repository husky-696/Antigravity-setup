---
name: 🚢 elite-ship
description: High-velocity deployment, CI/CD, and project lifecycle management.
category: devops
---

# Elite Shipping & DevOps

Use `/elite-ship` to handle deployments, version control, and project hygiene with maximum speed and reliability.

## Tech Stack
- **CI/CD**: GitHub Actions.
- **Hosting**: Vercel (Web), Expo EAS (Mobile).
- **Package Manager**: Bun (MANDATORY).
- **Environment**: Dotenv with validation.

## Core Workflows
- **Deploying Web**: `vercel --prod` for manual, automatic on push. Ensure preview environments are configured.
- **Building Mobile**: `eas build --platform all`. Use internal distribution for rapid testing.
- **Release**: Conventional Commits only. Use `standard-version` or similar for changelogs.
- **Cleanliness**: Prune unused dependencies, optimize lockfiles, and maintain strict `.gitignore`.

## Commands
- `/elite-ship-vercel`: Prepares and deploys the current project to Vercel.
- `/elite-ship-eas`: Triggers an EAS build or update.
- `/elite-ship-clean`: Audits and cleans the project structure.
