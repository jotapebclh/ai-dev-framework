# Skill: Performance

- **Name:** Performance
- **Description:** Identify and resolve performance bottlenecks — profiling, optimization, and benchmarking
- **Triggers:** performance, slow, latency, bottleneck, profiling, optimize, benchmark, memory, CPU, desempenho, lento, latência, latencia, gargalo, otimizar, memória, memoria
- **Load with rules:** STANDARDS.md, ref/dependencies.md

---

## Focus Areas

- Response time and latency analysis
- Database query performance
- Memory usage and leaks
- CPU profiling
- Network and I/O optimization
- Caching strategy
- Bundle size and asset optimization (frontend)

## Process

1. Establish a baseline — measure current performance (response time, memory, CPU)
2. Identify the bottleneck — profile to find the slowest component
3. Form hypothesis about the cause
4. Apply one optimization at a time
5. Re-measure after each change — verify improvement
6. Document the optimization and its impact

## Common Bottlenecks & Fixes

| Symptom | Likely Cause | Fix |
|---------|-------------|-----|
| Slow queries | Missing index, full table scan | Add index, optimize query |
| High memory | Object retention, no pagination | Fix leaks, add pagination |
| High CPU | Inefficient algorithm, tight loops | Optimize algorithm, add caching |
| Slow API calls | Serial requests, no caching | Parallelize, add cache layer |
| N+1 queries | ORM lazy loading | Eager load, batch queries |
| Large payloads | Over-fetching data | Select only needed fields, paginate |
| Slow renders | Unnecessary re-renders | Memoize, virtualize lists |

## Output Format

```
## Profile
<!-- What was measured and how -->

## Baseline
- Metric A: value
- Metric B: value

## Bottleneck
<!-- What was identified as the slowest component -->

## Optimization Applied
<!-- What was changed -->

## Result
- Metric A: before → after (X% improvement)
- Metric B: before → after (X% improvement)
```

## Checklist

- [ ] Baseline measured before optimization
- [ ] One change at a time — no shotgun optimizations
- [ ] Optimization verified with measurements
- [ ] No regression in correctness (tests pass)
- [ ] Trade-off documented (e.g., memory vs speed)
- [ ] Added to LEARNED.md if the observation should guide future optimization

## References

- `.ai/rules/STANDARDS.md` (Async Patterns, Caching)
- `.ai/rules/ARCHITECTURE.md` (Caching Strategy)
- `.ai/rules/LEARNED.md`
