#!/usr/bin/env bash
# Phase-2331: client surface version + hard_gap_refusal_roster types still ok.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_honesty_surface_version?:' webui/frontend/src/api/client.ts
grep -Fq 'soft_fertig_hard_gap_refusal_roster?:' webui/frontend/src/api/client.ts
echo "client surface/hard_gap_refusal_roster types ok"
echo "cleaned"
echo "OK: phase2331 e2e passed"
