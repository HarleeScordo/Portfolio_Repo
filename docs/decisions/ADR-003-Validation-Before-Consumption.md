# ADR-003: Validation Before Consumption

## Status
Accepted

## Context

Downstream failures are more expensive than early validation failures.

## Decision

All datasets should be validated against contracts before consumption.

## Consequences

### Benefits

- Earlier detection of issues
- Reduced downstream risk
- Improved trust in data

### Drawbacks

- Additional processing overhead