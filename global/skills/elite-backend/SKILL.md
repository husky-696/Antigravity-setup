---
name: ⚡ elite-backend
description: Scalable backend architecture with Supabase, Auth, and type-safe database layers.
category: backend
---

# Elite Backend Development

Use `/elite-backend` to architect secure, scalable, and type-safe backends. Focus on Supabase integration and robust data modeling.

## Tech Stack
- **Provider**: Supabase (PostgreSQL, Auth, Storage, Edge Functions).
- **ORM/Query**: Drizzle ORM (preferred) or Prisma.
- **Validation**: Zod (for all API/DB schemas).
- **Runtime**: Bun (fast execution).

## Core Principles
- **Security**: Row Level Security (RLS) is MANDATORY. No public schemas.
- **Type-Safety**: Generate TypeScript types from DB schemas. Sync constantly.
- **Edge Functions**: Use for complex logic, webhooks, or third-party integrations.
- **Real-time**: Use Supabase channels for live UI updates.

## Architecture Patterns
- **Local-First**: Design schemas to support offline sync where possible.
- **Relational Integrity**: Use proper foreign keys and indexes.
- **Auth**: Always use PKCE flow for mobile/web.

## Commands
- `/elite-backend-schema`: Designs a normalized DB schema with RLS rules.
- `/elite-backend-function`: Scaffolds a Deno/Bun edge function.
