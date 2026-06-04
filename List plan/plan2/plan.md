# Plan: Unified Safety & Implementation Standards

## Identity
- ID: 2
- Name: Unified Safety & Implementation Standards
- Status: ready_for_workflow
- Depends On: 1 (Core System)

## User Goal
- Consolidate all implementation, safety, and debugging rules into a single-source-of-truth model.
- Minimize the text length inside agent definitions (`.md` files).
- Ensure agents have "only one file to follow" to prevent context fragmentation.

## Assumptions
- Agents can effectively follow a centralized `RULES.md` if it is high-signal.
- Safety guards (truncation, forbidden paths) must be non-negotiable and globally enforced.
- The "Rules" file will use the Semantic Efficiency Protocol (shorthand, enums, XML).

## Open Questions
- Should the rules be split into `DEV_RULES.md` and `DEBUG_RULES.md`, or one `MASTER_RULES.md`?
- How do we handle "Mode Switching" if they follow one file? (Answer: Use conditional sections in the master file).

## Strategy: The "Master Rulebook" Model
1. **Centralize:** Move all rules from `Developer mode/implementation rules/*.md` and `Debugging mode/rules/*.md` into a single `.opencode/RULES.md`.
2. **Compress:** Rewrite the rules using **Industrial-Grade Shorthand** (DSL).
3. **Reference:** Point the `developer.md` and `debugger.md` agents to specific sections of `RULES.md`.
4. **Safety Hard-Coding:** Embed the "Ironclad Safety Layer" as the preamble of the Master Rulebook.

## Master Rulebook Structure (`RULES.md`)
- `<SAFETY>`: Forbidden paths, Anti-truncation, Backups.
- `<IMPLEMENTATION>`: Vertical-slicing, SADS contracts, Verification ladder.
- `<DEBUGGING>`: Repro-first, Hypothesis ranking, Cleanup pass.
- `<LEXICON>`: Canonical terms.

## Research Notes
- LLMs perform better when follow-up instructions are in a structured, hierarchical format (YAML/XML within Markdown).
- Reducing "System Prompt Noise" increases the model's "Attention Budget" for actual code logic.
