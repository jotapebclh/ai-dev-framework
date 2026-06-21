# Workflow Rules

These rules govern the development process: Git, CI/CD, and releases.

---

## 1. Git Branching Model

Use **GitHub Flow** (simplified, trunk-based):

```
main ────────●────────────●─────────────
              \          /
feature/xxx    ●──●──●──●
```

| Branch | Purpose | Base |
|--------|---------|------|
| `main` | Production-ready code | — |
| `feat/xxx` | New features | `main` |
| `fix/xxx` | Bug fixes | `main` |
| `refactor/xxx` | Code restructuring | `main` |
| `chore/xxx` | Maintenance, deps, CI | `main` |
| `docs/xxx` | Documentation | `main` |

## 2. Branch Naming

```
<type>/<short-description>
```

- `feat/user-registration`
- `fix/login-redirect`
- `refactor/auth-middleware`
- `chore/update-deps`
- `docs/api-readme`

Use hyphens as separators. Keep names short (under 50 chars).

## 3. Commit Messages

Follow Conventional Commits:

```
<type>(<scope>): <imperative-description>
```

See `.ai/rules/STANDARDS.md` for the full specification.

### Squash or Not?

| Approach | When |
|----------|------|
| Squash merge | Default — clean history on main |
| Regular merge | When preserving branch commit history adds value |

## 4. Pull Request Process

### Before Opening a PR
- [ ] Branch is up to date with main
- [ ] All tests pass locally
- [ ] Linter passes with no warnings
- [ ] No secrets committed or exposed
- [ ] Commit messages follow conventions

### PR Template
```markdown
## Description
<!-- What does this PR do? -->

## Type
- [ ] Feature
- [ ] Bug fix
- [ ] Refactor
- [ ] Chore

## Testing
<!-- How was this tested? -->

## Checklist
- [ ] Tests added/updated
- [ ] Documentation updated
- [ ] Breaking changes? (if yes, describe migration)
```

### Code Review Rules
- Reviewers check for: correctness, security, performance, style, test coverage
- Author addresses all comments before merge
- No self-approvals

## 5. CI/CD Pipeline

### CI (on every push)
1. Lint
2. Type check
3. Unit tests
4. Integration tests
5. Build
6. Security scan (dependencies, secrets)

### CD (on merge to main)
1. All CI steps
2. Build artifacts
3. Deploy to staging
4. Smoke tests
5. Deploy to production (manual approval gate for major changes)

## 6. Versioning

Use **Semantic Versioning** (SemVer 2.0):

| Version | Change |
|---------|--------|
| MAJOR | Breaking API change |
| MINOR | New feature, backward compatible |
| PATCH | Bug fix, backward compatible |

Pre-release: `1.0.0-alpha.1`, `1.0.0-beta.2`

## 7. Release Process

1. Merge feature branches to main
2. CI runs and validates
3. Create a Git tag: `v1.2.3`
4. CI builds release artifacts
5. Generate changelog from commit messages
6. Deploy to production
7. Tag the release in GitHub/GitLab

## 8. Environment Strategy

| Environment | Purpose | Deploy Trigger |
|-------------|---------|----------------|
| `development` | Local dev | Manual |
| `staging` | QA, integration testing | PR merge to main |
| `production` | Live users | Tagged release |

- Staging mirrors production configuration (scale, services)
- Use feature flags for gradual rollouts
- Database migrations are backward compatible (no destructive changes)
