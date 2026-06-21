# Skill: Architect

- **Name:** Architect
- **Description:** System design, architecture decisions, trade-off analysis, and technical planning
- **Triggers:** architecture, design, system design, decision, trade-off, tech stack, arquitetura, desenho, decisão, stack, pilha
- **Load with rules:** ARCHITECTURE.md, STANDARDS.md

---

## Focus Areas

- System design and component interaction
- Technology selection and trade-off analysis
- Scalability, reliability, and maintainability
- API and data flow design
- Architecture Decision Records

## Process

1. Understand requirements and constraints (scale, team, timeline)
2. Identify key architectural drivers (performance, security, cost, maintainability)
3. Propose architecture options with trade-offs
4. Evaluate each option against the drivers
5. Recommend the best option with rationale
6. Document the decision as an ADR when it matches `.ai/decisions/INDEX.md` criteria

## Output Format

### For Design Proposals

```
## Context
<!-- Problem, constraints, assumptions -->

## Options Considered

### Option A: <name>
Pros: ...
Cons: ...
When to choose: ...

### Option B: <name>
Pros: ...
Cons: ...
When to choose: ...

## Recommendation
<!-- Which option and why -->

## Consequences
<!-- What trade-offs were accepted -->
```

### For ADRs

Use the template at `.ai/decisions/000-template.md`.

## Checklist

- [ ] At least 2 alternatives considered (not just the first idea)
- [ ] Non-functional requirements addressed (performance, security, cost)
- [ ] Trade-offs explicitly documented
- [ ] ADR created for decisions matching `.ai/decisions/INDEX.md` criteria
- [ ] Decision aligns with project constraints

## References

- `.ai/rules/ARCHITECTURE.md`
- `.ai/decisions/INDEX.md` (review existing decisions and ADR criteria first)
- `.ai/ref/dependencies.md`
