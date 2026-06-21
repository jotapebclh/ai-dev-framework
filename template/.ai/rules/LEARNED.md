# Learned Patterns

This file stores reusable project knowledge that should influence future work. It is not a changelog.

---

## How This File Works

- When you discover a convention, gotcha, provider quirk, testing pattern, or operational constraint that future work should remember, append it to the relevant section below
- Do not wait for recurrence if rediscovering the fact would cost time or risk a bug
- If no section fits, create a new one
- If this file exceeds **50 active learned entries**, summarize older entries into the digest at the top
- Check this file before changing established patterns or investigating similar behavior

Entry format:

```markdown
- Lesson or constraint in one sentence. Context: `path/or/module`. Date: YYYY-MM-DD.
```

Do not add task-completion notes, long explanations, diffs, or one-off implementation details.

---

## Digest

*Summarized history of older entries. Updated when this file exceeds 50 active learned entries. Format:*

```
### Conventions (M/D)
- convention description (date)

### Gotchas (M/D)
- gotcha description (date)

### Patterns (M/D)
- pattern description (date)
```

*No entries yet.*

---

## Project-Specific Conventions

<!-- e.g., "Service-layer validation owns date range limits so handlers and internal callers share behavior. Context: `internal/indicators`. Date: YYYY-MM-DD." -->


## Recurring Gotchas

<!-- e.g., "Provider X free tier returns only the last 365 days. Context: `internal/providers`. Date: YYYY-MM-DD." -->


## Patterns Discovered

<!-- e.g., "External provider values are normalized before persistence and cache writes. Context: `internal/indicators`. Date: YYYY-MM-DD." -->


## Integration and API Notes

<!-- e.g., "Dashboard endpoints should avoid provider fan-out unless explicitly designed as best-effort refresh. Context: `/dashboard/summary`. Date: YYYY-MM-DD." -->


## Performance Observations

<!-- e.g., "The /reports endpoint paginates 10k rows. Adding a composite index on (status, created_at) reduced query time by 80%." -->


## Security Notes

<!-- e.g., "The admin panel must never be exposed to the public internet. Always require VPN." -->


## Testing Patterns

<!-- e.g., "Integration tests require Docker Compose services and an opt-in flag to avoid accidental runs. Context: `make test-integration`. Date: YYYY-MM-DD." -->
