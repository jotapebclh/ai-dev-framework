# Security Rules

Apply these rules to every task. Do not compromise on security.

---

## 1. Input Validation

- Validate all external input at the boundary
- Use allowlists (deny unknown) over blocklists (allow known)
- Validate: type, length, format, range
- Reject malformed input early — fail fast
- Sanitize output for the target context (HTML, SQL, JSON, etc.)

## 2. Authentication & Authorization

- Never roll your own auth — use established libraries (Passport, JWT, OAuth, etc.)
- Store passwords using a slow hash (bcrypt, argon2, scrypt) — never plain text or MD5/SHA1
- Use short-lived tokens with refresh rotation
- Validate every request — do not trust the client
- Apply least privilege: each user/role gets the minimum access needed
- Rate-limit login endpoints

## 3. Secrets Management

- **Never** hardcode secrets (API keys, passwords, tokens, DB credentials)
- Use environment variables or a secrets manager (Vault, AWS Secrets Manager, etc.)
- Use `.env` files for local development only — never commit `.env`
- Rotate secrets regularly
- Audit for leaked secrets before each commit (use tools like git-secrets, truffleHog)

## 4. Injection Prevention

### SQL / NoSQL
- Use parameterized queries or an ORM with safe bindings
- Never concatenate user input into queries
- Escape dynamic values in NoSQL queries

### Command Injection
- Avoid `exec()`, `eval()`, `system()` with user input
- If unavoidable, sanitize and use allowlists

### XSS
- Context-appropriate output encoding (HTML entity, URL, JS, CSS)
- Use Content Security Policy (CSP) headers
- Avoid `innerHTML`, `dangerouslySetInnerHTML`, `v-html`

### Path Traversal
- Normalize and validate file paths
- Restrict file access to a defined root directory

## 5. CSRF Protection

- Use anti-CSRF tokens for state-changing requests
- Set `SameSite=Strict` or `SameSite=Lax` on session cookies
- Validate `Origin` or `Referer` headers

## 6. CORS

- Restrict allowed origins to known domains
- Do not use `Access-Control-Allow-Origin: *` in production
- Whitelist specific methods and headers

## 7. Secure Communication

- Enforce HTTPS in production
- Use HSTS headers
- Set secure flags on cookies: `HttpOnly`, `Secure`, `SameSite`
- Use TLS 1.2+ for external service calls

## 8. Error Handling & Logging

- Never expose stack traces, internal paths, or DB details to users
- Return generic error messages to clients; log full details server-side
- Sanitize logs — strip secrets, tokens, PII before writing
- Use structured logging (JSON) for queryability

## 9. File Uploads

- Validate file type by content (MIME), not just extension
- Limit file size
- Store uploads outside the web root
- Scan for malware (where applicable)
- Serve uploaded files with `Content-Disposition: attachment`

## 10. Dependency Security

- Audit dependencies regularly (`npm audit`, `pip-audit`, `safety`, etc.)
- Keep dependencies up to date
- Pin major versions, use lockfiles
- Remove unused dependencies

## 11. Rate Limiting

- Apply rate limiting to all public endpoints
- Stricter limits on login, registration, password reset
- Use token bucket, sliding window, or similar algorithm

## 12. Data Protection

- Encrypt sensitive data at rest (AES-256, envelope encryption)
- Encrypt sensitive data in transit (TLS)
- Mask/truncate PII in logs and responses
- Implement data retention and deletion policies

## 13. Security Headers

Apply these HTTP response headers:

| Header | Value |
|--------|-------|
| `Content-Security-Policy` | Restrict script/style sources |
| `X-Content-Type-Options` | `nosniff` |
| `X-Frame-Options` | `DENY` |
| `Strict-Transport-Security` | `max-age=31536000; includeSubDomains` |
| `Referrer-Policy` | `strict-origin-when-cross-origin` |
| `Permissions-Policy` | Restrict features (geolocation, camera, etc.) |
