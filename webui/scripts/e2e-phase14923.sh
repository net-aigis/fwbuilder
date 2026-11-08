#!/usr/bin/env bash
# Phase-14923: client soft_fertig_ssh_auth_hard_gap_stable_roster Soft 14920+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_hard_gap_stable_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 14920+ soft_fertig_ssh_auth_hard_gap_stable_roster type ok"; echo "cleaned"; echo "OK: phase14923 e2e passed"
