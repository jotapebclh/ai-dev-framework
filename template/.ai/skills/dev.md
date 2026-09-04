# Skill: Development

- **Name:** Development
- **Description:** General development — implement features, fix bugs, write code following project conventions
- **Triggers:** implement, create, build, develop, code, program, implementar, criar, construir, desenvolver, codar, corrigir
- **Load with rules:** STANDARDS.md, ARCHITECTURE.md

---

## Focus Areas

- Feature implementation
- Bug fixing
- Code correctness and maintainability
- Following project conventions

## Process

1. Understand the requirement — ask clarifying questions if ambiguous
2. Check `.ai/tasks/current.md` for context and planned work
3. Review relevant section of the codebase
4. Check `.ai/rules/LEARNED.md` for project-specific gotchas
5. Implement following STANDARDS.md and ARCHITECTURE.md
6. Write or update tests alongside the implementation
7. Run linter and type checker before finishing
8. If user validation is pending, set `.ai/tasks/current.md` to `Validation` with what changed and what to test
9. Move to `.ai/tasks/completed.md` only after validation/testing is explicitly complete
10. Update `.ai/tasks/current.md` only at meaningful milestones

## Output Format

- Explain the approach before writing code
- Present code in logical, reviewable chunks
- Summarize what was changed and why
- When ready for validation, list what the user should test and ask whether to finalize after testing

## Checklist

- [ ] Code follows STANDARDS.md naming and conventions
- [ ] Tests added or updated
- [ ] No secrets committed
- [ ] Linter passes
- [ ] Error handling is in place
- [ ] Backward compatible (or migration path provided)

## References

- `.ai/rules/STANDARDS.md`
- `.ai/rules/ARCHITECTURE.md`
- `.ai/rules/LEARNED.md`
