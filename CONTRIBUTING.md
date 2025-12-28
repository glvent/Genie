# Contributing to Genie

Thank you for your interest in contributing to Genie! This document provides guidelines and information for contributors.

## How to Contribute

### Reporting Issues

Before creating an issue, please:

1. Search existing issues to avoid duplicates
2. Use a clear, descriptive title
3. Include steps to reproduce the problem
4. Describe expected vs actual behavior
5. Include your Cursor version and OS

### Suggesting Features

Feature requests are welcome! Please:

1. Check if the feature has already been requested
2. Explain the problem you're trying to solve
3. Describe your proposed solution
4. Consider how it fits with Genie's philosophy

### Pull Requests

1. **Fork** the repository
2. **Create a branch** for your feature or fix:
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. **Make your changes** following the code style guidelines below
4. **Test** your changes thoroughly
5. **Commit** with clear, descriptive messages
6. **Push** to your fork and submit a pull request

## Code Style

### General Principles

- Follow existing patterns in the codebase
- Keep changes focused and minimal
- Write self-documenting code
- Add comments for complex logic

### MDC Rule Files

When modifying `.mdc` rule files:

- Keep instructions clear and actionable
- Use consistent formatting
- Test with Cursor's agent before submitting
- Document any new commands or flags

### Templates

When modifying template files:

- Ensure placeholders are clearly marked
- Keep templates minimal but complete
- Document any required customization

### Markdown

- Use consistent heading hierarchy
- Keep line lengths reasonable (< 120 chars)
- Use fenced code blocks with language hints
- Format tables with consistent alignment

## Commit Messages

Use clear, conventional commit messages:

```
type: short description

Longer description if needed.
```

Types:
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `refactor`: Code refactoring
- `test`: Adding or updating tests
- `chore`: Maintenance tasks

Examples:
```
feat: add genie move command for relocating instructions
fix: prevent circular dependencies in process blocking
docs: update README with new workflow examples
```

## Development Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/genie.git
   ```

2. Copy `.cursor/rules/` to a test project

3. Test commands in Cursor's agent chat

## Testing

Before submitting a PR:

1. Test all affected commands manually
2. Verify edge cases are handled
3. Check that existing functionality still works
4. Test with a fresh project initialization

## Questions?

If you have questions about contributing, feel free to open a discussion or reach out through issues.

---

Thank you for helping make Genie better! 🧞
