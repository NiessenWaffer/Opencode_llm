# Project Workflow Contract: AI Mode Core & Reading Strategy

## Identity
- Sequence ID: 1
- Artifact Folder: plan1/
- Source Plan: plan1/plan.md
- Status: ready_for_developer_tasking

## Precise User Flow
1. **User Action:** Starts OpenCode in a workspace.
2. **System Response:** Knowledge Broker runs `MAP(root)` and reads `AGENTS.md`.
3. **System Feedback:** Displays "Project Mapped: [N] files. Project Memory loaded from AGENTS.md."
4. **User Action:** Requests a change (e.g., "/developer Fix the login bug").
5. **System Response:** 
    - Mode Router activates the agent in `.opencode/agent/developer.md`.
    - Knowledge Broker runs `SIG(affected_files)` to locate relevant logic.
    - Knowledge Broker runs Tier 4 (Deep Read) on files identified.
6. **System Feedback:** Proposes a plan using the **Semantic Efficiency Protocol**.

## Frontend-First Sequence (Setup)
1. **Global Tooling:** 
    - Create `~/.config/opencode/tools/` and implement the `MAP.ts`, `SIG.ts`, `FIX.ts`, and `STUDY.ts` tools.
    - Setup `~/.config/opencode/package.json` with required dependencies for AST parsing (e.g., `typescript`, `tree-sitter`).
2. **Local Agent Setup:** 
    - In the project directory, create `.opencode/agent/` and add the Markdown files for each mode.
3. **Memory Initialization:** Run an initial `MAP(root)` to generate the base `AGENTS.md` for the project.

## Backend Contract (Knowledge Broker & DSL)
1. **Tool implementation:** 
    - `REPRO.ts`: A harness builder that creates minimal reproduction scripts.
    - `HYPOTHESIZE.ts`: A logic engine that ranks root-cause theories.
    - `PROBE.ts`: **Auto-Tracking Probe.** Wraps temporary logs in `/* DEBUG_START */` and `/* DEBUG_END */` tags for easy removal.
    - `CLEANUP.ts`: A tool that surgically removes all `DEBUG` tags.
    - `POSTMORTEM.ts`: An analyzer that suggests new `MATURITY` rules based on a fixed bug.
2. **Post-Fix Step:** 
    - Every successful `FIX` in Debugger mode must be followed by `CLEANUP` -> `POSTMORTEM`.

## Precise User Flow (Debugger)
1. **User Action:** Reports bug.
2. **System Response:** Runs `HYPOTHESIZE` and creates `debug.md`.
3. **System Action:** Runs `REPRO`. 
4. **Logic Loop:** `REPRO Fails` -> `PROBE` -> `REPRO Fails` -> `FIX` -> `REPRO Passes`.
5. **System Feedback:** "Root cause identified. Cleanup complete. New rule added to MATURITY: 'Always check for null in X'."

## Verification Flow
1. **Test Case 7:** Dependency Maturity -> Delete a core config file and verify that the AI's `MATURITY` tool flags the gap before attempting a feature.
2. **Test Case 8:** Strategic Sentinel -> Try to force the AI to implement a feature that contradicts the `plan.md`; verify the `SENTINEL` tool triggers a `CONSULT` block.
3. **Test Case 9:** SADS Integrity -> Verify that every UI element in a new feature has an Action, Data source, and State defined.

## Verification Flow
1. **Test Case 4:** Test-Driven Execution -> Provide a bug, verify the agent writes a failing test first, then fixes the bug, then verifies the test passes.
2. **Test Case 5:** Strategic Consultation -> Trigger a complex architectural change and verify the agent pauses to use the `CONSULT` tool.
3. **Test Case 6:** Self-Healing -> Introduce an unexpected environment variable change; verify the `PROBE` tool detects it and the agent adjusts the plan.

## Verification Flow
1. **Test Case 1:** Recursive Verification -> Purposefully provide a flawed plan and verify the agent's `VERIFY` tool identifies the error.
2. **Test Case 2:** Architectural Anchoring -> Create a change that violates a rule in `ARCH.md` and verify the `ANCHOR` tool flags it.
3. **Test Case 3:** Tree-of-Thought -> Verify the agent can produce and compare multiple implementation strategies for a single complex request.
