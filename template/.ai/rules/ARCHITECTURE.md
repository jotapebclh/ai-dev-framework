# Architecture Rules

These rules define the project's architectural patterns and constraints.

---

## 1. Separation of Concerns

- Organize code into distinct layers: presentation, domain, data
- Each layer depends only on the layer below (strict direction)
- Keep business logic independent of frameworks and infrastructure

### Typical Layer Structure

```
┌──────────────────────┐
│   Presentation       │  ── Controllers, views, DTOs, serializers
├──────────────────────┤
│   Application        │  ── Use cases, commands, queries, orchestrators
├──────────────────────┤
│   Domain             │  ── Entities, value objects, domain services, ports
├──────────────────────┤
│   Infrastructure     │  ── DB adapters, external API clients, file I/O
└──────────────────────┘
```

## 2. Dependency Direction

- Dependencies point **inward**: Infrastructure → Domain
- Domain layer has **zero** external dependencies
- Use dependency injection to invert infrastructure dependencies
- Define interfaces (ports) in the domain, implement in infrastructure

## 3. Error Handling Strategy

- Use a consistent error model across the application
- Distinguish between:
  - **Expected errors** (validation, not found, conflict) — return structured responses
  - **Unexpected errors** (infra failure, bugs) — log and return generic error
- Do not use exceptions for control flow
- Centralize error handling at the boundary (middleware, interceptor)

## 4. Logging Strategy

- Use structured logging (JSON output)
- Log levels: DEBUG (dev), INFO (normal ops), WARN (recoverable), ERROR (failure)
- Include correlation IDs for request tracing
- Never log secrets, tokens, or PII
- Add context: request ID, user ID, operation, duration

## 5. Testing Strategy

| Layer | Test Type | Focus |
|-------|-----------|-------|
| Domain | Unit tests | Business rules, entities, value objects |
| Application | Unit + Integration | Use cases, command handlers |
| Infrastructure | Integration | DB queries, external API calls |
| Presentation | Integration + E2E | API contracts, HTTP semantics |
| UI | Component + E2E | Rendering, user interactions |

- Aim for the testing pyramid: many unit, some integration, few E2E
- Tests must be deterministic — no shared state, mock external services

## 6. Configuration Management

- Environment-specific config via environment variables
- Defaults for local development in `.env.example`
- Never commit sensitive config (secrets, keys)
- Use a typed config object validated at startup

## 7. API Design

- Follow RESTful conventions (or GraphQL, if chosen)
- Use consistent URL structure: `/api/v1/resources`
- Version the API via URL prefix or header
- Use standard HTTP methods: GET, POST, PUT, PATCH, DELETE
- Use standard HTTP status codes
- Paginate list endpoints — always
- Return consistent response envelopes:

```json
{
  "data": {},
  "meta": {
    "page": 1,
    "total": 100
  },
  "error": null
}
```

## 8. Caching Strategy

- Cache aggressively at the HTTP layer (CDN, reverse proxy)
- Cache database query results where appropriate
- Use Redis or similar for distributed caching
- Invalidate cache on writes (write-through or write-behind)
- Set TTL on all cache entries

## 9. Observability

- Health check endpoint: `/health` returning OK/status
- Metrics endpoint: `/metrics` for Prometheus (or equivalent)
- Distributed tracing for request flows across services
- Centralized log aggregation

## 10. Folder Structure Convention

```
src/
├── app/                  # Application boot, DI setup, middleware
├── domain/               # Entities, value objects, repository interfaces
├── application/          # Use cases, commands, queries
├── infrastructure/       # DB, external APIs, file system, messaging
├── presentation/         # Controllers, views, serializers, DTOs
├── config/               # Configuration loader
└── common/               # Shared utilities, base classes, constants
```

Adjust per language/framework but preserve the separation principle.
