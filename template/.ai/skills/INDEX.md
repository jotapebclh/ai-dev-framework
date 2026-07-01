# Skills Deck

Optional playbooks for specialized tasks. Do not load a skill for routine work when `AI_CONTEXT.md` and `.ai/rules/` are enough.

| Skill | Description | Triggers |
|-------|-------------|----------|
| [dev](dev.md) | General development — implement features, fix bugs | implement, create, build, develop, implementar, criar, corrigir |
| [code-review](code-review.md) | Pull request and code quality review | review, code review, PR, audit, revisar, revisão, auditoria |
| [unit-test](unit-test.md) | Write and review unit tests | test, spec, coverage, jest, vitest, teste, cobertura |
| [security](security.md) | Security audit, threat modeling, vulnerabilities | security, audit, CVE, OWASP, segurança, auditoria |
| [project-manager](project-manager.md) | Planning, requirements, task tracking | plan, roadmap, sprint, milestone, planejar, planejamento, roteiro |
| [architect](architect.md) | System design, trade-off analysis, ADRs | architecture, design, decision, arquitetura, desenho, decisão |
| [debug](debug.md) | Root cause analysis and bug fixing | debug, bug, crash, broken, investigate, depurar, investigar, erro |
| [refactor](refactor.md) | Code improvement without behavior change | refactor, tech debt, simplify, refatorar, dívida técnica, simplificar |
| [docs](docs.md) | Documentation writing and maintenance | docs, readme, swagger, jsdoc, documentação, documentar |
| [devops](devops.md) | CI/CD, deployment, infrastructure | deploy, docker, kubernetes, terraform, implantação, infraestrutura |
| [database](database.md) | Schema design, migrations, query optimization | database, schema, migration, SQL, banco, migração, consulta |
| [performance](performance.md) | Profiling, optimization, benchmarking | performance, slow, latency, optimize, desempenho, lento, otimizar |

---

## How Skills Work

1. **Explicit invocation preferred** — Say "use the X skill" or "run a security review".
2. **Conservative auto-load** — Load one skill only for specialized, high-risk, failed, or project-customized workflows.
3. **Avoid stacking** — Load two skills only when explicitly requested or clearly necessary.

`dev.md` is a fallback for projects that customize it. Do not load it for ordinary feature or bugfix work by default.

## Creating New Skills

See the [template](_template.md) and [FRAMEWORK_GUIDE.md](../FRAMEWORK_GUIDE.md) for instructions.
