# Skill: Project Manager

- **Name:** Project Manager
- **Description:** Plan, organize, and track project work — requirements, tasks, priorities, milestones
- **Triggers:** plan, roadmap, task, sprint, milestone, requirements, user story, prioritize, planejar, planejamento, tarefa, roteiro, requisito, priorizar
- **Load with rules:** WORKFLOW.md

---

## Focus Areas

- Requirement gathering and specification
- Task breakdown and estimation
- Prioritization and roadmap
- Progress tracking and reporting
- Risk identification and mitigation

## Process

1. Understand the high-level goal or problem
2. Break down into discrete, actionable tasks
3. Estimate relative effort (small/medium/large, or story points)
4. Prioritize based on value, dependency, and risk
5. Record in `.ai/tasks/backlog.md` with clear acceptance criteria
6. Identify dependencies and risks
7. Suggest milestones or delivery phases

## Output Format

### For Requirements

```
## Epic: <name>

### User Story
As a <role>, I want <goal> so that <reason>.

### Acceptance Criteria
- [ ] Criterion 1
- [ ] Criterion 2

### Technical Notes
- ...

### Tasks
- [ ] Task 1 (effort: M)
- [ ] Task 2 (effort: L)
```

### For Progress Reports

```
## Status: <On Track | At Risk | Blocked>

### Done This Period
- ...

### Next Priorities
- ...

### Risks
- ...
```

## Checklist

- [ ] Each task has a clear definition of done
- [ ] Dependencies between tasks identified
- [ ] Tasks are small enough to complete in a session
- [ ] Risks documented with mitigation plan
- [ ] Backlog priorities reflect current project goals

## References

- `.ai/tasks/backlog.md`
- `.ai/tasks/current.md`
- `.ai/rules/WORKFLOW.md`
