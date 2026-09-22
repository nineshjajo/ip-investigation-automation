#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
output="$(bash "$root/scripts/review_ips.sh" --dry-run "$root/samples/example_ips.csv")"

[[ "$output" == *"192.0.2.10,valid"* ]]
[[ "$output" == *"198.51.100.0/24,valid"* ]]
[[ "$output" == *"not-an-ip,invalid"* ]]
printf 'smoke test passed\n'
