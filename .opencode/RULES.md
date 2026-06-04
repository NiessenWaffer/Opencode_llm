# OpenCode Master Rulebook (RULES.md)

<APPROVAL>
- **GLOBAL_GATE:** Suggestions requiring implementation must write to `~/.config/opencode/approve.md`.
- **CONSENT:** Developer agents are forbidden from reading `SNAPSHOT` data unless a matching `[APPROVED]` hash exists in the global `approve.md`.
- **OUT_OF_BAND:** This file must remain outside the project root to prevent accidental AI-auto-approval.
</APPROVAL>

<PLANNING>
- **ROLE:** Senior Planning Architect. Owns `plan.md`, `workflow.md`, and `index.md`.
- **DISCOVERY:** Parse user goal -> Classify request -> Identify source of truth.
- **BLUEPRINT:** Generate Vertical-Slice sequences and SADS contracts.
- **GATE:** Plan must be `[APPROVED]` in global gate before Handoff to Implementation.
</PLANNING>

<MODES>
- **PLANNING:** Authorized for **Blueprint Creation**. Owns `List plan/`. Can use `WRITE_PLAN`. Forbidden from `FIX` (Source Code).
- **DEVELOPER/DEBUGGER:** Authorized for **Implementation**. Full `FIX`, `WRITE`, and `RESTORE` permissions.
- **SUGGESTION/STUDY:** Strictly **Read-Only**. Forbidden from `FIX` and `Implementation`. 
- **HANDOFF:** Suggestion/Study must hand off all implementation or documentation writes to Developer agents via `SNAPSHOT`.
</MODES>

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
