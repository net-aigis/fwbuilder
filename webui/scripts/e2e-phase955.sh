#!/usr/bin/env bash
# Phase-955: client types for sample_key_count.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
awk '/export function fetchHardGaps\(/,/^}/' webui/frontend/src/api/client.ts | grep -Fq 'layout_fidelity_sample_key_count'
awk '/export function fetchHardGapsSummary/,/^}/' webui/frontend/src/api/client.ts | grep -Fq 'layout_fidelity_sample_key_count'
echo "client sample_key_count types ok"
echo "cleaned"
echo "OK: phase955 e2e passed"
