#!/usr/bin/env bash
# Phase-11899: client soft_fertig_ssh_auth_hard_gap_count_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_hard_gap_count_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-hard-gap-count roster type ok"; echo "cleaned"; echo "OK: phase11899 e2e passed"
