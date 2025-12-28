# Genie Workflow

## Guiding Principles

1. **The Kernel is the Source of Truth:** All work is tracked in `genie-kernel.md`
2. **Processes Before Code:** Define specs before implementation
3. **Instructions are Atomic:** Each instruction should be completable in one session
4. **Interrupts Take Priority:** Bugs marked with `[!]` are handled first
5. **State is Always Saved:** Use `genie yield` before closing Cursor

## Instruction Lifecycle

### Standard Workflow

1. **Select Instruction**
   - Run `genie exec` to get the next instruction
   - Interrupts `[!]` and `[?]` are prioritized over regular `[ ]` instructions

2. **Mark In Progress**
   - Instruction status changes from `[ ]` to `[~]`
   - Session state is updated with current context

3. **Implement**
   - Write the code to complete the instruction
   - Follow conventions in `genie-conventions.md`
   - Use patterns from `genie-stack.md`

4. **Test (Recommended)**
   - Write tests if the instruction involves:
     - Business logic or calculations
     - Data modification
     - User input handling
     - External API calls
   - Mark with `⚠️` if skipping tests

5. **Commit**
   - Stage changes: `git add .`
   - Commit with descriptive message
   - Format: `<type>(<scope>): <description>`

6. **Mark Complete**
   - Instruction status changes from `[~]` to `[x]`
   - Commit SHA is appended to the instruction

## Effort Estimates

Use these sizes when planning instructions:

| Size | Symbol | Duration | Example |
|------|--------|----------|---------|
| Small | `[S]` | < 30 min | Add a button, fix typo |
| Medium | `[M]` | 30 min - 2 hr | Implement form validation |
| Large | `[L]` | 2+ hours | Build authentication flow |
| Unknown | `[?]` | Needs breakdown | Complex feature |

Instructions marked `[?]` should be broken down before execution.

## Test Debt Tracking

- Instructions completed without tests are marked with `⚠️`
- Test debt is summarized at the end of each thread
- Use `genie exec` on completed threads to address test debt

## Commit Guidelines

### Message Format
```
<type>(<scope>): <description>

[optional body]
```

### Types
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation
- `style`: Formatting
- `refactor`: Code restructuring
- `test`: Adding tests
- `chore`: Maintenance

### Examples
```bash
git commit -m "feat(auth): Add login form validation"
git commit -m "fix(ui): Correct button alignment on mobile"
git commit -m "test(auth): Add unit tests for password validation"
```

## Interrupt Handling

### Priority Levels

| Symbol | Level | Behavior |
|--------|-------|----------|
| `[!]` | Critical | Stop everything, fix immediately |
| `[?]` | Normal | Handle before next instruction |
| `[~]` | Deferred | Add to end of thread queue |

### Adding Interrupts
1. Run `genie interrupt "<description>"`
2. Select priority level
3. Interrupt is inserted into the appropriate position
4. Run `genie exec` to handle it

## Quality Checklist

Before marking an instruction complete:

- [ ] Code follows project conventions
- [ ] No linting errors
- [ ] Changes are tested (or marked with ⚠️)
- [ ] Documentation updated if needed
- [ ] Committed with proper message

## Session Management

### Pausing Work
1. Run `genie yield`
2. Add optional context notes
3. State is saved to `genie-session.json`

### Resuming Work
1. Open Cursor
2. Run `genie exec`
3. Genie offers to resume from saved state

### Handling Abandoned Work
If Cursor closes unexpectedly:
- State is preserved in `genie-session.json`
- Next `genie exec` detects abandoned instruction
- Options: Resume, Complete, Reset, or Rollback

## Auto-Archive Settings

```
auto_archive_days: 7
```

Processes completed more than 7 days ago will be suggested for archiving.
