#!/usr/bin/env bash
# Phase-635: client types for summary fidelity sample.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
awk '/export function fetchHardGapsSummary/,/^}/' webui/frontend/src/api/client.ts | grep -Fq 'layout_fidelity_sample_score_percent'
awk '/export function fetchHardGapsSummary/,/^}/' webui/frontend/src/api/client.ts | grep -Fq 'layout_fidelity_pixel_parity'
echo "client summary fidelity ok"
echo "cleaned"
echo "OK: phase635 e2e passed"
