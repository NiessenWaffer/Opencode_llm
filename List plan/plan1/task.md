# Task Manifest: AI Mode Core & Reading Strategy

## Identity
- Sequence ID: 1
- Artifact Folder: plan1/
- Status: pending

## Source Tracing

| Task ID | Source Plan Section | Source Workflow Step |
|---|---|---|
| T1.1 | plan.md § "Semantic Efficiency Protocol" (lines 187-198) | workflow.md § "Global Tooling" (lines 21-26) |
| T1.2 | plan.md § "Research Notes" (lines 199-209) | workflow.md § "Global Tooling" (lines 24-25) |
| T1.3 | plan.md § "Research Notes" (lines 200-204) | workflow.md § "Precise User Flow" (lines 9-18) |
| T1.4 | plan.md § "Research Notes" (lines 205-209) | workflow.md § "Precise User Flow" (lines 10-12) |
| T1.5 | plan.md § "Phase 6" (lines 37-51) | workflow.md § "Backend Contract" (lines 29-36) |
| T1.6 | plan.md § "Phase 6" (lines 42-43) | workflow.md § "Backend Contract" (line 31) |
| T1.7 | plan.md § "Phase 6" (lines 38-41) | workflow.md § "Backend Contract" (line 32) |
| T1.8 | plan.md § "Phase 6" (lines 44-46) | workflow.md § "Backend Contract" (line 33) |
| T1.9 | plan.md § "Phase 6" (lines 47-51) | workflow.md § "Backend Contract" (line 34) |
| T1.10 | plan.md § "Architectural Sinkhole Remediation" (lines 159-175) | — |
| T1.11 | plan.md § "Phase 4" (lines 72-84) | — |
| T1.12 | plan.md § "Phase 3" (lines 86-102) | — |
| T1.13 | plan.md § "Phase 2" (lines 146-157) | — |
| T1.14 | plan.md § "Ironclad Safety Layer" (lines 133-144) | — |
| T1.15 | plan.md § "Phase 5" (lines 53-71), "Phase 2" (lines 146-149) | workflow.md § "Verification Flow" (lines 45-58) |

## Atomic Steps

### T1.1: Knowledge Broker Tools Suite [P0]
- Create `~/.config/opencode/tools/MAP.ts` — Structural directory scanner
- Create `~/.config/opencode/tools/SIG.ts` — AST-based signature extractor
- Create `~/.config/opencode/tools/FIX.ts` — Surgical code updater with Match-Block anchoring
- Create `~/.config/opencode/tools/STUDY.ts` — Symbol explainer
- Setup `~/.config/opencode/package.json` with AST parsing dependencies (typescript, tree-sitter)

### T1.2: Agent Definition Files [P0]
- Create `.opencode/agent/developer.md` — Implementation mode shell
- Create `.opencode/agent/debugger.md` — Error triage mode shell
- Create `.opencode/agent/study.md` — Read-only educational mode shell
- Create `.opencode/agent/suggestion.md` — Read-only optimization mode shell
- Create `.opencode/agent/planning.md` — Architecture & project management shell

### T1.3: Mode Router Configuration [P0]
- Configure `opencode.json` with command mappings for all 5 modes
- Wire each command to its corresponding agent shell

### T1.4: Progressive File Reading Strategy [P0]
- Implement Tier 1: `MAP(root)` structural awareness
- Implement Tier 2: Semantic anchoring via AGENTS.md and entry points
- Implement Tier 3: `SIG(file)` symbol mapping for Global Symbol Table
- Implement Tier 4: Full file deep read for surgical tasks

### T1.5: Debug Tool Suite [P1]
- Create `~/.config/opencode/tools/REPRO.ts` — Reproduction harness builder
- Create `~/.config/opencode/tools/HYPOTHESIZE.ts` — Root-cause hypothesis ranker
- Create `~/.config/opencode/tools/PROBE.ts` — Auto-tracking probe with DEBUG_START/END tags
- Create `~/.config/opencode/tools/CLEANUP.ts` — Surgical removal of DEBUG tags
- Create `~/.config/opencode/tools/POSTMORTEM.ts` — MATURITY rule suggestion engine

### T1.6: REPRO Tool [P1]
- Generate minimal failing reproduction script from user-reported bug
- Script must fail BEFORE fix and pass AFTER fix
- Integrated with CLEANUP for post-fix noise removal

### T1.7: HYPOTHESIZE Tool [P1]
- Accept symptom description as input
- Generate 3-5 root-cause theories ranked by Signal vs. Cost
- Execute cheapest hypothesis first

### T1.8: PROBE Tool [P1]
- Create temporary read-only inspection scripts
- Wrap all temporary logs in `/* DEBUG_START */` and `/* DEBUG_END */` markers
- READ_ONLY by default; WRITE requires explicit YAML frontmatter grant

### T1.9: CLEANUP & POSTMORTEM [P1]
- CLEANUP: Remove all DEBUG-tagged statements post-fix
- POSTMORTEM: Analyze the fix and generate MATURITY rule suggestion
- Save post-mortem to `.opencode/debug/debug.md`
- Append to AGENTS.md: "How could we have prevented this?"

### T1.10: Architectural Safety Patches [P1]
- FIX: Match-Block anchoring (find exact old_string, fail on shift)
- AGENTS.md: Refactor to Master Index with `.opencode/memory/*.md` segments
- VERIFY: Cynical persona / adversarial failure hypothesis
- Hierarchical tool loading: `.opencode/tools/` before `~/.config/opencode/tools/`
- plan.md: Immutable State Lock; deviation requires ESCALATION_EVENT

### T1.11: Predictive Intelligence Tools [P2]
- ANTICIPATE: Pre-fetch SIG of 2nd-degree dependencies
- Context Snapshot: `.opencode/snapshots/latest.json` for zero-loss handoff
- Cross-Agent Verification: Second-opinion for P0 tasks
- DEBT.md: Auto-log temporary logic for future refactoring

### T1.12: Meta-Intelligence Tools [P2]
- SENTINEL: Monitor AGENTS.md for goal drift
- MATURITY: Pre-execution dependency gap analysis
- Scenario Matrix: Success/Failure/Alternate paths in workflow.md
- SADS Contract: (S)ection, (A)ction, (D)ata, (S)tate verification

### T1.13: Execution Intelligence Tools [P2]
- CONSULT: Present strategic forks to user with trade-offs
- Self-Healing Loop: Auto-trigger STUDY refresh on test failure
- Test-Driven Execution: Write failing test before FIX

### T1.14: Safety Layer [P0]
- Anti-Truncation Guard: FIX blocks if size delta < -20%
- Atomic Checkpointing: `.opencode/backups/` before every FIX
- Sensitive Path Protection: Skip .env, .git/, /etc/ in MAP/SIG
- Data Integrity: PROBE is READ_ONLY; blacklist DELETE/TRUNCATE/DROP

### T1.15: Verification Tests [P0]
- Test Case 1: Recursive Verification — flawed plan is caught by VERIFY
- Test Case 2: Architectural Anchoring — rule violation is flagged
- Test Case 3: Tree-of-Thought — multiple strategies for one request
- Test Case 4: Test-Driven Execution — failing test before fix
- Test Case 5: Strategic Consultation — complex change triggers CONSULT
- Test Case 6: Self-Healing — unexpected env change triggers PROBE
- Test Case 7: Dependency Maturity — missing config is flagged
- Test Case 8: Strategic Sentinel — plan deviation triggers CONSULT
- Test Case 9: SADS Integrity — UI component has no orphan action

## Functional Gates

| Gate ID | Condition | Tasks Verified |
|---|---|---|
| G1.1 | All 4 Knowledge Broker tools (MAP, SIG, FIX, STUDY) respond to invocation | T1.1 |
| G1.2 | All 5 agent definition files exist in `.opencode/agent/` with valid YAML frontmatter | T1.2 |
| G1.3 | `opencode.json` routes all 5 commands to correct agents | T1.3 |
| G1.4 | MAP() produces valid structural output for a test directory | T1.4 |
| G1.5 | FIX() blocks write when old_string not found (Match-Block safety) | T1.10 |
| G1.6 | REPRO generates failing script; CLEANUP removes all DEBUG tags post-fix | T1.5, T1.6, T1.9 |
| G1.7 | HYPOTHESIZE returns ranked hypothesis list from symptoms | T1.7 |
| G1.8 | PROBE scripts are READ_ONLY by default | T1.8, T1.14 |
| G1.9 | All 9 verification tests pass | T1.15 |
| G1.10 | Backup file created in `.opencode/backups/` on FIX invocation | T1.14 |
