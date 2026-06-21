# Skill: Unit Test

- **Name:** Unit Test
- **Description:** Write, review, and improve unit tests following project testing conventions
- **Triggers:** test, unit test, spec, coverage, testing, jest, vitest, pytest, teste, teste unitário, cobertura, testar
- **Load with rules:** STANDARDS.md, ref/dependencies.md

---

## Focus Areas

- Test correctness and reliability
- Coverage of edge cases and error paths
- Test isolation (no shared state)
- Meaningful assertions (not just happy path)

## Process

1. Identify the code unit to test (function, component, module)
2. Review the implementation to understand behavior
3. Plan test cases: happy path, edge cases, error conditions, boundary values
4. Follow AAA pattern: Arrange, Act, Assert
5. Mock only at boundaries — prefer real dependencies when practical
6. Verify tests fail meaningfully when the code breaks

## Output Format

```typescript
describe('UserService', () => {
  describe('getById', () => {
    it('should return user when found', async () => {
      // Arrange
      const user = createTestUser({ id: '1', name: 'Alice' });
      repository.getById.mockResolvedValue(user);

      // Act
      const result = await service.getById('1');

      // Assert
      expect(result).toEqual(user);
    });

    it('should throw NotFoundError when user does not exist', async () => {
      // Arrange
      repository.getById.mockResolvedValue(null);

      // Act & Assert
      await expect(service.getById('999')).rejects.toThrow(NotFoundError);
    });
  });
});
```

## Checklist

- [ ] Tests follow AAA pattern
- [ ] Test names clearly describe scenario and expected outcome
- [ ] Edge cases covered (null, empty, invalid input)
- [ ] Error paths covered
- [ ] No test interdependence
- [ ] Mocks are at the boundary, not implementation detail
- [ ] Tests are deterministic (no flakiness)

## References

- `.ai/rules/STANDARDS.md` (Testing Conventions section)
- `.ai/ref/dependencies.md` (test framework version)
