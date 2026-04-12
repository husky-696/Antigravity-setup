# Stack Rules: Python + FastAPI

> Copy to `.agent/rules/stack.md` in Python/FastAPI projects.

---

## Python Conventions

- **Python 3.11+** unless the project specifies otherwise.
- **Type hints everywhere.** All function parameters, return types, and class attributes must be typed.
- **Use `pathlib.Path`** over `os.path` for file operations.
- **Use f-strings** for string formatting. No `.format()` or `%` formatting.
- **Use `dataclasses` or Pydantic models** instead of plain dicts for structured data.
- **Virtual environments** are mandatory. Never install to the system Python.
- **Prefer `ruff`** for linting and formatting. Falls back to `black` + `isort` + `flake8`.

## FastAPI Patterns

- **Router organization:** One router per domain (`users.py`, `orders.py`), all in `app/routers/`.
- **Dependency injection** for shared logic (auth, DB sessions, config).
- **Pydantic models** for all request/response schemas:
  - `schemas/` directory for Pydantic models
  - Separate `Create`, `Update`, and `Response` models
  - Use `BaseModel` with `model_config = ConfigDict(from_attributes=True)` for ORM integration
- **Status codes** — always return explicit status codes: `status_code=status.HTTP_201_CREATED`.
- **Background tasks** — use `BackgroundTasks` for fire-and-forget operations, not `asyncio.create_task`.

## Project Structure

```
app/
├── main.py           # FastAPI app creation, middleware, startup
├── config.py         # Settings using pydantic-settings
├── database.py       # Database engine and session
├── dependencies.py   # Shared dependencies (auth, DB session)
├── models/           # SQLAlchemy/ORM models
├── schemas/          # Pydantic request/response schemas
├── routers/          # API route handlers
├── services/         # Business logic (separate from route handlers)
├── utils/            # Shared utilities
└── tests/            # Test directory mirroring app structure
```

## Error Handling

- Use custom exception handlers registered on the FastAPI app.
- Create domain-specific exceptions: `class UserNotFoundError(Exception)`.
- Return consistent error response format:
  ```json
  {"detail": "Human-readable message", "code": "MACHINE_READABLE_CODE"}
  ```
- Never expose internal errors (stack traces, SQL queries) in API responses.

## Database

- **Async by default** — use `asyncpg` or `aiosqlite` with `SQLAlchemy` async engine.
- **Alembic** for migrations — never modify the database schema directly.
- **Session management** via dependency injection, not global session.
- **Use transactions** for multi-step operations.

## Testing

- **pytest** with `pytest-asyncio` for async tests.
- Use `httpx.AsyncClient` for testing API endpoints.
- Fixtures for database setup/teardown.
- **Test organization mirrors source:** `tests/test_users.py` tests `routers/users.py`.

## Common Gotchas

- `async def` vs `def` in route handlers — use `async def` for I/O-bound operations, `def` for CPU-bound
- Pydantic v2 uses `model_dump()` not `.dict()`, `model_validate()` not `.from_orm()`
- `Depends()` values are NOT shared between requests by default
- Don't use mutable default arguments (`def foo(items: list = [])` is a bug)
- `datetime.utcnow()` is deprecated — use `datetime.now(UTC)`

## File Naming

- `snake_case.py` for all Python files
- `test_snake_case.py` for test files
- `__init__.py` required for packages (can be empty)
