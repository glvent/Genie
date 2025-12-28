# General Design Patterns & Principles

Core patterns and principles that guide development across all languages and frameworks.

---

## SOLID Principles

### Single Responsibility
Each module, class, or function should have one reason to change. If you can't describe what it does without using "and," split it.

### Open/Closed
Open for extension, closed for modification. Add new behavior through new code, not by changing existing code.

### Liskov Substitution
Subtypes must be substitutable for their base types. If it quacks like a duck but needs batteries, your abstraction is wrong.

### Interface Segregation
Many specific interfaces beat one general-purpose interface. Clients shouldn't depend on methods they don't use.

### Dependency Inversion
Depend on abstractions, not concretions. High-level modules shouldn't import from low-level modules—both should depend on interfaces.

---

## Code Quality

### Readability First
- Code is read 10x more than it's written—optimize for the reader
- Avoid clever tricks; prefer boring, obvious solutions
- If it needs a comment to explain *what* it does, rewrite it

### Naming Matters
- Names should reveal intent: `getUserById` not `getData`
- Be consistent: don't mix `fetch`, `get`, `retrieve` for the same concept
- Length should match scope: `i` for a loop, `userAccountBalance` for a module-level variable

### Functions
- Do one thing and do it well
- Keep them short (ideally < 20 lines)
- Limit parameters (3 or fewer; use objects for more)
- No side effects unless the name implies them (`saveUser` vs `getUser`)

### Error Handling
- Fail fast and fail loudly in development
- Fail gracefully and informatively in production
- Never swallow exceptions silently
- Use specific error types, not generic ones

---

## Architecture Patterns

### Separation of Concerns
Keep business logic, data access, and presentation in distinct layers. A change in the UI shouldn't require touching the database code.

### DRY (Don't Repeat Yourself)
Every piece of knowledge should have a single, unambiguous representation. But don't over-abstract—duplication is better than the wrong abstraction.

### YAGNI (You Aren't Gonna Need It)
Don't build features you *might* need. Build what you need *now*. Future you can handle future requirements.

### Composition Over Inheritance
Prefer combining simple objects over building deep inheritance hierarchies. Inheritance creates tight coupling; composition creates flexibility.

---

## Testing Philosophy

### Test Behavior, Not Implementation
Tests should verify *what* code does, not *how* it does it. Refactoring shouldn't break tests.

### The Testing Pyramid
- Many unit tests (fast, isolated, cheap)
- Some integration tests (verify components work together)
- Few E2E tests (slow, brittle, but verify the full system)

### When to Test
- Business logic: always
- Data transformations: always
- Edge cases: always
- Glue code and simple getters: rarely
- UI layout: screenshot tests or skip

---

## Performance

### Measure First
Never optimize without profiling. Your intuition about bottlenecks is usually wrong.

### The 80/20 Rule
80% of performance problems come from 20% of the code. Find and fix the hot paths.

### Trade-offs
- Premature optimization is the root of all evil
- But architecture decisions are hard to change—think about scale early
- Optimize for developer time first, CPU time second (unless you're at scale)

---

## Security Basics

### Never Trust Input
Validate and sanitize all external input—user data, API responses, file contents.

### Least Privilege
Give code and users only the permissions they need, nothing more.

### Secrets Management
- Never commit secrets to version control
- Use environment variables or secret managers
- Rotate credentials regularly

---

## Documentation

### Code as Documentation
Well-named functions and variables reduce the need for comments. The best documentation is code that doesn't need explaining.

### Comments Should Explain Why
```
// Bad: Increment counter by 1
counter++;

// Good: Reset retry count after successful connection
retryCount = 0;
```

### Keep Docs Close to Code
Documentation that lives far from code gets stale. Prefer inline comments and README files in relevant directories.
