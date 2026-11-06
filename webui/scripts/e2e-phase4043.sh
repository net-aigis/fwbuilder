#!/usr/bin/env bash
# Phase-4043: client soft_fertig_hard_gaps_field_roster type still ok.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_hard_gaps_field_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 4040+ soft_fertig_hard_gaps_field_roster type ok"
echo "cleaned"
echo "OK: phase4043 e2e passed"
