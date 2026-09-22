#!/usr/bin/env bash
set -euo pipefail

usage() {
  printf 'Usage: %s --dry-run INPUT.csv\n' "${0##*/}" >&2
}

if [[ "${1:-}" != "--dry-run" || -z "${2:-}" ]]; then
  usage
  exit 2
fi

input_file="$2"
if [[ ! -f "$input_file" ]]; then
  printf 'Input file not found: %s\n' "$input_file" >&2
  exit 1
fi

is_ipv4() {
  local value="$1"
  [[ "$value" =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]] || return 1
  local part
  IFS='.' read -r -a octets <<< "$value"
  for part in "${octets[@]}"; do
    (( part <= 255 )) || return 1
  done
}

is_ip_or_cidr() {
  local value="$1"
  if [[ "$value" == */* ]]; then
    local address="${value%%/*}"
    local prefix="${value##*/}"
    is_ipv4 "$address" && [[ "$prefix" =~ ^[0-9]{1,2}$ ]] && (( prefix <= 32 ))
  else
    is_ipv4 "$value"
  fi
}

printf 'value,status,action\n'
awk -F',' 'NR > 1 { print $1 }' "$input_file" | while IFS= read -r value; do
  [[ -z "$value" ]] && continue
  if is_ip_or_cidr "$value"; then
    printf '%s,valid,dry-run review only\n' "$value"
  else
    printf '%s,invalid,manual correction required\n' "$value"
  fi
done
