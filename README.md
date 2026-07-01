# AI Development Framework

A drop-in framework that optimizes any project for AI-assisted development. Works with opencode, Claude Code, Cursor, Windsurf, Copilot, and any AI coding tool that reads context files.

## Why?

AI coding tools are powerful, but they lack project context. Without explicit guidance, they:

- Waste tokens loading irrelevant files
- Suggest libraries you don't use
- Violate project conventions
- Miss security requirements
- Forget decisions between sessions

This framework solves all of that.

## How It Works

Run `install.sh` or copy `template/` into your project, configure a few fields, and every AI session starts with perfect context.

### Token-Optimized Loading

The framework uses a **three-tier loading strategy**:

| Tier | Contents | When |
|------|----------|------|
| Tier 1 | Project config + current task | Every session (~2K tokens) |
| Tier 2 | Task-specific rules (security, architecture, etc.) | Based on task type |
| Tier 3 | History, learned patterns, decisions | On demand |

The AI detects what kind of task you're asking for and loads **only the relevant rules**.

### Grows With Your Project

Unlike static rule files, this framework becomes smarter over time:

| Mechanism | What Happens |
|-----------|-------------|
| `LEARNED.md` | AI records reusable conventions, gotchas, provider quirks, and testing patterns |
| `decisions/` | AI records durable technical decisions with lasting trade-offs |
| `sessions.md` | AI keeps short handoffs only when continuity matters |
| `completed.md` | AI records the canonical list of finished tasks |
| `tasks/` | AI tracks active, pending, and completed work without duplicating logs |

## Structure

```
project/
├── AI_CONTEXT.md                 # Entry point — instructs the AI
│
└── .ai/
    ├── FRAMEWORK_GUIDE.md        # Framework usage guide
    ├── config.json               # [EDIT] Project metadata
    ├── config.schema.json        # Minimal schema for config validation
    ├── META.json                 # Framework version & token budgets
    │
    ├── rules/
    │   ├── SECURITY.md           # Universal security guidelines
    │   ├── ARCHITECTURE.md       # Architecture patterns
    │   ├── STANDARDS.md          # Coding standards & design patterns
    │   ├── WORKFLOW.md           # Git flow & CI/CD
    │   └── LEARNED.md            # Grows with the project
    │
    ├── tasks/
    │   ├── current.md            # Active work only; reset to Idle when done
    │   ├── backlog.md            # What will be done
    │   ├── completed.md          # Canonical list of finished tasks
    │   └── sessions.md           # Short continuity handoffs
    │
    ├── decisions/                # Architecture Decision Records
    │   ├── INDEX.md
    │   └── 000-template.md
    │
    ├── skills/                   # Optional task-specific playbooks
    │
    └── ref/                      # Project references
        ├── dependencies.md       # [EDIT] Key dependencies
        └── env.md                # [EDIT] Environment variables
```

## Quick Start

### Recommended: Installer

```bash
# 1. Create a new project directory
mkdir projeto-x
cd projeto-x

# 2. Install the AI framework into this project
/path/to/ai-dev-framework/install.sh .

# 3. Start your AI tool and say:
#   "Read AI_CONTEXT.md. Quero criar este projeto do zero."
```

The installer refuses to overwrite existing framework files by default.

```bash
/path/to/ai-dev-framework/install.sh . --dry-run  # preview changes
/path/to/ai-dev-framework/install.sh . --force    # overwrite existing files
```

### Manual Install

```bash
# 1. Copy the template to your project, including hidden files
cp -a template/. /path/to/your/project/

# 2. Edit the configuration
# Edit .ai/config.json with your project details
# Edit .ai/ref/dependencies.md and .ai/ref/env.md

# 3. Start your AI tool and say:
#   "Read AI_CONTEXT.md"
```

## Compatibility

| Tool | File |
|------|------|
| opencode | `AI_CONTEXT.md` (auto-discovered as `AGENTS.md` alias) |
| Claude Code | `AI_CONTEXT.md` (rename to `CLAUDE.md` or use fallback) |
| Cursor | Reference in `.cursorrules` |
| Windsurf | Reference in `.windsurfrules` |
| Copilot | Reference in `.github/copilot-instructions.md` |
| Any AI tool | Point it to `AI_CONTEXT.md` |

## License

MIT
