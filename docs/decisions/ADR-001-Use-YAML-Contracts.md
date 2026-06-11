# ADR-001: Use YAML Contracts

## Status
Accepted

## Context

The framework requires a human-readable, version-controlled mechanism for defining dataset expectations.

## Decision

YAML will be used to define dataset schemas and validation rules.

## Consequences

### Benefits

- Human readable
- Easy to review in pull requests
- Version controlled
- Portable across environments

### Drawbacks

- Requires schema maintenance when structures change