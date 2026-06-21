# Architecture Decision Records

<!--
Index of all ADRs. Each record captures a significant technical decision.
The AI creates a new ADR when an accepted decision has lasting impact.
-->

## When To Create An ADR

Create or update an ADR when a decision affects future work across more than one task or module:

- Architecture or package/module boundaries
- Public API contract, response shape, or error model
- Data model, migration strategy, persistence, cache, or consistency behavior
- Authentication, authorization, secrets, or security-sensitive flow
- External provider/integration choice or provider fallback strategy
- CI, test strategy, deployment, infrastructure, or local development workflow
- Cross-cutting frontend/backend contract or UX data contract
- A trade-off that future agents should not reopen without new evidence

Do not create ADRs for one-off bug fixes, small localized implementation details, copy changes, or task status updates. Put reusable implementation lessons in `.ai/rules/LEARNED.md` instead.

Ask the user only when the decision itself is unclear. If the decision was accepted during implementation and meets the criteria above, record it.

| # | Title | Date | Status |
|---|-------|------|--------|
