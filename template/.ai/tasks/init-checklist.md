# Project Init Checklist

When the user asks to create a new project from scratch, follow this checklist **step by step**. At each step, present the options to the user, explain trade-offs, and recommend the best choice based on context.

Do NOT skip steps or assume defaults without asking.

---

## How to Use This Checklist

1. Read this entire file first so you know the full scope
2. Go through each phase sequentially
3. At each decision point:
   - Present 2-3 realistic options
   - Explain trade-offs concisely
   - Give a clear recommendation
   - Wait for the user's choice before proceeding
4. Update `.ai/tasks/current.md` only at meaningful phase boundaries
5. Record decisions in `.ai/decisions/` when architecture choices are made
6. When done, fill in `.ai/config.json` with the chosen stack

---

## Phase 1: Project Foundation

### Step 1.1 — Define the Project

Ask the user:
- What does the project do? (1-2 sentence description)
- Who is the target audience?
- What is the MVP scope?

Record the answers — they will go into `.ai/config.json`.

### Step 1.2 — Choose Language & Runtime

| Option | Best For | Trade-offs |
|--------|----------|------------|
| TypeScript + Node.js | Full-stack web, APIs, libraries | Large ecosystem, good DX, type safety |
| Python | Data, ML, backends, automation | Rich libs, slower runtime |
| Go | High-performance APIs, CLIs | Fast, simple, verbose for CRUD |
| Rust | Systems, performance-critical | Steep learning curve, best perf |
| Java/Kotlin | Enterprise, large teams | Verbose, mature ecosystem |
| C# (.NET) | Enterprise, Windows ecosystem | Excellent tooling, cross-platform |

Recommend other languages if requested, but follow the same structure, with "Best for" and "Trade-offs".
Recommend based on: team expertise, project domain, performance needs.

### Step 1.3 — Choose Framework

Based on the language chosen:

| Language | Options |
|----------|---------|
| TypeScript | Next.js (fullstack), Express/Fastify (API), React/Vue/Svelte (frontend), tRPC (type-safe API) |
| Python | FastAPI (API), Django (fullstack), Flask (minimal), Streamlit (data apps) |
| Go | Gin, Chi, Echo (API), standard library |
| Rust | Axum, Actix (API), Tauri (desktop) |
| Java | Spring Boot, Quarkus |
| C# | ASP.NET Core, Blazor |

Recommend other frameworks if requested, based on language, but follow the same structure.
Ask about: deployment target (serverless, container, VPS), team size, ecosystem needs.

### Step 1.4 — Choose Database

| Type | Options | When |
|------|---------|------|
| Relational | PostgreSQL (default), MySQL, SQLite | Structured data, joins, ACID |
| Document | MongoDB, Firestore | Flexible schema, rapid iteration |
| Key-Value | Redis | Caching, sessions, pub/sub |
| Queue | RabbitMQ, Redis Streams, SQS | Async processing, background jobs |

**Recommendation**: PostgreSQL is the best default for most projects.

### Step 1.5 — Choose Package Manager

| Language | Options |
|----------|---------|
| TypeScript | npm, yarn, pnpm (recommended: pnpm — faster, disk-efficient) |
| Python | pip + venv, poetry (recommended: poetry — dependency resolution) |
| Go | go mod (built-in) |
| Rust | cargo (built-in) |

Recommend other Package Managers if requested, based on language, but follow the same structure.

---

## Phase 2: Development Tooling

### Step 2.0 — Define Coding Standards

Before selecting tools or writing code, check whether the operator already has coding standards.

Ask the user:
- Do you already have naming, formatting, testing, or error-handling conventions?
- Should we follow the default conventions of the selected language/framework?
- Which formatter, linter, and commit convention should be used?

If the user has no preference, recommend the idiomatic defaults for the selected stack and keep the decision minimal. Record the answer in `.ai/config.json` under `standards` or in `.ai/rules/STANDARDS.md` under Project Overrides.

### Step 2.1 — Linter & Formatter

| Language | Linter | Formatter |
|----------|--------|-----------|
| TypeScript | ESLint + typescript-eslint | Prettier |
| Python | Ruff (fast), pylint | Ruff |
| Go | golangci-lint | gofmt (built-in) |
| Rust | clippy | rustfmt (built-in) |

Recommend other Linter & Formatter if requested, based on language, but follow the same structure.
Recommend the default for the language. Configure with standard presets.

### Step 2.2 — Test Framework

| Language | Options |
|----------|---------|
| TypeScript | Vitest (modern), Jest (mature), Playwright (E2E) |
| Python | pytest (standard) |
| Go | testing (built-in) + testify |
| Rust | built-in test harness |

Recommend other Test Framework if requested, based on language, but follow the same structure.
Recommend the most popular option for the language.

### Step 2.3 — Git Initialize

```bash
git init
```

Create a `.gitignore` for the language (include `.ai/tasks/sessions.md` if preferred).

---

## Phase 3: Project Structure

### Step 3.1 — Create Folder Structure

Based on the chosen architecture pattern:

**Feature-based (recommended for most):**
```
src/
├── <feature>/
│   ├── <feature>.service.ts
│   ├── <feature>.controller.ts
│   └── <feature>.spec.ts
└── shared/
    ├── types.ts
    └── utils.ts
```

**Layer-based (recommended for complex domains):**
```
src/
├── domain/
├── application/
├── infrastructure/
└── presentation/
```

### Step 3.2 — Initialize the AI Framework

Copy the template contents into the project root, including hidden files:

```bash
# From the framework root
cp -a template/. /path/to/new-project/
```

### Step 3.3 — Configure `.ai/config.json`

Fill in:
- `project.name` — from Step 1.1
- `project.description` — from Step 1.1
- `project.language` — from Step 1.2
- `project.framework` — from Step 1.3
- `architecture.pattern` — from Phase 3
- `architecture.database` — from Step 1.4
- `architecture.auth` — ask user: "What auth strategy?" (JWT, sessions, OAuth, NextAuth, etc.)
- `project.packageManager` — from Step 1.5
- `project.testFramework` — from Step 2.2
- `project.lintTool` — from Step 2.1

### Step 3.4 — Configure `.ai/ref/dependencies.md`

Add the main framework and database driver with versions.

### Step 3.5 — Configure `.ai/ref/env.md`

Add placeholder entries:
- `DATABASE_URL`
- `PORT`
- `NODE_ENV`
- Auth secrets (if applicable)

---

## Phase 4: First Build

Before starting this phase, read `.ai/config.json` to get the chosen stack, runtime, and package manager. Use the selected toolchain in all commands below. If anything is empty, ask the user.

### Step 4.0 — Validate Required Tools

Check that the necessary runtimes and tools are installed on the system. Ask the user to install any that are missing.

```bash
# Examples to verify
node --version
npm --version  # or pnpm --version / yarn --version / python --version / go version
git --version
```

Do NOT proceed until all required tools are confirmed available.

### Step 4.1 — Install Dependencies

Use the official scaffold/install commands for the selected stack. Do not assume one package manager syntax works for every language.

If the stack is not covered by the examples below, ask the operator which command to use or consult the official documentation before running anything.

| Stack | Example commands |
|-------|------------------|
| Next.js + pnpm | `pnpm create next-app@latest .` |
| Node API + pnpm | `pnpm init` then `pnpm add <framework>` |
| FastAPI + Poetry | `poetry init` then `poetry add fastapi uvicorn` |
| Go API | `go mod init <module>` then `go get <framework>` |
| Rust CLI/API | `cargo init` then `cargo add <crate>` |

Before running commands, show the chosen commands to the user when there is uncertainty.

### Step 4.2 — Create Scaffold

Generate the minimal files needed to verify the project works:
- Main entry point (e.g., `src/index.ts` with a hello world health check)
- Basic config file (e.g., `tsconfig.json`, `vitest.config.ts`)
- `.env.example` with placeholder values

### Step 4.3 — Verify It Builds

Use the build or run command for the selected stack. Examples:

| Stack | Example command |
|-------|-----------------|
| Node/Next.js | `pnpm build` or `pnpm dev` |
| FastAPI | `poetry run uvicorn app.main:app --reload` |
| Go | `go build ./...` |
| Rust | `cargo build` |

Fix any issues.

### Step 4.4 — Verify Tests Run

Use the selected test framework. Examples:

| Stack | Example command |
|-------|-----------------|
| Node/TypeScript | `pnpm test` |
| Python | `poetry run pytest` |
| Go | `go test ./...` |
| Rust | `cargo test` |

Ensure at least one test passes (create a trivial test if none exists).

---

## Phase 5: Framework Warm-Up

### Step 5.1 — Record Architecture Decisions

Ask the user: "Do you want me to record the decisions we made?"

If yes, create ADRs in `.ai/decisions/`:
- `ADR-001: Language and framework choice`
- `ADR-002: Database choice`
- `ADR-003: Project structure`

### Step 5.2 — Initialize Task Tracking

- Append the project init completion to `.ai/tasks/completed.md`
- Create initial backlog with user's feature ideas
- Write a short first handoff in `.ai/tasks/sessions.md`:

```
## YYYY-MM-DD — Project init

**Focus:** Create the project from scratch.

**Outcome:** Completed. See `.ai/tasks/completed.md` entry for project init.

**Next:** Plan first feature implementation.

**Blockers:** None.

**State:** branch `main`; ADRs created for stack, database, and structure if requested.
```

### Step 5.3 — Present Summary

Show the user a summary of what was created:

```markdown
## Project Ready

- **Stack:** <language> + <framework> + <database>
- **Structure:** <chosen structure>
- **Tools:** <linter>, <formatter>, <test framework>
- **CI/CD:** Not configured yet
- **Deploy:** Not configured yet

### Next Steps
1. Review .ai/config.json and adjust if needed
2. Check .ai/ref/env.md for required environment variables
3. Start developing: "I want to implement <first feature>"
```
