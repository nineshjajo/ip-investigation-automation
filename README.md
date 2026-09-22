# IP Investigation Automation — Public Demo

A small, portfolio-safe Bash demonstration of a repeatable IP-review workflow. It accepts a CSV of IP addresses or CIDR values, validates the input format, and emits deterministic structured output for analyst review.

This repository is a **sanitized reimplementation and teaching demo**. It is not the original operational automation, does not connect to private infrastructure, and does not perform reputation lookups or listing/delisting actions.

## What it demonstrates

- Bash scripting with strict error handling
- Individual and bulk input handling
- Basic IP/CIDR validation
- Deterministic CSV output
- Explicit dry-run behavior
- A clear boundary between automation and analyst decision-making

## Run it

From this directory:

```bash
bash scripts/review_ips.sh --dry-run samples/example_ips.csv
```

The script performs no network requests and never changes external systems. The sample values use documentation-only address ranges.

## Why this exists

The original workflow reduced repetitive investigation entry and standardized a sequence of review steps. This public version shows the general engineering pattern without publishing internal commands, services, infrastructure, case data, or proprietary logic.

## Safety boundary

Do not add real customer data, internal IPs, hostnames, commands, case identifiers, credentials, private endpoints, or production outputs. See `SECURITY.md` before publishing.
