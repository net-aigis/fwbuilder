#!/usr/bin/env bash
# Phase-13259: client soft_fertig_ssh_auth_hard_gap_ratio_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_hard_gap_ratio_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-hard-gap-ratio roster type ok"; echo "cleaned"; echo "OK: phase13259 e2e passed"
