# Genie Project

This project uses **Genie** - a process-driven AI development framework using Cursor Rules.

## Quick Reference

### Commands
- `genie init` - Initialize Genie
- `genie status` - View current state
- `genie exec` - Execute next instruction
- `genie spawn` - Create new process
- `genie fork` - Create new thread
- `genie interrupt` - Add urgent bug/fix
- `genie yield` - Pause and save state
- `genie help` - Show all commands

### Terminology
- **Kernel** - Master process queue (`.genie/genie-kernel.md`)
- **Process** - Major milestone/epic
- **Thread** - Feature/component within process
- **Instruction** - Atomic unit of work
- **Interrupt** - Urgent bug that jumps the queue

## Project Context

When working on this project, always read these files for context:
- `.genie/genie-core.md` - Product definition
- `.genie/genie-conventions.md` - Style guidelines
- `.genie/genie-stack.md` - Technology stack
- `.genie/genie-workflow.md` - Development workflow

## Current Work

Check `.genie/genie-kernel.md` for active processes and `.genie/genie-session.json` for current instruction state.

## Rules

1. Always follow the workflow defined in `.genie/genie-workflow.md`
2. Mark instructions as in-progress `[~]` before starting work
3. Mark instructions as complete `[x]` when done
4. Handle interrupts `[!]` before regular instructions
5. Use descriptive commit messages following project conventions
