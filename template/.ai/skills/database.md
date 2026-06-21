# Skill: Database

- **Name:** Database
- **Description:** Data modeling, schema design, query optimization, and migrations
- **Triggers:** database, schema, migration, query, model, table, index, SQL, NoSQL, ORM, banco, banco de dados, esquema, migração, migracao, consulta, tabela, índice, indice
- **Load with rules:** ARCHITECTURE.md, ref/dependencies.md, ref/env.md

---

## Focus Areas

- Schema design (normalization, relationships, constraints)
- Migration strategy (backward compatible, rollback)
- Query optimization (indexes, EXPLAIN, N+1 prevention)
- Data integrity (transactions, constraints, validation)
- Performance (connection pooling, caching, read replicas)

## Process

1. Understand the data requirements and access patterns
2. Design the schema with appropriate types, constraints, and indexes
3. Write migrations as small, reversible steps
4. Review queries for performance (EXPLAIN ANALYZE, index usage)
5. Check for N+1 queries and missing eager loading
6. Verify data integrity constraints (foreign keys, unique, check)
7. Document the schema and any non-obvious design decisions

## Output Format

### For Schema Changes

```sql
CREATE TABLE orders (
  id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id     UUID NOT NULL REFERENCES users(id),
  status      VARCHAR(20) NOT NULL DEFAULT 'pending',
  total       DECIMAL(10,2) NOT NULL,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_orders_user_status ON orders(user_id, status);
```

### For Migration Plans

```
## Migration: add_orders_table

### Up
- Create orders table
- Create index on (user_id, status)

### Down
- Drop index idx_orders_user_status
- Drop orders table

### Risk
- None (new table, no existing data affected)
```

## Checklist

- [ ] Schema is normalized to 3NF (or justified denormalization)
- [ ] Foreign keys enforce referential integrity
- [ ] Indexes support the query patterns (not over-indexed)
- [ ] Migration is backward compatible (no destructive changes)
- [ ] Rollback script exists
- [ ] N+1 queries prevented
- [ ] Connection pooling configured
- [ ] Sensitive data is encrypted at rest

## References

- `.ai/rules/ARCHITECTURE.md`
- `.ai/ref/dependencies.md` (database driver/ORM version)
- `.ai/ref/env.md` (DATABASE_URL)
