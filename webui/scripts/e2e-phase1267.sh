#!/usr/bin/env bash
# Phase-1267: client still types soft_fertig_surface_*.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_surface_keys?:' webui/frontend/src/api/client.ts
grep -Fq 'hard_gap_related_refusal_titles?:' webui/frontend/src/api/client.ts
echo "client surface + refusal types ok"
echo "cleaned"
echo "OK: phase1267 e2e passed"
