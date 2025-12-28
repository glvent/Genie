# Process Queue: {{PROCESS_NAME}}

## Summary

| Metric | Value |
|--------|-------|
| Total Threads | {{THREAD_COUNT}} |
| Total Instructions | {{INSTRUCTION_COUNT}} |
| Completed | {{COMPLETED_COUNT}} |
| In Progress | {{IN_PROGRESS_COUNT}} |
| Pending | {{PENDING_COUNT}} |
| Test Debt | {{TEST_DEBT_COUNT}} |

---

## Threads

### [ ] Thread: {{THREAD_1_NAME}}

{{THREAD_1_DESCRIPTION}}

- [ ] Instruction: {{INSTRUCTION_1}} [S/M/L/?]
- [ ] Instruction: {{INSTRUCTION_2}} [S/M/L/?]
- [ ] Instruction: {{INSTRUCTION_3}} [S/M/L/?]

---
Thread Estimate: {{THREAD_1_ESTIMATE}}

---

### [ ] Thread: {{THREAD_2_NAME}}

{{THREAD_2_DESCRIPTION}}

- [ ] Instruction: {{INSTRUCTION_4}} [S/M/L/?]
- [ ] Instruction: {{INSTRUCTION_5}} [S/M/L/?]

---
Thread Estimate: {{THREAD_2_ESTIMATE}}

---

## Notes

- Instructions marked with `⚠️` were completed without tests
- Use `[!]`, `[?]`, or `[~]` prefix for interrupts based on priority
- Commit SHAs are appended to completed instructions: `[x] Instruction: Name \`abc1234\``
