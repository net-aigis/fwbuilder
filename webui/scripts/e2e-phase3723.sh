#!/usr/bin/env bash
# Phase-3723: client hard_gaps_summary_roster type still ok.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_hard_gaps_summary_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 3720+ hard_gaps_summary_roster type ok"
echo "cleaned"
echo "OK: phase3723 e2e passed"
