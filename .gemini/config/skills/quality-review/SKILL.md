---
name: quality-review
description: Audits code for overall quality, correctness, code smells, anti-patterns, performance, and stack-specific best practices with risk-ranked findings.
---

# Comprehensive Quality & Best Practices Review

## Execution Workflow (Quota-Optimized)
Follow these steps in strict order to minimize context usage and preserve weekly quota:

1. **Scope the target & auto-detect stack:**
   - If the user passed a file path, directory, or commit range, inspect only those targets. Otherwise, run `git diff --staged` (falling back to `git diff HEAD~1`).
   - Infer the exact language, runtime version, and framework from file extensions and root config files (`package.json`, `pyproject.toml`, `go.mod`, `Cargo.toml`, `pom.xml`, etc.)—never ask the user to manually specify `<Language>`.
2. **Run deterministic static analysis first:**
   - Execute any configured linters, type-checkers, or complexity analyzers (e.g., `tsc --noEmit`, `eslint`, `ruff`, `mypy`, `golangci-lint`) on the scoped files to catch baseline standard violations without spending LLM tokens.
3. **Read minimal surrounding context:**
   - Read only the directly imported modules, shared types, or parent classes required to verify architectural fit and anti-patterns.
4. **Audit across the 4 quality pillars (grounded in the detected framework):**
   - **Correctness & Edge Cases:** Logic errors, invalid state transitions, improper error handling, boundary/null cases, and broken contracts.
   - **Code Smells & Anti-Patterns:** God functions/classes, tight coupling, leaky abstractions, duplicated logic, feature logic leaking into shared modules, refactors that relocate complexity rather than reduce it, growing already-large files without decomposition, and framework-specific anti-patterns.
   - **Readability & Maintainability:** Unclear naming, deep nesting, high cognitive complexity, dead code/unused shims, and missing or misleading types.
   - **Performance & Efficiency:** Unbounded memory growth, redundant I/O or queries, inefficient data structures, and unnecessary re-renders/allocations.

## Output Rules
- Anchor every observation strictly to the detected language and framework idioms—strip out generic software engineering platitudes.
- Do not repeat issues already reported by static analysis unless explaining an architectural or structural fix.
- Order findings from **High** to **Low** risk. If no issues exist, output `"No quality or best-practice issues found."` and stop.
- Format every finding strictly using the three-part structure below:

### `<file_path>:<line_number>` — <Issue Title>
1. **Issues Identified:** Concise description of the bug, anti-pattern, or standard violation (include static tool output if relevant).
2. **Risk Level:** `High` | `Medium` | `Low` *(with a one-clause justification of impact and whether it should block merge or remain optional)*.
3. **Suggested Improvements with Explanations:**
   - **Reasoning:** Why the current approach is problematic in this specific language/framework and how the change resolves it or reduces complexity.
   - **Fix:**
```diff
- <current code>
+ <improved code>
