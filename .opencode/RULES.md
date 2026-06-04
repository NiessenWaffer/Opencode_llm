# OpenCode Master Rulebook (RULES.md)

<APPROVAL>
- **GLOBAL_GATE:** Suggestions requiring implementation must write to `~/.config/opencode/approve.md`.
- **CONSENT:** Developer agents are forbidden from reading `SNAPSHOT` data unless a matching `[APPROVED]` hash exists in the global `approve.md`.
- **OUT_OF_BAND:** This file must remain outside the project root to prevent accidental AI-auto-approval.
</APPROVAL>

<STORAGE>
- **INITIALIZATION:** On first run, agent MUST ask user for `List plan/` location.
- **PERSISTENCE:** Store the confirmed path in `~/.config/opencode/opencode.json` as `project_plan_path`.
- **ACCESSIBILITY:** All artifacts MUST be in `.md` format for human readability.
</STORAGE>

<COMPLEXITY>
- **THRESHOLD:** Max 3 Vertical Slices OR 2 Data Entities per plan.
- **DECOMPOSITION:** If threshold is exceeded, create a sequential plan set (e.g., plan1: Foundation, plan2: Logic).
- **ESCALATION:** If a Developer/Debugger agent fails a task twice OR detects a high-risk architectural conflict, it MUST run `SNAPSHOT(blocker_summary)` and request the user switch to `/planning` mode.
- **CEILING:** If a code change exceeds 100 lines, the agent MUST pause and ask: "Is this too complex for a single Fix? Should we move to /planning?".
- **SEQUENCING:** Plan N+1 MUST reference `Depends On: Plan N`. Implementation of N+1 cannot start until N is `[CHECKED]`.
- **RATIONALE:** Every artifact MUST include a `## Rationale` section for human review.
</COMPLEXITY>

<ROUTING>
- **BOUNDARY:** Agents MUST NOT traverse outside the `project_root` defined in initialization.
- **RESTRICTED:** Access to `.git/`, `node_modules/`, and `.env` is strictly READ-ONLY and requires `[SAFETY_OVERRIDE]`.
- **SENSITIVE:** Any file matching `config/*` or `secrets/*` triggers a mandatory `CONSULT` before reading full content.
</ROUTING>

<DISCOVERY>
- **ZOOM_FIRST:** Agents MUST use `MAP()` to see the forest before `read_file()` to see the tree.
- **SEMANTIC_MAP:** For complex tasks, build a `RELATIONSHIP_MATRIX` showing how File A imports File B.
- **VECTOR_SEARCH:** For 1000+ files, use a local vector index to find "conceptually related" logic even if they don't share imports.
- **RELEVANCE_FILTER:** Only read files that score >70% on a "Core Task Relevance" check.
- **CONTEXT_TTL:** Automatically purge files from short-term memory if not referenced in 3 turns.
</DISCOVERY>

<ARTIFACTS>
- **Pillar 1: plan.md (The Blueprint)**
  - MUST contain: User Value Prop, SADS Contracts, Prerequisite Mapping.
- **Pillar 2: workflow.md (The User Journey)**
  - MUST contain: Precise User Flow, Scenario Matrix (Success/Fail/Edge).
- **Pillar 3: task.md (The Execution Roadmap)**
  - MUST contain: Source Tracing, Atomic Steps, Functional Gates (Static/Unit/Integration).
- **ATOMICITY:** Planning agent SHOULD generate all three files as a single logical unit.
</ARTIFACTS>

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
