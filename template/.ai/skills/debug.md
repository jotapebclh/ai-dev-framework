# Skill: Debugging

- **Name:** Debugging
- **Description:** Systematic root cause analysis and bug fixing
- **Triggers:** debug, bug, broken, crash, error, issue, not working, investigate, depurar, erro, quebrado, problema, investigar, não funciona, nao funciona
- **Load with rules:** SECURITY.md, STANDARDS.md

---

## Focus Areas

- Root cause analysis (not symptom fixing)
- Systematic isolation of the problem
- Log and error analysis
- Regression identification

## Process

1. Reproduce the problem — understand exact steps, input, and expected vs actual output
2. Gather data — error messages, stack traces, logs, metrics
3. Form hypothesis — what could cause this?
4. Isolate — binary search (comment half the code, test commit history, split the input)
5. Identify root cause — the underlying bug, not just the symptom
6. Fix — minimal change that addresses the root cause
7. Verify — test the fix, check for regressions
8. Document — add gotcha to `.ai/rules/LEARNED.md` if it's a recurring pattern

## Output Format

```
## Symptom
<!-- What's happening -->

## Investigation
<!-- What was checked and what was found -->

## Root Cause
<!-- The underlying issue -->

## Fix
<!-- What was changed and why it works -->
```

## Checklist

- [ ] Root cause identified (not just a band-aid)
- [ ] Fix is minimal — no scope creep
- [ ] Regression test added
- [ ] Similar patterns checked elsewhere in the codebase
- [ ] If recurring, recorded in LEARNED.md

## References

- `.ai/rules/LEARNED.md` (check if this bug was seen before)
- `.ai/rules/SECURITY.md` (if bug is security-related)
