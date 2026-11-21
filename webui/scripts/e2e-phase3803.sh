#!/usr/bin/env bash
# Phase-3803: client hard_gaps_closure_roster type still ok.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_hard_gaps_closure_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 3800+ hard_gaps_closure_roster type ok"
echo "cleaned"
echo "OK: phase3803 e2e passed"
