# Skill: Refactoring

- **Name:** Refactoring
- **Description:** Improve code structure and quality without changing external behavior
- **Triggers:** refactor, restructure, improve code, clean up, tech debt, simplify, refatorar, reestruturar, melhorar código, limpar, dívida técnica, divida tecnica, simplificar
- **Load with rules:** STANDARDS.md, ARCHITECTURE.md

---

## Focus Areas

- Code readability and clarity
- Reducing duplication
- Improving testability
- Removing dead code
- Applying design patterns appropriately
- Performance improvements without behavior change

## Process

1. Identify the scope — what code will be touched?
2. Ensure existing tests pass before starting
3. Make one change at a time — small, atomic steps
4. After each change: run tests to verify behavior is preserved
5. Clean up: remove dead code, unused imports, commented code
6. Verify all existing tests still pass after all changes

## Refactoring Catalog

| Technique | When |
|-----------|------|
| Extract method/function | A block does one thing that can be named |
| Rename variable/function | Name doesn't reveal intent |
| Inline variable | Variable name is no clearer than the expression |
| Replace condition with polymorphism | Complex conditional branching |
| Extract class | A class has too many responsibilities |
| Introduce parameter object | Multiple parameters that travel together |
| Replace magic numbers with constants | Literal values without explanation |

## Output Format

```
## Before
<!-- Original code -->

## After
<!-- Refactored code -->

## Rationale
<!-- Why this refactoring was applied -->
```

## Checklist

- [ ] All existing tests pass before AND after
- [ ] Zero behavior change — only structure
- [ ] Each commit is one refactoring step
- [ ] No dead code left behind
- [ ] Linter passes
- [ ] Refactored code is measurably clearer or simpler

## References

- `.ai/rules/STANDARDS.md` (Design Patterns section)
- `.ai/rules/ARCHITECTURE.md` (layer boundaries)
