---
name: code-review
description: Performs a structured, quota-optimized code review covering readability, maintainability, edge cases, performance, and framework-specific best practices on diffs or target files.
---

# Structured Code Review

## Execution Workflow (Quota-Optimized)
Follow these steps in strict order to minimize token usage and preserve weekly quota:

1. **Scope the target:**
   - If the user passed a file path, directory, or PR/commit reference, inspect only those targets.
   - Otherwise, run `git diff` and `git diff --staged` (falling back to `git diff HEAD~1` if the working tree is clean) to review only modified code rather than scanning the entire repository.
2. **Detect stack & run automated style checks first:**
   - Identify the language, framework, and conventions from manifest/config files (e.g., `package.json`, `pyproject.toml`, `go.mod`, `.eslintrc*`, `ruff.toml`) without reading the whole repo.
   - Run existing formatters or linters (e.g., `npm run lint`, `ruff check`, `cargo clippy`) so you do not waste tokens manually flagging formatting or syntax issues already caught by tools.
3. **Read minimal surrounding context:**
   - Inspect only the immediate module, types, or interfaces needed to understand how the changed code integrates with the rest of the codebase.
4. **Evaluate across the core review dimensions:**
   - **Readability & Maintainability:** Naming clarity, function cohesion, cyclomatic complexity, dead code, and self-documenting structure.
   - **Bugs & Edge Cases:** Unhandled null/empty states, boundary conditions, error propagation, and concurrency hazards.
   - **Performance & Efficiency:** Unnecessary allocations, redundant loops/queries, or blocking operations.
   - **Framework & Idiomatic Standards:** Alignment with idiomatic patterns and best practices for the detected language/framework.

## Output Rules
- Keep feedback constructive, concise, and backed by concrete code examples rather than vague advice.
- Do not repeat issues already reported by the linter output unless explaining an architectural fix.
- **Remove all comments:** Do not include comments in suggested code or diffs to save tokens.
- Prefix every finding with **[Critical]**, **[Required]**, or **[Nit]** so optional style tweaks are clearly separated from real bugs and architectural issues.
- Structure your response strictly into these three sections:

### 1. Code Analysis
- **Strengths:** 1–2 bullet points on what is well-structured or idiomatic.
- **Weaknesses:** 1–2 bullet points summarizing the main maintainability, performance, or reliability gaps.

### 2. Specific Feedback
Group observations by `<file_path>:<line_number>`:
- **[Critical | Required | Nit]** **[Readability | Bug Risk | Performance | Best Practice]** Concise explanation of the issue and why it matters in this framework/language.

### 3. Improvement Suggestions
Provide actionable, copy-pasteable code examples or diffs for the highest-impact improvements without comments:
```diff
- <original implementation>
+ <recommended refactor>
