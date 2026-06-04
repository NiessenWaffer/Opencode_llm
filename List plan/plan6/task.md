# Task Manifest: Deep Architectural Clean-Up

## Identity
- Sequence ID: 6
- Artifact Folder: plan6/
- Status: pending
- Depends On: plan5 (T5.1, T5.2, T5.5)

## Source Tracing

| Task ID | Source Plan Section | Source Workflow Step |
|---|---|---|
| T6.1 | plan6/plan.md § "Rationale" (lines 9-10) | plan6/workflow.md § "Precise User Flow" (line 10) |
| T6.2 | plan6/plan.md § "Success Criteria" (line 13) | plan6/workflow.md § "Precise User Flow" (line 10) |
| T6.3 | plan6/plan.md § "Success Criteria" (line 14) | plan6/workflow.md § "Precise User Flow" (lines 10-11) |
| T6.4 | plan6/plan.md § "Success Criteria" (line 15) | plan6/workflow.md § "Precise User Flow" (line 11) |
| T6.5 | — | plan6/workflow.md § "Precise User Flow" (line 12) |
| T6.6 | — | plan6/workflow.md § "Precise User Flow" (line 13) |

## Atomic Steps

### T6.1: Single Source of Truth Consolidation [P0]
- Audit all existing rule files across the project
- Identify any instruction content that exists outside RULES.md
- Port any orphaned rules into the appropriate RULES.md section
- Remove all duplicate instruction files
- Verify RULES.md covers all agent behavioral requirements
- Delete any legacy instruction files after migration

### T6.2: Agent Shell Minimization [P0]
- Audit all 5 agent shell files in `.opencode/agent/`
- Strip any remaining verbose instructions beyond the RULES.md pointer
- Each shell must contain only: YAML frontmatter + Identity (1 line) + Rules (FOLLOW ONE FILE + section reference + LEXICON)
- Verify each agent shell is under 10 lines of content
- Remove all redundant comments and whitespace

### T6.3: Ownership & Moderation Notes [P1]
- Create `README.md` in project root with:
  - Installation guide (single command: `curl | sh` or `iex`)
  - Quick start: "Run `opencode init` to begin"
  - Architecture diagram (ASCII or bullet list of agents and their relationship to RULES.md)
  - No emoji, no filler prose, no marketing language

### T6.4: Debris Removal [P1]
- Remove any deprecated plan folders (e.g., plan4/ if it exists and was skipped)
- Remove any dangling `.md` files in root that are not referenced by index.md or RULES.md
- Ensure all artifacts (plan.md, workflow.md, task.md) exist for every active plan
- Clean up any test/temp files left over from verification

### T6.5: Final Verification — Clean-State Audit [P0]
- Verify RULES.md is the single source of truth (no other instruction files exist)
- Verify all 5 agent shells are under 10 lines
- Verify README.md exists with install guide
- Verify opencode.json correctly routes all 5 commands
- Verify List plan/index.md references all active plans (1, 2, 3, 5, 6)
- Verify every active plan has the complete triad (plan.md, workflow.md, task.md)

### T6.6: Git Commit — Clean State [P1]
- Stage all changes
- Commit with message: "chore: deep architectural clean-up — consolidated RULES.md, minimized agent shells, added README"
- Push to remote repository
- Verify CI passes if applicable

## Functional Gates

| Gate ID | Condition | Tasks Verified |
|---|---|---|
| G6.1 | No instruction content exists outside RULES.md | T6.1 |
| G6.2 | All 5 agent shells are under 10 lines | T6.2, T6.5 |
| G6.3 | README.md exists with installation guide and quick start | T6.3, T6.5 |
| G6.4 | Deprecated plan folders and dangling files are removed | T6.4, T6.5 |
| G6.5 | All active plans (1, 2, 3, 5, 6) have complete triad | T6.5 |
| G6.6 | Git commit pushed; clean state verified | T6.5, T6.6 |
