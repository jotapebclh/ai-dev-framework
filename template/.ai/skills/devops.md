# Skill: DevOps

- **Name:** DevOps
- **Description:** Infrastructure, CI/CD pipelines, deployment, and environment management
- **Triggers:** deploy, CI, CD, pipeline, docker, kubernetes, infra, terraform, cloud, devops, implantação, implantacao, infraestrutura, nuvem
- **Load with rules:** WORKFLOW.md, ref/env.md

---

## Focus Areas

- CI/CD pipeline configuration and optimization
- Docker containerization and orchestration
- Infrastructure as Code (Terraform, Pulumi, CloudFormation)
- Deployment strategies (blue-green, canary, rolling)
- Environment parity (dev, staging, production)
- Monitoring, alerting, and observability
- Cost optimization

## Process

1. Understand the deployment target (cloud provider, on-prem, serverless)
2. Review current CI/CD configuration
3. Check environment variable configuration in `.ai/ref/env.md`
4. Ensure secrets are managed properly (not in config files)
5. Verify infrastructure changes are idempotent
6. Test deployment in lower environments first
7. Document the deployment process

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
- [ ] Rollback plan exists
- [ ] Health checks configured
- [ ] Logs and metrics configured
- [ ] Cost impact estimated
- [ ] Staging mirrors production configuration

## References

- `.ai/rules/WORKFLOW.md`
- `.ai/ref/env.md`
