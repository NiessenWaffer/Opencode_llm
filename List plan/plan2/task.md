# Task Manifest: Unified Safety & Implementation Standards

## Identity
- Sequence ID: 2
- Artifact Folder: plan2/
- Status: pending
- Depends On: plan1 (T1.2, T1.3)

## Source Tracing

| Task ID | Source Plan Section | Source Workflow Step |
|---|---|---|
| T2.1 | plan2/plan.md § "Master Rulebook Structure" (lines 29-34) | plan2/workflow.md § "Implementation Sequence" (line 17) |
| T2.2 | plan2/plan.md § "Strategy" (line 26) | plan2/workflow.md § "Implementation Sequence" (line 18) |
| T2.3 | plan2/plan.md § "Strategy" (line 27) | plan2/workflow.md § "Implementation Sequence" (line 19) |
| T2.4 | plan2/plan.md § "Strategy" (line 28) | plan2/workflow.md § "Implementation Sequence" (line 20) |
| T2.5 | plan2/plan.md § "Strategy" (lines 24-28) | plan2/workflow.md § "Backend Contract" (lines 23-24) |
| T2.6 | — | plan2/workflow.md § "Verification Flow" (lines 27-29) |

## Atomic Steps

### T2.1: Rule Consolidation — Create RULES.md [P0]
- Create `.opencode/RULES.md` as single source of truth
- Port all safety rules (forbidden paths, anti-truncation, backups) into `<SAFETY>` section
- Port all implementation rules (vertical-slicing, SADS, verification ladder) into `<IMPLEMENTATION>` section
- Port all debugging rules (repro-first, hypothesis ranking, cleanup) into `<DEBUGGING>` section
- Add `<LEXICON>` section with canonical terms
- Add `<APPROVAL>` section with global gate and consent checks
- Add `<STORAGE>` section with persistence rules for List plan/ path
- Add `<COMPLEXITY>` section with split threshold and escalation rules
- Add `<ROUTING>` section with boundary and forbidden path rules
- Add `<DISCOVERY>` section with progressive zoom strategy
- Add `<ARTIFACTS>` section with triad requirements (plan, workflow, task)
- Add `<MODES>` section with permission boundaries per agent type

### T2.2: Semantic Compression [P1]
- Rewrite each rule using industrial-grade shorthand DSL (MAP, SIG, FIX vocabulary)
- Use XML tags (`<SAFETY>`, `<IMPLEMENTATION>`, `<DEBUGGING>`) for structured parsing
- Keep each rule to 1-3 lines maximum
- Remove all filler phrases and explanatory prose
- Apply Semantic Efficiency Protocol: enums for lists, shorthand for tools

### T2.3: Agent Refactoring — Minimal Shells [P0]
- Strip long system prompts from `developer.md`
- Replace with: "FOLLOW ONE FILE: RULES.md" pointer
- Add mode-specific section references: developer → `<IMPLEMENTATION>`
- Repeat for `debugger.md` (→ `<DEBUGGING>`)
- Repeat for `planning.md` (→ `<PLANNING>`)
- Repeat for `suggestion.md` (→ `<MODES>` Read-Only)
- Repeat for `study.md` (→ `<MODES>` Read-Only)
- Verify each agent shell is under 20 lines of text

### T2.4: Safety Hard-Coding [P0]
- Embed `<SAFETY>` rules as the preamble of RULES.md
- Ensure safety rules are non-negotiable and globally enforced
- Verify anti-truncation guard: FIX must fail if size delta < -20%
- Verify backup auto-creation before every FIX
- Verify forbidden paths are skipped during MAP/SIG

### T2.5: RULES_LOADER Tool [P1]
- Create `~/.config/opencode/tools/RULES_LOADER.ts`
- Accept section name as parameter (e.g., `<SAFETY>`)
- Read `.opencode/RULES.md` and parse XML tags
- Inject relevant section content into calling agent's context
- Cache parsed sections for performance

### T2.6: Verification Tests [P0]
- **Test Case 1: Conciseness Check** — Verify `developer.md` is under 20 lines
- **Test Case 2: Safety Override** — Attempt command violating `<SAFETY>`; verify blocked
- **Test Case 3: Mode Consistency** — Verify both Dev/Debug agents use same Lexicon and SADS contracts

## Functional Gates

| Gate ID | Condition | Tasks Verified |
|---|---|---|
| G2.1 | RULES.md exists with all 12 sections (SAFETY, IMPLEMENTATION, DEBUGGING, LEXICON, APPROVAL, STORAGE, COMPLEXITY, ROUTING, DISCOVERY, ARTIFACTS, MODES) | T2.1 |
| G2.2 | Each RULES.md section is under 5 lines, using shorthand DSL | T2.2 |
| G2.3 | All 5 agent files are under 20 lines each, pointing to RULES.md | T2.3, T2.6 |
| G2.4 | RULES_LOADER accepts a section tag and returns parsed content | T2.5 |
| G2.5 | Safety override test: command blocked by RULES.md | T2.6 |
| G2.6 | Lexicon consistency: both Dev and Debug agents use identical term set | T2.6 |
