# Coding Standards & Design Patterns

Follow these rules for all code you write or modify. These are universal defaults, not a replacement for language or framework conventions.

---

## 0. Project-Specific Standards First

Before the first implementation in a new project:

- Check `.ai/config.json`, existing formatter/linter configs, package files, and documentation
- If coding standards are not defined, ask the operator which conventions to use
- Ask specifically about naming, formatting, test style, error handling, and commit style
- Record the answer in `.ai/config.json` under `standards` or in the Project Overrides section below
- Prefer the idiomatic conventions of the chosen language/framework over generic examples in this file
- Do not apply language-specific rules unless the stack or operator explicitly chooses them

## Project Overrides

<!-- Fill during project init or when the operator defines project-specific conventions. -->

---

## 1. Universal Naming Principles

- Use names that reveal intent and domain meaning
- Keep names concise, but avoid unclear abbreviations
- Boolean names should read as questions or predicates when the language supports it
- Use the naming style expected by the selected language, framework, and ecosystem
- Keep public API names stable once consumers depend on them

## 2. File Organization

- Group related files by feature or domain unless the project has a stronger convention
- Keep one primary concept per file when practical
- Avoid files that mix unrelated responsibilities
- Split files when they become hard to navigate or review
- Preserve existing project structure unless there is a clear reason to change it

## 3. Design Principles

- Prefer simple, explicit code over clever abstractions
- Separate business rules from framework and infrastructure concerns
- Keep dependencies flowing in the direction defined by `.ai/rules/ARCHITECTURE.md`
- Introduce patterns only when they solve a concrete problem
- Avoid god objects, hidden global state, dead code, and duplicated business logic

## 4. Formatting

- Use the configured formatter/linter for the project
- If no formatter/linter is configured, ask before introducing one
- Avoid broad reformatting in unrelated files
- Keep style consistent with nearby code when editing existing files
- Prefer small, reviewable diffs

## 5. Error Handling

- Use a consistent error model across the project
- Validate inputs at system boundaries
- Treat expected errors differently from unexpected failures
- Preserve useful diagnostic context in logs without exposing secrets or PII
- Do not swallow errors silently

## 6. Concurrency and Async Work

- Run independent work in parallel when the language/runtime supports it safely
- Avoid unbounded concurrency; batch, throttle, or queue work when needed
- Make cancellation, timeout, and retry behavior explicit for external calls
- Keep shared mutable state minimal and protected

## 7. Comments and Documentation

- Comments should explain why, not restate what the code already says
- Document public APIs, non-obvious decisions, and operational gotchas
- Remove commented-out code instead of leaving it behind
- Mark temporary workarounds with a reason and follow-up path

## 8. Testing Conventions

- Test behavior, not implementation details
- Cover happy paths, edge cases, and error paths
- Keep tests deterministic and isolated from shared state
- Mock at boundaries, not inside the unit under test
- Use the project's selected test framework and naming style

## 9. Commit Conventions

Use the project's chosen commit convention. If none is defined, recommend Conventional Commits:

```
type(scope): description
```

Common types: `feat`, `fix`, `refactor`, `test`, `docs`, `chore`, `perf`, `style`, `ci`, `build`.

## 10. Code Review Checklist

- [ ] Follows project-specific conventions or asks when they are missing
- [ ] No commented-out code or unrelated reformatting
- [ ] Error handling is present and appropriate
- [ ] Logs do not contain secrets or PII
- [ ] Tests cover the meaningful behavior of the change
- [ ] No unnecessary dependencies added
- [ ] Changes are backward compatible, or a migration path is documented
- [ ] Documentation is updated when public behavior changes
