# Getting Started — AI Development Framework

This framework optimizes your project for AI-assisted development. Copy it to any project to give AI agents the context they need to work effectively.

---

## Installation

### Recommended: Installer

From an empty or existing project directory:

```bash
/path/to/ai-dev-framework/install.sh .
```

For a new project:

```bash
mkdir projeto-x
/path/to/ai-dev-framework/install.sh projeto-x
cd projeto-x
```

Useful options:

```bash
/path/to/ai-dev-framework/install.sh . --dry-run
/path/to/ai-dev-framework/install.sh . --force
```

The installer refuses to overwrite existing framework files unless `--force` is used.

### Manual Install

1. Copy the `template/` directory contents to the root of your project, including hidden files:

   ```bash
   cp -a path/to/template/. /path/to/your/project/
   ```

2. **Configure** the files below (marked with `[EDIT]`).

---

## What You Must Configure

These files describe your project to the AI. Fill them out before starting.

### 1. `.ai/config.json` — Project Identity
Edit the fields:
- `project.name`, `project.description`
- `project.language`, `project.runtime`, `project.framework`
- `project.packageManager`, `project.testFramework`, `project.lintTool`
- `architecture.pattern`, `architecture.database`, `architecture.auth`
- `standards.*` if you already have coding, formatting, or testing conventions

### 2. `.ai/ref/dependencies.md` — Key Dependencies
List the main libraries your project uses, with versions.

### 3. `.ai/ref/env.md` — Environment Variables
Document every environment variable: name, description, default value.

### 4. `.ai/.aiignore` — AI Noise Filter
Add file patterns the AI should ignore (e.g., `*.lock`, `dist/`, `build/`).

---

## What You May Customize

These files contain universal defaults. Review and adapt them to your project.

| File | Purpose |
|------|---------|
| `.ai/rules/SECURITY.md` | Security guidelines |
| `.ai/rules/ARCHITECTURE.md` | Architecture patterns |
| `.ai/rules/STANDARDS.md` | Coding standards and design patterns |
| `.ai/rules/WORKFLOW.md` | Git flow and CI/CD rules |
| `.ai/skills/` | Optional task-specific playbooks |

---

## How to Use

1. Open your project with any AI coding tool (opencode, Claude Code, Cursor, etc.)

2. Tell the AI:

   > Read AI_CONTEXT.md and tell me what you need to work on this project.

3. The AI will read the project config and ask clarifying questions

4. Work as you normally would — the AI updates task files only when the state meaningfully changes

### Collaborating With The AI

The framework asks the AI to collaborate actively without turning every task into a planning meeting.

| Moment | Expected Behavior |
|--------|-------------------|
| Before work | Ask 1-3 focused questions when ambiguity changes architecture, API, schema, security, UX, dependencies, tests, scope, or priority. |
| During work | Send short updates only for meaningful milestones, risks, trade-offs, or blockers. |
| After work | Include `Prompt Feedback` only when there is a useful way to improve future prompts. |

You can ask for more or less guidance directly:

```text
Assume the project's existing patterns and proceed unless blocked.
```

```text
Before implementing, ask me about any trade-offs you see.
```

```text
At the end, include prompt feedback so I can improve future requests.
```

### Using Skills

Skills are optional playbooks for specialized work. Most routine coding should use `AI_CONTEXT.md` plus the relevant `.ai/rules/` files without loading a skill.

**Best default** — invoke a skill explicitly when you want its checklist:
- *"Use the security skill to audit the auth module"*
- *"Run a code review on this PR"*
- *"I need to plan the next sprint, use the project manager skill"*

**Conservative auto-load** — the AI may load one skill when the task is high-risk, specialized, previously failed, or the skill has project-specific instructions.

**Stacking skills** — avoid this by default. Use two skills only when you explicitly ask or the task clearly has two distinct specialized workflows, such as `security` plus `database` for a sensitive migration.

---

## Creating Custom Skills

You can create project-specific skills for any recurring task.

### Quick Start

1. Copy the template:
   ```bash
   cp .ai/skills/_template.md .ai/skills/my-skill.md
   ```

2. Fill in the fields at the top:
   - **Name**: Short identifier (e.g., "Payment Testing")
   - **Description**: One sentence explaining when to use it
   - **Triggers**: Comma-separated words that suggest this skill may be useful
   - **Load with rules**: Which `.ai/rules/` files to load alongside

3. Write the instructions in each section:
   - **Focus Areas** — What aspects this skill evaluates
   - **Process** — Step-by-step workflow the AI must follow
   - **Output Format** — How the AI should structure its response
   - **Checklist** — Verification items before finishing

4. The AI can load it when you request it explicitly or when the task meets the conservative auto-load criteria in `AI_CONTEXT.md`.

### Best Practices

- **One skill, one job** — Don't create a "mega-skill" that does everything
- **Keep it concise** — Prefer a short checklist over a long process document
- **Be prescriptive** — Tell the AI exactly what to do and how to format output
- **Use checklists** — They're the most effective way to ensure quality
- **Reference rules** — Link to `.ai/rules/` files so the AI loads the right context
- **Evolve** — Update skills as your project matures and patterns emerge

### Example: Custom Skill for a Specific Framework

```markdown
# Skill: Stripe Integration

- **Name:** Stripe Integration
- **Description:** Implement and test Stripe payment features
- **Triggers:** stripe, payment, checkout, subscription, billing
- **Load with rules:** SECURITY.md, STANDARDS.md, ref/dependencies.md

---

## Focus Areas
- Payment flow correctness
- Webhook handling and idempotency
- Error recovery and refunds
- PCI compliance

## Process
1. ...
```

### Sharing Skills Across Projects

Skills are just Markdown files — copy them between projects, commit to Git, or create a shared skills library.

---

## How the Framework Grows

The framework becomes smarter over time:

| File | Growth Mechanism |
|------|-----------------|
| `.ai/rules/LEARNED.md` | AI appends project-specific patterns as they are discovered |
| `.ai/decisions/` | AI records architecture decisions to avoid repetition |
| `.ai/tasks/sessions.md` | AI writes short handoffs only when continuity matters |
| `.ai/tasks/current.md` | AI keeps active task state only; completed work is cleared from it |
| `.ai/tasks/completed.md` | AI records finished tasks as the canonical completion ledger |
| `.ai/skills/` | You add optional playbooks when recurring specialized workflows appear |

---

## Quick Reference

| Command | What to Say to the AI |
|---------|----------------------|
| Start working | `Read AI_CONTEXT.md` |
| Plan a feature | `Plan the implementation of X. Check the rules first.` |
| Report progress | `Update current.md. If this is done, move it to completed.md and reset current.md.` |
| Fix a bug | `Fix X. Load security rules and check for vulnerabilities.` |
| Review decisions | `What decisions have been made about X?` |
| Get prompt feedback | `At the end, tell me how I could improve this prompt.` |
| Use a skill | `Use the <skill> skill to do X.` |
| Create a skill | `Create a new skill for X. Use the template.` |
