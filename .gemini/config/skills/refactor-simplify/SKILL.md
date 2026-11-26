---
name: refactor-simplify
description: Identifies complexity hotspots, duplicated logic, and unclear structure, proposing small behavior-preserving refactors verified against existing tests.
---

# Refactor & Simplify Review

## Execution Workflow (Quota-Optimized)
Follow these steps in strict order to minimize context usage and preserve weekly quota:

1. **Scope the target & auto-detect stack:**
   - If the user passed a file path, directory, or function name, inspect only those targets. Otherwise, run `git diff --staged` (falling back to `git diff HEAD~1`).
   - Auto-detect the language, framework, and idiomatic style from file extensions and root config files—never ask the user to paste `<Language>` or `<Code>` tags.
2. **Verify baseline tests & complexity tools first:**
   - Check if unit tests or complexity/lint rules exist for the scoped files (e.g., `pytest`, `npm test`, `go test`, `ruff check --select C90`, `eslint`).
   - Note test coverage status so you only propose safe, verifiable incremental changes.
3. **Read minimal caller/contract context:**
   - Inspect only the immediate callers, exported interfaces, shared helpers, or `git blame`/tests touched by the target code so you never break public signatures, error behavior, or intentional constraints (Chesterton's fence).
4. **Identify high-leverage simplification opportunities:**
   - **Complexity Hotspots:** Deeply nested `if/else` chains (replace with guard clauses/early returns), oversized functions doing multiple jobs, boolean parameter flags, and tangled boolean expressions.
   - **Logic Simplification:** Imperative loops replaceable by clean standard-library primitives, redundant state variables, and over-engineered abstractions—favoring clarity over cleverness or line-count reduction.
   - **Naming & Duplication:** Ambiguous variable/function names (`data`, `result`, `temp`), misleading names, magic numbers/strings, dead code, comments (remove all comments in proposed code to save tokens), and repeated blocks that can be extracted into a focused helper.

## Output Rules
- **Strictly preserve existing behavior:** Never alter return types, side effects, error handling, edge-case handling, or public signatures, and avoid mixing feature edits with broad refactors.
- **Remove all comments:** Do not include comments in proposed code or diffs—let the code and diff structure speak for themselves and save tokens.
- **Prefer small, incremental steps:** Propose targeted, low-risk refactors over sweeping rewrites. If the code is already clean and idiomatic, output `"No meaningful refactoring opportunities found."` and stop.
- Format every suggestion strictly using the three-part structure below:

### `<file_path>:<line_number>` — <Refactor Title>
1. **Refactor Opportunity:** Concise summary of the complexity hotspot, duplication, or naming issue.
2. **Before / After Example:**
```diff
- <current implementation>
+ <simplified implementation>
