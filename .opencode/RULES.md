# OpenCode Master Rulebook (RULES.md)

<APPROVAL>
- **GLOBAL_GATE:** Suggestion/Planning -> write `~/.config/opencode/approve.md`.
- **CONSENT:** Dev/Debug BLOCKED unless `[APPROVED]` hash exists in global gate.
</APPROVAL>

<STORAGE>
- **INIT:** Prompt user for `List plan/` path on first run.
- **PERSIST:** Save confirmed path in `~/.config/opencode/opencode.json`.
- **FORMAT:** All artifacts MUST be `.md` (Human-Readable).
</STORAGE>

<COMPLEXITY>
- **SPLIT:** Threshold = 3 Vertical Slices OR 2 Data Entities.
- **SEQ:** N+1 depends on N. Implementation blocked until N is `[CHECKED]`.
- **ESCALATE:** 2x Task Failure OR High-Risk Conflict -> `SNAPSHOT` -> `/planning`.
- **CEILING:** logic > 100 lines -> mandatory `/planning` move.
</COMPLEXITY>

<ROUTING>
- **ROOT:** Boundary = `project_root`. No traversal outside.
- **FORBIDDEN:** .env, .git/, /etc/, system_configs.
- **SENSITIVE:** `config/*`, `secrets/*` -> triggers mandatory `CONSULT`.
</ROUTING>

<DISCOVERY>
- **ZOOM:** `MAP()` (Forest) -> `FIND_RELATED()` (Logic Chain) -> `SIG()` (Signatures) -> `read_file()` (Tree).
- **PRUNE:** `CONTEXT_TTL` = 3 turns (Auto-purge unused files).
- **VECTOR:** Use local index for conceptually related discovery in 1000+ files.
</DISCOVERY>

<ARTIFACTS>
- **TRIAD:** Planning MUST generate `plan.md`, `workflow.md`, and `task.md`.
- **plan.md:** Identity, Value Prop, SADS Contracts.
- **workflow.md:** User Flow, Scenario Matrix (Success/Fail/Edge).
- **task.md:** Source Tracing, Atomic Steps, Functional Gates.
</ARTIFACTS>

<MODES>
- **PLANNING:** Authorized for **Blueprint Creation**. Forbidden from `FIX` (Source Code).
- **DEVELOPER/DEBUGGER:** Authorized for **Implementation**. Full `FIX`/`WRITE` permissions.
- **SUGGESTION/STUDY:** Strictly **Read-Only**. Forbidden from `FIX` and Implementation.
</MODES>

<SAFETY>
- **ANTI_TRUNCATE:** `FIX` fails if size delta < -20% or non-comment logic is removed.
- **BACKUP:** `FIX` creates `.opencode/backups/` before write.
- **PROBE:** READ_ONLY by default.
</SAFETY>

<IMPLEMENTATION>
- **SEQ:** UI_Shell -> Routing -> Backend -> DB -> Seeders.
- **SADS:** Define (S)ection, (A)ction, (D)ata, (S)tate per component.
- **LADDER:** `static_read` -> `type_check` -> `unit_test` -> `integration`.
- **PROTECT:** `[CHECKED]` files are LOCKED. Rework requires ESCALATION.
</IMPLEMENTATION>

<DEBUGGING>
- **REPRO:** Failing script REQUIRED before `FIX`.
- **HYPOTHESIS:** Generate 3-5 theories; rank by Signal/Cost; test cheapest first.
- **CLEANUP:** Mandatory `CLEANUP()` removes all `DEBUG` tags post-fix.
</DEBUGGING>

<LEXICON>
- Established: `User`, `Fix`, `Plan`, `Task`, `Check`, `Snapshot`.
- NO synonym drift allowed.
</LEXICON>
