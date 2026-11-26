---
name: security-audit
description: Audits code for exploitable security vulnerabilities, performance bottlenecks, and stability edge cases using local security scanners before LLM analysis.
---

# Security & Performance Code Audit

## Execution Workflow (Quota-Optimized)
Follow these steps in strict order to minimize context size and preserve weekly quota:

1. **Scope the target & infer exposure context:**
   - If the user passed a file path, directory, or commit range, inspect only those targets. Otherwise, run `git diff --staged` (falling back to `git diff HEAD~1`).
   - Auto-detect the language/framework and check whether the target handles untrusted external input (HTTP routes, webhooks, CLI args, file uploads, DB queries, auth middleware, or LLM/model outputs) to assess real-world exposure.
2. **Run deterministic security & dependency scanners first:**
   - Execute any locally installed security/audit tools on the scoped files or manifests (e.g., `semgrep --quiet`, `bandit -q`, `gosec`, `npm audit --omit=dev`, `cargo audit`, `trivy fs --scanners vuln,secret`) before reading source code.
   - Scan modified lines for hardcoded credentials, API keys, or private tokens; flag any leaked secret for immediate rotation (not just git removal).
3. **Trace taint & hot paths selectively:**
   - Read only the immediate callers, middleware, validation schemas, and database/network/filesystem sinks connected to the scoped code. Do not read unrelated modules.
4. **Evaluate across the 3 audit pillars (prioritizing real-world exploitability):**
   - **Security Flaws:** Injection vectors (SQLi, XSS, command/path traversal, SSRF with private-IP/DNS checks), broken authentication/authorization (IDOR, missing RBAC, weak auth rate-limiting), destructive path operations lacking symlink/root/ownership guards, untrusted LLM/model output or prompt-boundary flaws, insecure deserialization, weak cryptography, and exposed secrets.
   - **Performance Bottlenecks:** Unbounded queries/payloads (DoS vectors), N+1 database calls, regex backtracking (ReDoS), blocking I/O on async event loops, and memory leaks.
   - **Stability Edge Cases:** Unhandled exceptions on malformed input, race conditions/TOCTOU flaws, missing timeouts/retries on external calls, and resource exhaustion.

## Output Rules
- Prioritize findings by **real-world exploitability and blast radius**—skip theoretical low-impact nitpicks on internal-only helper code.
- **Remove all comments:** Do not include comments in recommended code fixes or diffs to save tokens.
- Order findings from **Critical** to **Low**. If no exploitable vulnerabilities or bottlenecks exist, output `"No security vulnerabilities or critical performance risks found."` and stop.
- Format every finding strictly using the four-part structure below:

### `<file_path>:<line_number>` — <Vulnerability or Bottleneck Title>
1. **Identified Issue:** Concrete description of the flaw, attack surface, or bottleneck (include scanner rule/CWE if applicable).
2. **Severity Level:** `Critical` | `High` | `Medium` | `Low` *(state exploitability: e.g., unauthenticated remote vector vs. authenticated edge case)*.
3. **Explanation:** How an attacker or production load triggers the flaw and what fails as a result.
4. **Recommended Fix or Mitigation:**
```diff
- <vulnerable or slow code>
+ <hardened or optimized code>
