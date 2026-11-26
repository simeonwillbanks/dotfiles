---
name: tdd
description: Drives feature work and bug fixes with a concise red-green-refactor loop using the project's existing test runner and public interfaces.
---

# Test-Driven Development

## Execution Workflow (Quota-Optimized)
Follow these steps in strict order to minimize context usage and preserve weekly quota:

1. **Discover stack & test runner first:**
   - Detect the language, framework, and repo-specific test or wrapper commands from manifest/config files (`package.json`, `pyproject.toml`, `go.mod`, `Cargo.toml`, `Makefile`, `./gradlew`)—never assume a default runner blindly.
   - Check neighboring test files and domain docs (`GLOSSARY.md` if present) so test names and assertions match project conventions.
2. **Identify the test seam (vertical slice):**
   - Target a single public interface, function boundary, or bug reproduction path per slice rather than writing a bulk batch of speculative tests upfront.
   - Prefer real implementations or lightweight fakes over internal mocks, and avoid tautological assertions that mirror the implementation logic.
3. **Run RED -> GREEN -> REFACTOR:**
   - **RED:** Write one focused test that expresses the expected behavior or reproduces the bug, then run the focused test command to confirm it fails.
   - **GREEN:** Write the minimal code needed to pass the test without speculative features, then re-run the focused test command.
   - **REFACTOR:** Clean up duplication or complexity while keeping behavior identical; run tests only after code changes, and never repeat an identical test command on unchanged code.
4. **Final verification:**
   - Run the project's relevant test command once after the final edit to confirm no regressions and no skipped tests.

## Output Rules
- Keep updates concise, factual, and grounded in actual test command results.
- **Remove all comments:** Do not include comments in suggested code, test snippets, or diffs to save tokens.
- Structure your final summary using these three sections:

### 1. Test Seam & Cycle
- State the public seam/behavior tested, the test command used, and confirmation of the failing-then-passing cycle.

### 2. Code & Test Changes
Provide the minimal test and implementation diffs without comments:
```diff
- <previous code>
+ <new code>
