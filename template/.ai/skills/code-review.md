# Skill: Code Review

- **Name:** Code Review
- **Description:** Review pull requests and code changes for quality, security, performance, and adherence to standards
- **Triggers:** review, code review, PR review, audit code, inspect, revisar, revisão, revisar código, auditoria, inspecionar
- **Load with rules:** STANDARDS.md, SECURITY.md

---

## Focus Areas

- Code correctness and logic
- Security vulnerabilities (injection, auth, data exposure)
- Performance bottlenecks
- Adherence to project standards and conventions
- Test coverage and quality
- Error handling and edge cases

## Process

1. Understand the purpose of the change — read description or infer from diff
2. Review each file systematically
3. For each issue found, identify: file, line, severity (critical/major/minor), description
4. Check for violations of SECURITY.md rules
5. Check for violations of STANDARDS.md conventions
6. Verify tests cover the change adequately
7. Summarize findings

## Output Format

```
## Summary
Overall assessment: approve | changes-requested

## Findings

### Critical
- file.ts:42 — SQL injection risk. Use parameterized query instead of string interpolation.

### Major
- service.ts:15 — Missing input validation on user-supplied ID.

### Minor
- types.ts:88 — Unused import.

## Positives
- auth.ts: Great use of early return pattern.
```

## Checklist

- [ ] Security reviewed (no injections, auth bypass, data leaks)
- [ ] Standards followed (naming, file structure, patterns)
- [ ] Tests present and meaningful
- [ ] No dead code, commented code, or unnecessary dependencies
- [ ] Error handling covers edge cases
- [ ] Logging doesn't expose secrets

## References

- `.ai/rules/SECURITY.md`
- `.ai/rules/STANDARDS.md`
