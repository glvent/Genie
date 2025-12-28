<div align="center">

# 🧞 Genie

**Process-Driven Development for Cursor**

[![License](https://img.shields.io/badge/license-Apache%202.0-blue.svg)](LICENSE)
[![Cursor](https://img.shields.io/badge/Cursor-Compatible-purple.svg)](https://cursor.sh)

*Plan before you build. Execute with precision.*

[Getting Started](#getting-started) · [Commands](#commands) · [Documentation](#project-structure) · [Contributing](#contributing)

</div>

---

## What is Genie?

Genie transforms [Cursor](https://cursor.sh) into a **proactive project manager** that follows a strict protocol to specify, plan, and implement software. Using CPU-inspired terminology, it organizes work into a hierarchical queue system that the AI agent executes instruction by instruction.

**The Problem:** AI coding assistants lose context between sessions, forget project conventions, and lack structured workflows for complex features.

**The Solution:** Genie treats project context as a managed artifact. Your repository becomes a single source of truth that drives every agent interaction with deep, persistent awareness.

## Key Features

| Feature | Description |
|---------|-------------|
| **Hierarchical Work Structure** | Organize work into Processes → Threads → Instructions |
| **Interrupt System** | Handle urgent bugs with priority-based queue jumping |
| **State Persistence** | Seamlessly resume work across Cursor sessions |
| **Smart Navigation** | Jump between processes with built-in safety guards |
| **Flexible Testing** | Context-aware test suggestions without rigid enforcement |
| **Archive System** | Keep your kernel clean by archiving completed work |
| **Dry Run Mode** | Preview any command before execution |

## Terminology

Genie uses CPU-inspired terminology to model development work:

| Term            | Symbol | Description                                       |
|-----------------|--------|---------------------------------------------------|
| **Kernel**      | 🟣     | The master process queue (`.genie/genie-kernel.md`) |
| **Process**     | 🔵     | A major milestone or epic                         |
| **Thread**      | 🟢     | A feature or component within a process           |
| **Instruction** | ⚪     | An atomic unit of work                            |
| **Interrupt**   | 🔴     | An urgent bug that preempts normal execution      |

---

## Getting Started

### Prerequisites

- [Cursor](https://cursor.sh) IDE installed
- A project repository

### Installation

1. Clone or download this repository
2. Copy the `.cursor/rules/` folder to your project root
3. Open your project in Cursor

### Initialize Your Project

```bash
genie init
```

Genie will guide you through setting up:
- **Product definition** — What you're building and why
- **Style conventions** — Coding standards and patterns
- **Tech stack** — Languages, frameworks, and tools
- **Workflow preferences** — Testing, commits, and processes

### Create Your First Process

```bash
genie spawn "User Authentication"
```

### Start Working

```bash
genie exec
```

Genie will select the next instruction, load relevant context, guide implementation, and track progress automatically.

---

## Commands

### Core

| Command       | Description                           |
|---------------|---------------------------------------|
| `genie init`  | Initialize a new Genie project        |
| `genie spawn` | Create a new process                  |
| `genie fork`  | Create a new thread within a process  |
| `genie exec`  | Execute the next instruction          |

### Control

| Command           | Description                              |
|-------------------|------------------------------------------|
| `genie interrupt` | Add an urgent bug/fix (jumps the queue)  |
| `genie yield`     | Pause and save current state             |
| `genie kill`      | Cancel a process, thread, or instruction |
| `genie rewind`    | Rollback changes                         |

### Navigation

| Command        | Description                          |
|----------------|--------------------------------------|
| `genie status` | Show current project status          |
| `genie jump`   | Switch to a different process/thread |
| `genie help`   | Show available commands              |

### Maintenance

| Command           | Description                 |
|-------------------|-----------------------------|
| `genie archive`   | Archive a completed process |
| `genie unarchive` | Restore an archived process |

### Flags

| Flag         | Description                     |
|--------------|---------------------------------|
| `--dry-run`  | Preview what a command would do |
| `--process`  | Specify target process          |
| `--priority` | Set priority (high/medium/low)  |

---

## Project Structure

After initialization, Genie creates a `.genie/` directory:

```
.genie/
├── genie-core.md           # Product definition
├── genie-conventions.md    # Style guidelines
├── genie-stack.md          # Technology choices
├── genie-workflow.md       # Development workflow
├── genie-kernel.md         # Master process queue
├── genie-kernel.md.backup  # Auto-backup
├── genie-session.json      # Current execution state
├── processes/
│   └── <process_id>/
│       ├── process-spec.md     # What and why
│       ├── process-queue.md    # Instructions to execute
│       └── process-meta.json   # Metadata and status
└── archive/                # Completed processes
```

---

## Workflow

### Daily Development

```bash
# Start your day — see where you left off
genie status

# Work through instructions
genie exec
# ... implement the code ...
# Genie tracks your progress automatically

# Handle an urgent bug
genie interrupt "Login broken on Safari"
genie exec  # The interrupt is now next in queue

# End your day — save state for tomorrow
genie yield
```

### Managing Multiple Workstreams

```bash
# Switch between processes
genie jump payments_20251229

# Clean up completed work
genie archive auth_20251227

# Preview destructive actions
genie kill dashboard --dry-run
```

---

## Interrupt Priority

When adding interrupts, choose a priority level:

| Priority | Symbol | Behavior                         |
|----------|--------|----------------------------------|
| Critical | `[!]`  | Stop everything, fix immediately |
| Normal   | `[?]`  | Handle before next instruction   |
| Deferred | `[~]`  | Add to end of thread queue       |

---

## Effort Sizing

Instructions include lightweight sizing for planning:

| Size  | Duration       | Example                   |
|-------|----------------|---------------------------|
| `[S]` | < 30 min       | Add a button, fix typo    |
| `[M]` | 30 min – 2 hr  | Implement form validation |
| `[L]` | 2+ hours       | Build authentication flow |
| `[?]` | Unknown        | Needs breakdown first     |

---

## Resilience

Genie handles common edge cases gracefully:

- **Abandoned Instructions** — Detects stale work and offers recovery options
- **Circular Dependencies** — Prevents and warns about dependency cycles
- **Corrupted Kernel** — Auto-backup with rebuild capabilities
- **Large Projects** — Auto-archive and lazy loading for performance

---

## Contributing

Contributions are welcome! Please read our [Contributing Guidelines](CONTRIBUTING.md) before submitting a pull request.

## License

This project is licensed under the [Apache License 2.0](LICENSE).

---

<div align="center">

**[⬆ Back to Top](#-genie)**

Made with 🧞 for the Cursor community

Inspired by [Gemini Conductor](https://github.com/liamzebedee/gemini-conductor) ❤️

</div>
