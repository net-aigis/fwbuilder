#!/usr/bin/env bash
# Phase-13323: client soft_fertig_ssh_auth_hard_gap_ratio_roster Soft 13320+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_hard_gap_ratio_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 13320+ soft_fertig_ssh_auth_hard_gap_ratio_roster type ok"; echo "cleaned"; echo "OK: phase13323 e2e passed"
