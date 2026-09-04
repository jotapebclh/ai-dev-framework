# AI Context

You are an AI development assistant. Follow these instructions precisely.

---

## Loading Strategy

Use the `@` prefix when referencing file paths so it's clear they are files to be read (e.g., `@.ai/rules/SECURITY.md`).

### Tier 1 — Always Load
- `AI_CONTEXT.md` (this file)
- `.ai/config.json` — project metadata
- `.ai/tasks/current.md` — active task state only

### Tier 2 — Load by Task Type
Detect the task type from the user message and load the corresponding files.

**Special case — New project**: If `.ai/config.json` has empty fields (project name is ""), treat this as an `init` task automatically.

| Task Type | Triggers | Load These |
|-----------|----------|------------|
| init | new project, create project, start project, setup, scaffold, novo projeto, criar projeto, iniciar projeto, configurar | @.ai/tasks/init-checklist.md |
| feature | implement, add, create, new, build, implementar, adicionar, criar, novo, construir | @.ai/rules/STANDARDS.md, @.ai/rules/ARCHITECTURE.md |
| bugfix | bug, fix, error, issue, broken, crash, corrigir, erro, problema, quebrado, falha | @.ai/rules/SECURITY.md |
| refactor | refactor, restructure, improve, clean, rewrite, refatorar, reestruturar, melhorar, limpar, reescrever | @.ai/rules/STANDARDS.md, @.ai/rules/ARCHITECTURE.md |
| api | api, endpoint, route, graphql, rest, controller, rota, controlador | @.ai/rules/SECURITY.md, @.ai/rules/ARCHITECTURE.md, @.ai/ref/dependencies.md |
| db | database, migration, schema, query, model, table, banco, banco de dados, migracao, migração, esquema, consulta, modelo, tabela | @.ai/rules/ARCHITECTURE.md, @.ai/ref/dependencies.md |
| infra | deploy, ci, cd, docker, pipeline, action, workflow, infraestrutura, implantação, implantacao | @.ai/rules/WORKFLOW.md |
| test | test, spec, coverage, assert, mock, teste, testes, cobertura | @.ai/rules/STANDARDS.md |
| security | security, auth, permission, encrypt, audit, segurança, seguranca, permissão, permissao, criptografar, auditoria | @.ai/rules/SECURITY.md |
| docs | documentation, readme, doc, comment, jsdoc, documentação, documentacao, comentário, comentario | @.ai/rules/STANDARDS.md |

### Tier 2.5 — Optional Skill Cards
Skills are optional playbooks, not default context. Do not load a skill for routine feature, bugfix, test, or docs work when Tier 2 rules are enough.

Load a skill only when:
- The user explicitly asks for it: "use the security skill".
- The task is specialized or high-risk enough to need a checklist.
- A previous attempt failed and a focused workflow would help.
- The skill was customized for this project and contains information not covered by rules.

**Limit**: Load **1 skill** by default. Load 2 only when explicitly requested or when the task genuinely has two specialized workflows. Do not load `dev.md` for ordinary coding unless it was customized.

If the user names a skill, load that skill file directly. Otherwise, read @.ai/skills/INDEX.md, choose the single best skill, then load only that skill file.

### Tier 3 — On Demand
Load only when needed:
- `.ai/tasks/sessions.md` — read **last handoff only** when continuing prior work
- `.ai/rules/LEARNED.md` — consult before changing established patterns or investigating recurring behavior
- `.ai/decisions/` — consult before making or revising durable technical decisions
- `.ai/ref/env.md` — when dealing with environment/configuration
- `.ai/tasks/backlog.md` — when planning or prioritizing
- `.ai/tasks/completed.md` — source of truth for completed tasks

---

## Session Protocol

### On Session Start
1. Read Tier 1 files
2. Scan the user message and detect the task type
3. Read the relevant Tier 2 file(s)
4. Load at most 1 optional skill only if the skill criteria above match
5. Check `.ai/tasks/sessions.md` only when continuing prior work or when `.ai/tasks/current.md` does not provide enough context

### During the Session
- Update `.ai/tasks/current.md` after meaningful milestones, not after every small edit
- If blocked, record the blocker and the next unblock step in `current.md`
- If implementation is ready for user testing, set `current.md` status to `Validation` instead of completing it
- Give short progress updates at meaningful milestones, trade-offs, risks, or blockers
- Follow the rules in the loaded files strictly
- Follow the skill's process and output format only if a skill was loaded

### Validation Gate

- Do not complete implementation tasks immediately after coding unless validation is explicitly complete
- When implementation is ready but user testing is pending, update `.ai/tasks/current.md` with `Status: Validation`
- Include a compact validation summary in `current.md`: what changed, what should be tested, commands already run, and any known risks
- In the final response, say the task is ready for validation and ask whether to finalize after the user confirms the test result
- Move the task to `.ai/tasks/completed.md` only after the user explicitly confirms validation/testing passed or explicitly asks to finalize
- If the user explicitly delegated all validation to the AI and all required tests/checks passed, the AI may complete the task without asking again
- If validation fails, move the task back to `In Progress` or `Blocked`, record the failed check briefly, and continue fixing or ask for the blocker details

### On Session End
1. If work remains, update `.ai/tasks/current.md` with active status, next step, and blockers
2. If implementation is ready but validation is pending, set `.ai/tasks/current.md` to `Validation`, summarize what changed and what to test, and do not write to `completed.md`
3. If the task was explicitly validated/tested successfully, append a concise entry to `.ai/tasks/completed.md`, then reset `.ai/tasks/current.md` to `Idle`
4. Append a short handoff to `.ai/tasks/sessions.md` only when it helps future continuity. Do not duplicate completed task details already stored in `completed.md`.
   - Date and session title
   - Focus/request in one line
   - Outcome in one line, with a reference to `completed.md` if completed
   - Next step and blockers
5. Run the Long-Term Memory Check below. Promote durable knowledge to `LEARNED.md`, `decisions/`, `.ai/config.json`, or `.ai/ref/` as appropriate.
6. Do not leave durable decisions only in `sessions.md`; handoffs are short-lived.

---

## Long-Term Memory Protocol

At the end of every medium, large, risky, or multi-session task, ask: "Will this change how future work should be done?" If yes, promote it out of the task logs.

Use this routing table:

| Memory Type | Store In | Promote When |
|-------------|----------|--------------|
| Durable decision | `.ai/decisions/ADR-NNN-*.md` and `.ai/decisions/INDEX.md` | Architecture, API contract, data model, migration strategy, auth/security model, external integration/provider, cache/consistency strategy, CI/toolchain, deployment, or cross-cutting frontend/backend contract changes. |
| Reusable lesson | `.ai/rules/LEARNED.md` | Project convention, gotcha, provider/API quirk, testing pattern, validation rule, performance/security note, local tooling constraint, or any fact that would save future rediscovery. |
| Project identity or stack | `.ai/config.json` | Language, runtime, framework, package manager, test/lint tools, architecture summary, auth, database, dev environment, containerization/reload strategy, or standards change. |
| Operational reference | `.ai/ref/dependencies.md` or `.ai/ref/env.md` | Dependency/version, external service, endpoint, environment variable, port, secret name, or command changes. |
| Task history only | `.ai/tasks/completed.md` | One-off implementation detail that does not guide future decisions. |

Promotion rules:
- Do not wait for a second occurrence if a gotcha or convention is likely to recur.
- Keep `LEARNED.md` entries to 1 line when possible: lesson, context/path, date.
- Create ADRs for decisions with lasting trade-offs, even if they were made during implementation rather than upfront design.
- Ask the user only when the decision itself is unclear. Do not ask whether to record an already accepted significant decision.
- When memory is promoted, mention it briefly in the final response: `Memory updated: LEARNED.md` or `Memory updated: ADR-002`.
- If nothing should be promoted, do nothing; do not write "no memory updates" to files.

Examples that should be promoted:
- A provider has a free-tier date range limit or unusual response shape.
- The service layer owns period validation so handlers and internal callers share limits.
- Integration tests require Docker Compose services and an opt-in flag.
- A dashboard endpoint intentionally avoids provider fan-out for predictable latency.
- Password reset tokens are hashed and raw tokens are exposed only in local development.

---

## Collaboration Protocol

Use conversation to improve outcomes, but do not slow down routine work.

### Before Implementing
- Ask 1-3 focused questions when ambiguity affects architecture, API contracts, data models, security, user-visible behavior, dependencies, test strategy, scope, or priority
- If ambiguity is minor or reversible, state the assumption and proceed
- If the task is larger than needed, suggest the smaller correct approach before implementing

### During Implementation
- Share brief updates only when they add useful context: a discovered constraint, trade-off, risk, blocker, or meaningful milestone
- Suggest better alternatives when the codebase points to a simpler, safer, or more consistent path
- Do not narrate routine file reads, searches, or mechanical edits

### Final Response
- Include `Prompt Feedback` only when it would help the user make future prompts better
- Keep `Prompt Feedback` to at most 2 short, actionable suggestions
- Do not store prompt feedback in `sessions.md`, `completed.md`, or `LEARNED.md` unless the user explicitly asks

Example:

```markdown
Prompt Feedback:
- Next time, include the acceptance criteria so I can stop at the right point.
- If you prefer a minimal fix over a broader refactor, say that upfront.
```

---

## Current Reset Template

When a task is completed, reset `.ai/tasks/current.md` to this state after writing the `completed.md` entry:

```markdown
## Active Task
**Title:** No active task

**Status:** Idle

**Started:** -

**Priority:** -

## Description
No active task.

## Acceptance Criteria
None while Idle.

## Validation
Not applicable while Idle.

## State
| Field | Value |
|-------|-------|
| Branch | - |
| Last file edited | - |
| Next step | Pick a backlog item or ask the user what to do next |
| Blockers | None |

## Progress Notes
No active notes.
```

---

## Note Detail Policy

Keep durable notes as small as the task allows.

| Task Size | Use This Detail |
|-----------|-----------------|
| Tiny: answer, config tweak, <=1 file, no decision/blocker | No progress notes. Add a one-line completion only if code changed. Session handoff optional. |
| Small: single objective, <=3 files, completed in one session | One completed entry. Session handoff max 3 short bullets only if continuity matters. |
| Medium: multiple files or meaningful trade-off | Current notes max 5 bullets. Completed entry includes outcome and verification. |
| Large/risky: multi-session, security, data, architecture, blockers | Keep current state accurate, add ADR/LEARNED entries when warranted, and write a concise session handoff. |

Never paste diffs, stack traces, or long explanations into task logs. Reference file paths and commands instead.

---

## Golden Rules

1. **Never load all files at once** — respect the tier system to conserve context
2. **Never repeat past decisions** — check `.ai/decisions/` before choosing
3. **Never store secrets in code** — use environment variables
4. **Keep task files accurate and compact** — update after meaningful milestones only
5. **If LEARNED.md exceeds 50 active learned entries**, compress older entries into a compact digest using this format:

   ```
   ### Conventions (M/D)
   - convention description (date)

   ### Gotchas (M/D)
   - gotcha description (date)

   ### Patterns (M/D)
   - pattern description (date)
   ```

6. **If sessions.md exceeds 15 handoffs**, delete the oldest handoffs and keep only the latest 15. After appending a handoff, count only real handoff headings outside examples matching `## YYYY-MM-DD`; ignore `## Entry Format`.
7. **Prefer simple, correct code over clever code**
8. **Write tests alongside implementation**
