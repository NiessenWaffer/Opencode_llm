# Task Manifest: Project Management & Task Generation

## Identity
- Sequence ID: 5
- Artifact Folder: plan5/
- Status: pending
- Depends On: plan3 (T3.2)

## Source Tracing

| Task ID | Source Plan Section | Source Workflow Step |
|---|---|---|
| T5.1 | plan5/plan.md § "Rationale" (lines 9-10) | plan5/workflow.md § "Precise User Flow" (lines 9-13) |
| T5.2 | plan5/plan.md § "Rationale" (line 10) | plan5/workflow.md § "Precise User Flow" (line 12) |
| T5.3 | plan5/plan.md § "Success Criteria" (line 13) | plan5/workflow.md § "Precise User Flow" (lines 10-13) |
| T5.4 | plan5/plan.md § "Success Criteria" (line 14) | plan5/workflow.md § "Precise User Flow" (lines 11-13) |
| T5.5 | plan5/plan.md § "Success Criteria" (line 15) | — |
| T5.6 | plan5/plan.md § "Success Criteria" (line 15) | plan5/workflow.md § "Scenario Matrix" (lines 15-19) |

## Atomic Steps

### T5.1: Planning Agent as Project Manager [P0]
- Extend planning agent instructions to act as Project Manager
- On receiving a user goal, first analyze complexity via RULES.md `<COMPLEXITY>`
- Determine if a single plan or multi-plan sequence is required
- Generate `plan.md` with Identity, Value Prop, and SADS Contracts per RULES.md `<ARTIFACTS>`
- Generate `workflow.md` with User Flow and Scenario Matrix (Success/Fail/Edge)

### T5.2: Task Manifest Generation [P0]
- After drafting plan.md and workflow.md, read both to synthesize `task.md`
- task.md must include:
  - **Source Tracing table**: Every task links to source_plan_section and source_workflow_step
  - **Atomic Steps**: Single-purpose, actionable items with priority tags (P0/P1/P2)
  - **Functional Gates**: Verification criteria mapped to specific tasks
- Present the complete triad to user for approval
- Block implementation until user approves

### T5.3: Plan-to-Task Alignment Gate [P1]
- Every task in task.md must have a non-empty `Source Plan Section` reference
- If a task cannot be traced back to plan.md, trigger MATURITY to identify missing blueprint
- ALIGN tool checks that developer implementation matches the approved task.md
- Deviation from task.md triggers ESCALATION_EVENT to planning mode

### T5.4: Scenario Matrix Requirement [P1]
- Every workflow.md must include a Scenario Matrix table
- Columns: Scenario | Success Path | Failure Path
- At minimum: "Large Task" and "Implementation" scenarios
- Failure path must specify what blocks the action (e.g., "blocked by RULES.md")

### T5.5: RULES.md Codification [P1]
- Add `<ARTIFACTS>` section to RULES.md (if not already present)
- Mandate: "Planning MUST generate plan.md, workflow.md, and task.md"
- Define format for each artifact
- This serves as the contractual backbone for all future planning

### T5.6: Triad Handoff Verification [P0]
- Verify Planning agent generates all three files (plan.md, workflow.md, task.md)
- Verify task.md has Source Tracing, Atomic Steps, and Functional Gates
- Verify scenario matrix includes both success and failure paths
- Verify user approval is required before implementation begins

## Functional Gates

| Gate ID | Condition | Tasks Verified |
|---|---|---|
| G5.1 | Planning agent generates complete triad (plan.md, workflow.md, task.md) | T5.1, T5.2, T5.6 |
| G5.2 | task.md has Source Tracing table linking every task to plan section | T5.2, T5.3 |
| G5.3 | task.md has Atomic Steps with P0/P1/P2 priority | T5.2 |
| G5.4 | task.md has Functional Gates with verification criteria | T5.2 |
| G5.5 | workflow.md includes Scenario Matrix with Success/Fail paths | T5.4, T5.6 |
| G5.6 | RULES.md `<ARTIFACTS>` mandates the triad | T5.5 |
| G5.7 | User approval gate blocks implementation until triad is approved | T5.2, T5.6 |
