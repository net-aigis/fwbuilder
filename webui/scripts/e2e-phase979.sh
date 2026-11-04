#!/usr/bin/env bash
# Phase-979: client types for signal_key_count.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
awk '/export function fetchHardGaps\(/,/^}/' webui/frontend/src/api/client.ts | grep -Fq 'layout_fidelity_sample_signal_key_count?:'
awk '/export function fetchHardGapsSummary/,/^}/' webui/frontend/src/api/client.ts | grep -Fq 'layout_fidelity_sample_signal_key_count?:'
echo "client signal_key_count types ok"
echo "cleaned"
echo "OK: phase979 e2e passed"
