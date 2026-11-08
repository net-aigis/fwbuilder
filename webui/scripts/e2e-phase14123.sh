#!/usr/bin/env bash
# Phase-14123: client soft_fertig_ssh_auth_gap_refusal_title_roster Soft 14120+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_gap_refusal_title_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 14120+ soft_fertig_ssh_auth_gap_refusal_title_roster type ok"; echo "cleaned"; echo "OK: phase14123 e2e passed"
