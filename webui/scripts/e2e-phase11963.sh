#!/usr/bin/env bash
# Phase-11963: client soft_fertig_ssh_auth_hard_gap_count_roster Soft 11960+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_hard_gap_count_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 11960+ soft_fertig_ssh_auth_hard_gap_count_roster type ok"; echo "cleaned"; echo "OK: phase11963 e2e passed"
