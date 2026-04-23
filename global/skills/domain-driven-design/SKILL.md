---
name: ⭐ domain-driven-design
description: "Plan and route Domain-Driven Design work from strategic modeling to tactical implementation and evented architecture patterns."
risk: safe
source: self
tags: "[ddd, domain, bounded-context, architecture]"
date_added: "2026-02-27"
---

# Domain Driven Design

Plan and route Domain-Driven Design work from strategic modeling to tactical implementation and evented architecture patterns.

## Instructions
1. Run a viability check before committing to full DDD.
2. Produce strategic artifacts first: subdomains, bounded contexts, language glossary.
3. Route to specialized skills based on current task.
4. Define success criteria and evidence for each stage.

### Viability check

Use full DDD only when at least two of these are true:

- Business rules are complex or fast-changing.
- Multiple teams are causing model collisions.
- Integration contracts are unstable.
- Auditability and explicit invariants are critical.

### Routing map

- Strategic model and boundaries: `/ddd-strategic-design`
- Cross-context integrations and translation: `/ddd-context-mapping`
- Tactical code modeling: `/ddd-tactical-patterns`
- Read/write separation: `/cqrs-implementation`
- Event history as source of truth: `/event-sourcing-architect` and `/event-store-design`
- Long-running workflows: `/saga-orchestration`
- Read models: `/projection-patterns`
- Decision log: `/architecture-decision-records`

If templates are needed, open `references/ddd-deliverables.md`.

## How to Invoke
- Use `/domain-driven-design` when starting a task in this domain.
- I will apply these patterns and best practices immediately.