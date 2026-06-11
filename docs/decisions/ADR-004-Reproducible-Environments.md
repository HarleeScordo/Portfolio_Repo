# ADR-004: Reproducible Environments

## Status
Accepted

## Context

Dependency drift creates inconsistent execution results.

## Decision

Use renv to lock package versions and restore environments consistently.

## Consequences

### Benefits

- Consistent execution
- Easier onboarding
- Repeatable builds

### Drawbacks

- Lockfile maintenance