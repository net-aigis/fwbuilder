#!/usr/bin/env bash
# Phase-3659: client soft_fertig_hard_gaps_summary_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_hard_gaps_summary_roster?:' webui/frontend/src/api/client.ts
echo "client hard-gaps summary roster type ok"
echo "cleaned"
echo "OK: phase3659 e2e passed"
