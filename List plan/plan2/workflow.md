# Project Workflow Contract: Unified Rules & Safety

## Identity
- Sequence ID: 2
- Artifact Folder: plan2/
- Source Plan: plan2/plan.md
- Status: ready_for_developer_tasking

## Precise User Flow
1. **System Start:** Knowledge Broker loads `.opencode/RULES.md` as the global instruction set.
2. **Agent Activation:** User runs `/developer` or `/debug`.
3. **Identity Shell:** The agent loads its tiny `.md` file to identify its *Role* (Shell).
4. **Logic Routing:** The agent reads the corresponding `<SECTION>` from `RULES.md`.
5. **Execution:** The agent executes the task using the compressed rules.

## Implementation Sequence
1. **Rule Consolidation:** Create `.opencode/RULES.md` and port all rules from the source-of-truth files.
2. **Semantic Compression:** Rewrite each rule using the `MAP`, `SIG`, `FIX` vocabulary.
3. **Agent Refactoring:** Strip the long system prompts from `developer.md` and `debugger.md`. Replace with a `Pointers: RULES.md#SECTION` reference.
4. **Safety Enforcement:** Hard-code the `<SAFETY>` section as the first thing every agent reads.

## Backend Contract (Rules Parser)
- **Tool:** `RULES_LOADER.ts`
- **Action:** Reads `.opencode/RULES.md`, parses XML tags, and injects the relevant section into the agent's current context.

## Verification Flow
1. **Test Case 1: Conciseness Check:** Verify that `developer.md` is under 20 lines of text.
2. **Test Case 2: Safety Override:** Try to run a command that violates `RULES.md#SAFETY` and verify it is blocked.
3. **Test Case 3: Mode Consistency:** Verify that both agents use the exact same Lexicon and SADS contract definitions.
