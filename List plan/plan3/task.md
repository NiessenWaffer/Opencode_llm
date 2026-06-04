# Task Manifest: Complexity Management & Artifact Scoping

## Identity
- Sequence ID: 3
- Artifact Folder: plan3/
- Status: pending
- Depends On: plan2 (T2.1, T2.5)

## Source Tracing

| Task ID | Source Plan Section | Source Workflow Step |
|---|---|---|
| T3.1 | plan3/plan.md § "Rationale" (lines 9-10) | plan3/workflow.md § "Precise User Flow" (lines 9-15) |
| T3.2 | plan3/plan.md § "Success Criteria" (line 13) | plan3/workflow.md § "Precise User Flow" (lines 10-11) |
| T3.3 | plan3/plan.md § "Success Criteria" (line 14) | plan3/workflow.md § "Precise User Flow" (lines 12-13) |
| T3.4 | plan3/plan.md § "Success Criteria" (line 15) | plan3/workflow.md § "Precise User Flow" (lines 14-15) |
| T3.5 | — | plan3/workflow.md § "Precise User Flow" (lines 10-11) |

## Atomic Steps

### T3.1: INIT Flow Implementation [P0]
- On `opencode init`, prompt user: "Where should List plan/ exist?"
- Accept path input from user
- Validate that the path is writable and within project boundary
- Store confirmed path in `~/.config/opencode/opencode.json`
- Create the List plan/ directory if it does not exist

### T3.2: Plan Splitting Logic [P0]
- Define complexity thresholds in RULES.md `<COMPLEXITY>` section:
  - Threshold = 3 Vertical Slices OR 2 Data Entities
  - Sequence: N+1 depends on N; implementation blocked until N is `[CHECKED]`
- When user requests a large feature, detect if it exceeds threshold
- Automatically propose a sequence of plans (plan1, plan2, plan3, ...)
- Present sequence to user for approval before proceeding
- Enforce ceiling: logic > 100 lines triggers mandatory `/planning` move

### T3.3: Storage Persistence [P1]
- Persist the List plan/ path to `~/.config/opencode/opencode.json`
- Read back the path on subsequent runs
- Fall back to prompting if path is missing or invalid

### T3.4: Human-Readable Plan Format [P1]
- Ensure all plan artifacts use Markdown format
- Include mandatory `## Rationale` section in each plan
- Keep plans scoped and digestible for human review
- Use `##` headings for major sections only

### T3.5: INIT Configuration Test [P0]
- Run `opencode init` flow end-to-end
- Verify path prompt appears
- Verify path is saved to config
- Verify directory is created at confirmed path
- Verify subsequent runs read saved path without re-prompting

## Functional Gates

| Gate ID | Condition | Tasks Verified |
|---|---|---|
| G3.1 | On `opencode init`, user is prompted for List plan/ path | T3.1, T3.5 |
| G3.2 | Path is persisted and retrieved on subsequent runs | T3.3, T3.5 |
| G3.3 | Complex features (>3 slices or >2 entities) auto-split into sequential plans | T3.2 |
| G3.4 | Plans include `## Rationale` section for human readability | T3.4 |
| G3.5 | Logic ceiling (>100 lines) triggers planning mode escalation | T3.2 |
