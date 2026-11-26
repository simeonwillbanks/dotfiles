---
name: perf-optimize
description: Measures and optimizes frontend, backend, or database performance bottlenecks using evidence-based profiling and strict keep-or-revert verification.
---

# Performance Optimization

## Execution Workflow (Quota-Optimized)
Follow these steps in strict order to minimize context usage and preserve weekly quota:

1. **Scope target & check existing measurements:**
   - If the user passed a file path, endpoint, component, or query, inspect only those targets; otherwise inspect `git diff --staged` (falling back to `git diff HEAD~1`).
   - Check existing profilers, query plans, timing logs, or benchmark scripts before reading broad files.
2. **Establish baseline before optimizing:**
   - Capture concrete baseline metrics (latency, p95, throughput, query plan/timings, bundle/render cost, or Web Vitals) under consistent conditions before proposing code changes.
   - Do not optimize unmeasured code or optimize before identifying the actual bottleneck.
3. **Target the proven bottleneck selectively:**
   - Read only the immediate hot path, callers, queries, or schemas tied to the bottleneck.
   - Address high-leverage causes first: N+1 queries, unbounded result sets, query plans/indexes (verify with `EXPLAIN ANALYZE` and account for write cost), connection pool contention, missing/keyed caches with explicit invalidation, main-thread long tasks/re-renders, and bundle splitting/image sizing.
4. **Verify (keep or revert) & log outcome:**
   - Re-measure using the exact same command and conditions, changing one bottleneck at a time while keeping tests green.
   - Recommend reverting changes within run-to-run noise, worse results, or behavior regressions, and note tried/reverted ideas so dead experiments are not repeated.

## Output Rules
- Anchor every recommendation in measured numbers or concrete bottleneck mechanics—skip speculative micro-optimizations.
- **Remove all comments:** Do not include comments in suggested code or diffs to save tokens.
- Format each finding strictly using the four-part structure below:

### `<file_path>:<line_number>` — <Bottleneck Title>
1. **Measured Bottleneck:** Baseline metric or profiling signal and why it is the limiting factor.
2. **Optimization Fix:**
```diff
- <slow implementation>
+ <optimized implementation>
