# OpenCode Master Rulebook (RULES.md)

<SAFETY>
- **FORBIDDEN:** .env, .git/, /etc/, system_configs.
- **ANTI_TRUNCATE:** `FIX` fails if size delta < -20% or non-comment logic is removed.
- **BACKUP:** `FIX` creates `.opencode/backups/` before write.
- **PROBE:** READ_ONLY by default. Write requires `[WRITE_ACCESS_EXPLICIT]`.
</SAFETY>

<IMPLEMENTATION>
- **SEQ:** UI_Shell -> Routing -> Backend -> DB -> Seeders.
- **SADS:** Every feature must define (S)ection, (A)ction, (D)ata, (S)tate.
- **LADDER:** `static_read` -> `type_check` -> `unit_test` -> `integration`.
- **PROTECT:** Once `[CHECKED]`, file is LOCKED. Rework requires ESCALATION.
- **ALIGN:** Tool `ALIGN(task, plan)` must pass before execution.
</IMPLEMENTATION>

<DEBUGGING>
- **REPRO_FIRST:** No `FIX` without failing reproduction script.
- **HYPOTHESIS:** Generate 3-5 theories; rank by Signal/Cost; test cheapest first.
- **CLEANUP:** Mandatory tool `CLEANUP()` removes all `/* DEBUG */` tags post-fix.
- **POSTMORTEM:** Add lesson to `AGENTS.md#LEXICON` or `RULES.md#MATURITY`.
</DEBUGGING>

<LEXICON>
- Established Terminology: `User`, `Fix`, `Plan`, `Task`, `Check`, `Snapshot`.
- No synonym drift allowed.
</LEXICON>
