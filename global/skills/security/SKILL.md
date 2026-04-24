---
name: 🔐 security
description: High-end protection including biometrics, encryption, and secure architecture.
category: core
---

# Fortress Security Mode

Use `/security` to harden your application against threats and ensure user data is protected at an elite level.

## Security Protocol
1. **Biometrics**: Implement **FaceID/Fingerprint** (Expo Local Authentication) for sensitive actions or app entry.
2. **Encryption**: Use AES-256 for local storage and secure transmission.
3. **Database Security**: Enforce strict **Supabase RLS** rules. No public schemas.
4. **Auth Flow**: Use PKCE for all authentication flows. Implement secure session management.

## Hardening Patterns
- **SSL Pinning**: For mobile apps to prevent man-in-the-middle attacks.
- **Environment Safety**: Ensure secrets are NEVER committed. Use validated `.env` schemas (Zod).
- **Audit**: Regularly scan for dependency vulnerabilities (Snyk/npm audit).

## Commands
- `/security-audit`: Performs a security review of the codebase and DB rules.
- `/security-harden`: Implements biometric locks or encrypted storage patterns.
