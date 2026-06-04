# Project Workflow Contract: Project Management & Tasking

## Identity
- Sequence ID: 5
- Artifact Folder: plan5/
- Source Plan: plan5/plan.md
- Status: ready_for_developer_tasking

## Precise User Flow
1. **Goal Analysis:** Planning agent analyzes user goal and complexity.
2. **Drafting:** Agent creates `plan.md` and `workflow.md`.
3. **PM Synthesis:** Agent reads the drafts and generates `task.md`.
4. **Handoff:** Agent presents the complete triad to the user for approval.

## Scenario Matrix
| Scenario | Success Path | Failure Path |
|---|---|---|
| Large Task | Splits into plans; generates triad for Plan 1. | Proposes single giant plan; blocked by RULES.md. |
| Implementation | Developer follows task.md exactly. | Developer deviates; blocked by ALIGN tool. |
