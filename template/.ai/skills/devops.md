# Skill: DevOps

- **Name:** DevOps
- **Description:** Infrastructure, CI/CD pipelines, deployment, and environment management
- **Triggers:** deploy, CI, CD, pipeline, docker, kubernetes, infra, terraform, cloud, devops, implantação, implantacao, infraestrutura, nuvem
- **Load with rules:** WORKFLOW.md, ref/env.md

---

## Focus Areas

- CI/CD pipeline configuration and optimization
- Docker containerization and orchestration
- Docker reload/restart behavior for local development
- Infrastructure as Code (Terraform, Pulumi, CloudFormation)
- Deployment strategies (blue-green, canary, rolling)
- Environment parity (dev, staging, production)
- Monitoring, alerting, and observability
- Cost optimization

## Process

1. Understand the deployment target (cloud provider, on-prem, serverless)
2. Review current CI/CD configuration
3. Check `.ai/config.json` for `devEnvironment.containerization` and `devEnvironment.reloadStrategy`
4. Check environment variable configuration in `.ai/ref/env.md`
5. Ensure secrets are managed properly (not in config files)
6. Verify infrastructure changes are idempotent
7. Test deployment in lower environments first
8. Document the deployment process

## Output Format

### For Pipeline Changes

```
## Pipeline: <name>
## Change: <description>

## Stages
1. lint — <command>
2. test — <command>
3. build — <command>
4. deploy — <command>

## Environment Variables Required
- `VAR_NAME` — description (source: AWS Secrets Manager)
```

### For Infrastructure

```
## Resource: <type>
## Provider: <AWS / GCP / Azure / K8s>

## Configuration
- key: value

## Dependencies
- resource A → resource B
```

## Checklist

- [ ] Idempotent — running twice produces the same result
- [ ] Secrets managed via vault, not hardcoded
- [ ] Docker reload/restart behavior matches `.ai/config.json` when containers are used
- [ ] Rollback plan exists
- [ ] Health checks configured
- [ ] Logs and metrics configured
- [ ] Cost impact estimated
- [ ] Staging mirrors production configuration

## References

- `.ai/rules/WORKFLOW.md`
- `.ai/ref/env.md`
