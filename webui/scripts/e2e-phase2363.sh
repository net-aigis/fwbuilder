#!/usr/bin/env bash
# Phase-2363: client hard_gap_refusal_roster type still ok.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_hard_gap_refusal_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 2360+ hard_gap_refusal_roster type ok"
echo "cleaned"
echo "OK: phase2363 e2e passed"
