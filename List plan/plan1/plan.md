# Plan: AI Mode Core & Reading Strategy

## Identity
- ID: 1
- Name: AI Mode Core & Reading Strategy
- Status: ready_for_workflow

## User Goal
- Architect a multi-mode AI (Suggestion, Developer, Debugger, Study).
- Design a file-reading strategy that ensures comprehensive coverage without "all-at-once" context overflow.

## Assumptions
- Modes are triggered by explicit commands or metadata in requests.
- The "Reading Strategy" requires an indexing or mapping phase to understand the file graph before deep reading.
- "Vague information" is avoided by maintaining a semantic map or "Knowledge Index" of the codebase.

## Open Questions
- What environment is this AI operating in (CLI, IDE, Web)?
- Should the "Study Mode" produce permanent artifacts (e.g., summaries) or just interactive chat?
- Is there a persistent "Memory" folder (like `.gemini/` or similar) to store the file index?

## Installation & Deployment Strategy
- **Global Installation (One-time):**
  - Install the **Knowledge Broker** and **DSL Parser** as global tools in `~/.config/opencode/tools/`.
  - Install any global npm dependencies in `~/.config/opencode/package.json`.
  - This ensures the `MAP()`, `SIG()`, and `FIX()` commands are available in *any* project.
- **Local Installation (Per Project):**
  - Place mode-specific agents in `.opencode/agent/*.md`.
  - Maintain the project's structural map in `AGENTS.md` (root directory).
  - Use `.opencode.json` for project-specific overrides.

## OpenCode Implementation Standard
- **Agent Definitions:** All modes (Suggestion, Developer, Debugger, Study) will be implemented as OpenCode Agent files in `.opencode/agent/*.md`.
- **Custom Tools:** The `MAP`, `SIG`, `FIX`, and `STUDY` operations will be implemented as **TypeScript Tools** in `~/.config/opencode/tools/*.ts`.
- **Format:** Use **Markdown with YAML Frontmatter** for agents and **TypeScript** for tools.

## Phase 6: Scientific Debugging & Post-Mortem
- **Reproduction-First Policy:**
  - The AI is forbidden from applying a `FIX` for a bug until it successfully runs a `REPRO` command that captures the failure.
  - If a repro is impossible, it must document a "High-Confidence Signal" before proceeding.
- **Hypothesis-Driven Triage:**
  - New tool: `HYPOTHESIZE(symptoms)`. 
  - The agent generates 3-5 root-cause hypotheses and ranks them by "Signal vs. Cost". It executes the cheapest experiment first.
- **Automated Instrumentation Cleanup:**
  - The `PROBE` tool is enhanced to track all temporary `console.log` or trace statements added.
  - Once a fix is verified, the system runs a mandatory `CLEANUP` pass to remove all debugging "noise" from the codebase.
- **Recursive Post-Mortem:**
  - After every successful debug, the agent generates a `post_mortem.md` segment for `AGENTS.md`.
  - It must answer: "How could we have prevented this with a MATURITY check or a Linter rule?"
- **The Debug Artifact (`debug.md`):**
  - Every bug-hunt session creates a dedicated `debug.md` in `.opencode/debug/` to track the "Chain of Thought" (Hypotheses -> Experiments -> Results).

## Phase 5: Industrial Implementation Pipeline
- **Frontend-First Vertical Slicing:**
  - AI follows a strict sequence: **UI Shell -> Navigation/Routes -> Backend Logic -> Database Persistence -> Seeders**.
  - This ensures "Visible Value" at every step and prevents building blind backend logic.
- **The Verification Ladder:**
  - The `VERIFY` tool is upgraded to a multi-stage ladder:
    1. `static_read`: Syntax and lint check.
    2. `type_check`: Type safety validation.
    3. `unit_test`: Logic verification.
    4. `integration`: End-to-end flow check.
    5. `visual_check`: UI/UX alignment.
- **Checked-Item Protection:**
  - Once a sub-task is verified and marked `[CHECKED]`, the AI is forbidden from re-working it without an `ESCALATION_EVENT`. This prevents "accidental rework" and regression.
- **Plan-to-Task Alignment Gate:**
  - Every task in `task.md` must be explicitly linked to a `source_plan_section` and `source_workflow_step`. 
  - If a task cannot be traced back to the plan, the agent must trigger `MATURITY` to identify the missing blueprint.
- **Diff Discipline:**
  - The agent is instructed to perform **Single-Purpose Commits**. It avoids unrelated refactors in the same implementation turn.

## Phase 4: Predictive & Zero-Friction Intelligence
- **Predictive Context Loading (Anticipation):**
  - New tool: `ANTICIPATE(task)`.
  - The Knowledge Broker analyzes the current task and **Pre-fetches** the `SIG` (signatures) of 2nd-degree dependencies before the agent even asks for them.
  - This removes the "I need to read file X... okay, now I need file Y" delay.
- **Zero-Loss Handoff (Inter-Mode):**
  - When switching from `suggestion.md` to `developer.md`, the system generates a **Context Snapshot** (`.opencode/snapshots/latest.json`).
  - This snapshot contains the "Mental State" of the previous agent, ensuring the next agent doesn't repeat the same research steps.
- **Cross-Agent Verification (Consensus):**
  - For P0 (Critical) tasks, the `VERIFY` step can trigger a "Second Opinion" from a different agent (e.g., Debugger critiques Developer's fix).
- **Automated Refactoring Debt-Tracker:**
  - As the AI modifies code, it maintains a `DEBT.md` in `.opencode/memory/`. 
  - If a fix adds "Temporary logic" to solve a P0 user problem, it is automatically logged for later refactoring in a P2 enhancement task.

## Phase 3: Meta-Intelligence & Structural Alignment
- **Contract-Based Reasoning (SADS):**
  - For every UI/Feature change, the agent must define the **SADS Contract**: (S)ection, (A)ction, (D)ata, (S)tate.
  - This ensures no "ghost components" or "actionless buttons" are generated.
- **Dependency Maturity Check:**
  - Before execution, the agent runs `MATURITY(project)`. 
  - It identifies "Unplanned Dependencies" (e.g., "You are asking for a Login feature, but no Auth Provider exists in the codebase").
  - The AI must solve the dependency gap before implementing the requested feature.
- **Scenario-Based Branching:**
  - Every `workflow.md` must now include a **Scenario Matrix**:
    - *Success Path:* Ideal user journey.
    - *Failure Path:* How the system handles errors.
    - *Alternate Path:* Guest access or edge-case conditions.
- **Vertical-Slice Implementation:**
  - The AI prioritizes "Vertical Slices" (UI -> Route -> Controller -> DB) to provide immediate value, rather than building "Layer-First" (all DBs first, then all Routes).
- **Architectural Sentinel (`SENTINEL`):**
  - A background tool that monitors the `AGENTS.md` for "Goal Drift." If the agent's actions start to deviate from the **Strategic Intent** of the project, the Sentinel triggers a `CONSULT` event.

## Semantic Pruning & Lexicon (Anti-Redundancy)
- **Project Lexicon:**
  - `AGENTS.md` must maintain a **Canonical Terminology** table.
  - Example: If the project uses "User", the agent is forbidden from using "Client", "Account", or "Customer" in its generated artifacts.
- **Deduplication Logic:**
  - Artifacts (plan.md, task.md) must use **High-Signal Shorthand**. 
  - Instructions must be unique; no two tasks in `task.md` can overlap in scope or descriptive context.
- **Synonym Drift Prevention:**
  - New tool: `LEXICON(term)`.
  - Before generating a new section, the agent checks the Lexicon to find the established term for a concept.
- **Concise Narrative Policy:**
  - Avoid filler phrases ("I will now...", "It is important to note...").
  - Use bulleted lists and enums for all logic steps.
  - Rationale is limited to one-sentence "Rationale Notes".

## User-Centric Prioritization (Value-First Intelligence)
- **Value-Prop Anchoring:**
  - Every `plan.md` must start with a **User Problem Statement** and a **Value Proposition**.
  - All sub-tasks in `task.md` must be tagged with a **Value Level** (P0: Essential, P1: High-Impact, P2: Enhancement).
- **Impact-Aware Reasoning:**
  - New tool: `EVALUATE(task)`. 
  - Before starting a task, the agent assesses: "How does this specific code change solve the user's primary goal?"
  - If a task is "Low-Value" (e.g., cosmetic refactoring that doesn't fix a bug or add a feature), the agent must suggest deferring it via the `CONSULT` tool.
- **Outcome-Driven Verification:**
  - `VERIFY` step is not just "Does it run?" but "Does it satisfy the User Goal defined in plan.md?".
  - Success criteria are mapped directly to the **Expected Result** defined during the Planning phase.
- **Strategic Empathy:**
  - The agent is instructed to prioritize **Clarity** and **UX Impact** over "Internal Cleanliness". It avoids complex abstractions that make the codebase harder for the human user to understand.

## Ironclad Safety Layer (Catastrophe Prevention)
- **Anti-Truncation Guards:**
  - The `FIX` tool must perform a **Length & Integrity Check**. 
  - If a proposed change results in a significant, unexplained reduction in file size (>20% or removal of non-comment logic), the tool *must* block the write and trigger a `VERIFY` warning.
- **Data Integrity Protocol:**
  - `PROBE` scripts are restricted to **Read-Only** operations on databases and file systems unless `[WRITE_ACCESS_EXPLICIT]` is granted via YAML frontmatter.
  - Commands that modify data (e.g., `DELETE`, `TRUNCATE`, `DROP`) are blacklisted for autonomous agents.
- **Atomic Checkpointing:**
  - Every `FIX` operation must automatically create a `.opencode/backups/` entry before modification.
  - New tool: `RESTORE(backup_id)` for immediate rollback if a `TEST` or `VERIFY` fail.
- **Sensitive Path Protection:**
  - Files like `.env`, `.git/`, and system `/etc/` are marked as `[FORBIDDEN]`. The Knowledge Broker will skip these during `MAP()` and `SIG()` to prevent leakage or accidental corruption.

## Phase 2: Execution & Validation Intelligence
- **Test-Driven Execution (TDE):**
  - The `FIX` command is incomplete without a **Verification Script**.
  - Agent must generate a `test_repro.ts/py` that fails *before* the fix and passes *after*. 
  - Implementation is not marked `[COMPLETED]` until the test passes in the environment.
- **Strategic Consultation (Human-in-the-Loop):**
  - New tool: `CONSULT(problem, options)`. 
  - When the AI hits a "Strategic Fork" (e.g., "Refactor the base class" vs. "Add a wrapper"), it *must* pause and present the trade-offs to the user before proceeding.
- **Environment Probing (Dynamic Scripts):**
  - Agent can create and execute temporary `PROBE.sh` or `PROBE.ts` scripts to inspect runtime state, database schemas, or API responses that aren't visible in static code.
- **Self-Healing Loop:**
  - If a `TEST` fails or a `PROBE` reveals unexpected state, the agent automatically triggers a `STUDY` refresh and a `REVISION` of the `plan.md`.

## Architectural Sinkhole Remediation (Robustness Patches)
- **Patch 1: Contextual Anchoring (vs. Line Numbers):**
  - The `FIX` tool will move from `lines` to **Match-Block Verification**. 
  - `FIX(file, old_string, new_string)` -> The tool *must* find the exact `old_string` in the file. If it has shifted or changed, the tool fails and requests a `SIG` refresh.
- **Patch 2: Segmented Memory (vs. Giant AGENTS.md):**
  - `AGENTS.md` becomes a **Master Index** pointing to `.opencode/memory/*.md` segments.
  - The Knowledge Broker uses a "Least Recently Used" (LRU) cache to swap memory segments in/out of the context window based on the current file path.
- **Patch 3: Adversarial Verification (vs. Self-Correction):**
  - `VERIFY` will utilize a **Cynical Persona** or a different model entirely (e.g., if Developer is Gemini, Verify is Claude).
  - Verification *must* produce a "Failure Hypothesis" (e.g., "This fix might break the auth middleware because X").
- **Patch 4: Hierarchical Tool Loading:**
  - OpenCode will search for tools in `./.opencode/tools/` *before* falling back to `~/.config/opencode/tools/`.
  - This allows a project to ship its own custom `SIG.ts` parser if it uses a non-standard language or version.
- **Patch 5: State Locking (vs. Semantic Drift):**
  - The `plan.md` acts as the **Immutable State Lock**. 
  - If a Developer agent wants to deviate from the `plan.md` approved by the Suggestion agent, it *must* trigger an `ESCALATION_EVENT` back to Planning Mode.

## Advanced Cognitive Architecture (Smart Reasoning)
- **Recursive Verification (Double-Check):**
  - Agents must run a `VERIFY(plan)` step where they attempt to find flaws in their own proposal before presenting it.
  - Specifically looks for: dependency cycles, breaking changes, and security vulnerabilities.
- **Architectural Anchor (Guardrails):**
  - Every complex fix must cite the `ARCH.md` (or equivalent) to ensure the solution aligns with the project's long-term design patterns, not just a "quick patch".
- **Tree-of-Thought Branching:**
  - For high-complexity problems, the agent creates a `SCENARIO_MATRIX` in `plan.md` to compare 2-3 different implementation paths before choosing the optimal one.
- **Step-Wise State Management:**
  - The agent must maintain a "Mental State" in `task.md` that tracks `[COMPLETED]`, `[ACTIVE]`, and `[RISK]` for every sub-step to prevent getting lost in deep implementation.

## Semantic Efficiency Protocol (Tech Language)
- **Structure:** Use **Markdown** for all planning and descriptive artifacts (best for narrative logic).
- **Metadata:** Use **YAML** for headers and configuration (best for hierarchical reasoning).
- **Separation:** Use **XML Tags** (e.g., `<context>`, `<logic>`) to wrap distinct data blocks to prevent "instruction drift".
- **Shorthand DSL:**
  - `MAP(dir)` -> Structural scan of directory.
  - `SIG(file)` -> Extract function/class signatures (AST Pruning).
  - `FIX(file, lines, logic)` -> Surgical code update instruction.
  - `STUDY(symbol)` -> Comprehensive explanation of a specific symbol.
  - `VERIFY(plan)` -> Recursive self-correction and risk analysis.
  - `ANCHOR(concept)` -> Validate a change against the core architectural rules.

## Research Notes
- **Mode/Agent Capabilities (OpenCode Native):**
  - **suggestion.md:** Proactive optimization and best practices.
  - **developer.md:** High-signal code generation and task execution.
  - **debugger.md:** Error tracing and surgical bug fixing.
  - **study.md:** Architectural mapping and education.
- **Reading Strategy (Progressive Comprehension):**
  - **Tier 1: Structural Awareness:** `MAP(root)` to identify file tree.
  - **Tier 2: Semantic Anchoring:** Read `opencode.toml`/`AGENTS.md` and entry points.
  - **Tier 3: Symbol Mapping:** Use `SIG(file)` for a "Global Symbol Table".
  - **Tier 4: Contextual Deep Read:** Full file read for surgical tasks.

## Strategy
- Implement a **Mode Router** that selects specific "Skills" or "System Instructions" based on the mode.
- Develop a **Knowledge Broker** component that manages the "Mapping -> Indexing -> Targeted Reading" lifecycle.
- Apply the **Semantic Efficiency Protocol** to all AI-generated and AI-read artifacts to maximize context window utility.
