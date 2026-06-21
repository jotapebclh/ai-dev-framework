# Skill: Security

- **Name:** Security
- **Description:** Security audit, threat modeling, vulnerability assessment, and secure coding guidance
- **Triggers:** security, audit, vulnerability, threat model, pentest, CVE, OWASP, segurança, auditoria, vulnerabilidade, ameaça
- **Load with rules:** SECURITY.md, ref/dependencies.md, ref/env.md

---

## Focus Areas

- Threat modeling (STRIDE per feature)
- Dependency vulnerability scanning
- Authentication & authorization review
- Data protection (PII, encryption, masking)
- API security (rate limiting, CORS, input validation)
- Infrastructure security (network, secrets, IAM)

## Process

1. Identify the scope of the audit (feature, endpoint, service, config)
2. Apply STRIDE per component: Spoofing, Tampering, Repudiation, Info Disclosure, DoS, Elevation of Privilege
3. Check authentication and authorization boundaries
4. Review data flows for sensitive data exposure
5. Check dependency versions against known CVEs
6. Verify secret management (no hardcoded keys)
7. Validate security headers and CORS configuration
8. Report findings with severity levels and remediation steps

## Output Format

```
## Scope
<!-- What was reviewed -->

## Threat Model (STRIDE)
| Threat | Component | Risk | Mitigation |
|--------|-----------|------|------------|

## Findings

### Critical
- issue — description — recommendation

### High
- issue — description — recommendation

### Medium
- issue — description — recommendation

## Recommendations Summary
1. ...
```

## Checklist

- [ ] Input validation at all entry points
- [ ] Authentication verified for protected routes
- [ ] Authorization checked (least privilege)
- [ ] Secrets detected in code? (none)
- [ ] Dependencies scanned for CVEs
- [ ] HTTPS enforced
- [ ] Security headers present
- [ ] Rate limiting applied to sensitive endpoints
- [ ] Logs sanitized (no PII/secrets)

## References

- `.ai/rules/SECURITY.md`
- `.ai/ref/env.md` (check for exposed secrets)
- OWASP Top 10
