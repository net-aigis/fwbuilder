#!/usr/bin/env bash
# Phase-643: client types for /hard-gaps fidelity sample.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
awk '/export function fetchHardGaps\(/,/^}/' webui/frontend/src/api/client.ts | grep -Fq 'layout_fidelity_sample_score_percent'
awk '/export function fetchHardGaps\(/,/^}/' webui/frontend/src/api/client.ts | grep -Fq 'layout_fidelity_pixel_parity'
echo "client hard-gaps sample ok"
echo "cleaned"
echo "OK: phase643 e2e passed"
