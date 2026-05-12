---
name: explore
description: Gain context on an aspect of an existing implementation in anticipation of making changes to it.
---

# Explore

Use this skill when the user wants understanding before edits, when the codebase area is unfamiliar, or when safe changes depend on mapping existing behavior first.

## Goals

- Identify the smallest set of files, symbols, and runtime paths relevant to the task.
- Explain how the current implementation works, not just where text appears.
- Surface constraints, risks, and likely edit points before making changes.
- Stop once the unknowns blocking implementation are resolved.

## Workflow

1. Restate the question in concrete technical terms.
2. Define the scope of exploration:
   - Feature, bug, command, API, config path, or UI flow.
   - Whether the user wants explanation, likely edit points, or a full implementation plan.
3. Start broad, then narrow:
   - Use `rg --files` to map likely directories.
   - Use `rg "symbol|string|flag|route"` to find entry points.
   - Read the smallest useful slices with `sed -n`.
4. Trace the execution path:
   - Entry point
   - Dispatch / routing
   - Core logic
   - Data flow, side effects, persistence, or network boundaries
   - Tests covering the path
5. Summarize findings with file references and unresolved questions.
6. If exploration was in service of a code change, move directly into editing once the critical path is clear.

## Search Strategy

Prefer fast, low-noise commands:

- `rg --files path`
- `rg -n "pattern" path`
- `sed -n 'start,endp' file`
- `git status --short` when local changes might affect interpretation

Prefer searching for:

- User-visible strings
- Function, type, class, and module names
- CLI flags, env vars, config keys, routes, selectors, and test names
- Error messages and log text

When the first search is noisy, narrow by:

- Limiting directories
- Searching for exact identifiers
- Following imports or call sites one step at a time
- Reading tests to infer intended behavior

## What To Extract

Capture only information that changes the next decision:

- Where the behavior starts
- Which modules own which responsibilities
- Important invariants and assumptions
- Feature flags, configuration, and environment dependencies
- Existing abstractions that should be reused
- Risks of changing the wrong layer
- Missing or misleading tests

Do not dump long code excerpts or enumerate every file touched by a broad search.

## Output Shape

When reporting findings, optimize for actionability:

- Start with the answer or current understanding.
- Cite the key files and symbols.
- Explain the control flow in a few steps.
- Call out ambiguity, risks, or likely edit points.
- If useful, end with a short proposed plan.

Good output:

- "`foo` is parsed in [a], normalized in [b], and applied during request construction in [c]. The safest edit point is [b] because tests already cover the downstream contract."

Weak output:

- "I found references in 12 files."

## Decision Rules

- Keep exploring while a missing dependency or control-flow gap could cause a wrong edit.
- Stop exploring once you can name the owning files, the change boundary, and the test surface.
- If the user asked for exploration only, do not edit code unless they explicitly ask or the task context makes implementation clearly expected.
- If local changes conflict with your read of the code, treat them as real and work around them rather than assuming the branch is clean.
