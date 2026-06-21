# Skill: Documentation

- **Name:** Documentation
- **Description:** Write, review, and maintain project documentation
- **Triggers:** docs, documentation, readme, wiki, guide, swagger, jsdoc, docstring, documentação, documentacao, documentar, guia
- **Load with rules:** STANDARDS.md

---

## Focus Areas

- API documentation (endpoints, parameters, responses)
- README and project overview
- Code comments and docstrings
- Architecture documentation
- Setup and deployment guides
- Changelogs

## Process

1. Identify the audience (developer, user, operator)
2. Choose the right location (README, API docs, code comments, wiki)
3. Write clear, concise content
4. Include examples for complex concepts
5. Verify accuracy — test the instructions if documenting setup
6. Keep it up to date with the current codebase state

## Output Format

### For API Endpoints

```markdown
### POST /api/v1/users

Create a new user.

**Request Body:**
```json
{
  "name": "string (required)",
  "email": "string (required)",
  "role": "string (optional, default: user)"
}
```

**Response:**
- `201 Created` — User created successfully
- `409 Conflict` — Email already exists
- `422 Unprocessable` — Validation error
```
```

### For Code Documentation

```typescript
/**
 * Calculates the discounted price for a product.
 *
 * @param basePrice - The original price (must be > 0)
 * @param discountPercent - Discount percentage (0-100)
 * @returns The final price after discount
 * @throws {Error} If discountPercent is outside 0-100
 */
```

## Checklist

- [ ] Audience identified and content tailored
- [ ] Examples provided for non-trivial concepts
- [ ] Documentation is accurate (tested or verified against code)
- [ ] No outdated information
- [ ] Consistent formatting and style

## References

- `.ai/rules/STANDARDS.md` (Comment Conventions)
