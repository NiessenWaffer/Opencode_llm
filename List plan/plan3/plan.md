# Plan: Complexity Management & Artifact Scoping

## Identity
- ID: 3
- Name: Complexity Management & Artifact Scoping
- Status: ready
- Depends On: 2 (Unified Rules)

## Rationale
This plan establishes how the AI system handles complex tasks and where it stores its blueprints. It ensures that the AI doesn't "break" the project by trying to do too much at once.

## Success Criteria
- AI asks for `List plan/` location on first run.
- Large tasks are automatically split into sequential plans.
- Plans remain human-readable via the `## Rationale` section.
