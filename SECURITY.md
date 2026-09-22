# Security and publication boundary

This is a public-safe reimplementation. It intentionally excludes:

- private employer systems and infrastructure;
- real customer or case data;
- internal IP addresses, hostnames, commands, and listing/delisting workflows;
- credentials, tokens, private endpoints, logs, and databases;
- proprietary enrichment logic or reputation data.

The script performs local validation only, makes no network requests, and has no external side effects. Use documentation-only samples or data you are authorized to process.
