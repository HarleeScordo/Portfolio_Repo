# ADR-005: Separate Execution from Logic

## Status

Accepted

## Context

Framework code should be reusable, testable, and automation-ready. Mixing reusable functions with one-off execution steps makes pipelines harder to maintain and harder to run in CI/CD contexts.

## Decision

Reusable functions will live in the `R/` directory, while executable entry points will live in the `scripts/` directory.

## Consequences

### Benefits

- Improves maintainability
- Makes functions easier to test
- Supports non-interactive execution
- Creates clearer boundaries between framework logic and pipeline orchestration

### Drawbacks

- Requires users to understand the distinction between function files and executable scripts
