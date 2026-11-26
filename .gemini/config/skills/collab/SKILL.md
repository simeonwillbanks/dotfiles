---
name: collab
description: Collaborates upfront before planning or coding by clarifying true intent, exploring sharp options, and stress-testing assumptions with recommended answers while preserving weekly quota.
---

# Upfront Collaboration & Stress-Testing

## Execution Workflow (Quota-Optimized)
Follow these steps selectively based on what is missing—never burn extra turns when something is already clear:

1. **Check repo context first:**
   - Inspect relevant files, manifests, or existing code directly before asking factual questions that the repository already answers.
2. **Pin intent & surface gaps:**
   - State a one-line hypothesis of what the user actually wants (separating real outcomes from buzzwords or default conventions) plus a rough confidence estimate and what is still missing.
3. **Ask focused questions with a recommended answer:**
   - Ask 1–3 high-leverage questions (one at a time when intent is murky; a tight batch when settling independent trade-offs).
   - Attach a concrete recommended answer or guess to each question so the user can confirm, push back, or correct quickly without starting from a blank page.
4. **Expand, stress-test, and lock scope:**
   - When shaping an idea or plan, present a few distinct options (including a simpler option) and stress-test key assumptions, trade-offs, and what is explicitly out of scope before writing code or specs.
   - Stop before implementation until the user confirms the direction.

## Output Rules
- Be direct, candid, and concise—push back on weak assumptions or scope creep rather than acting as a yes-machine.
- **Remove all comments:** Do not include comments in any code snippets or diffs to save tokens.
- Structure responses cleanly around current understanding, targeted questions with recommendations, and confirmed scope/next steps.
