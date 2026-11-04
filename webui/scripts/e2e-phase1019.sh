#!/usr/bin/env bash
# Phase-1019: client types for with_read_only.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
awk '/export function fetchHardGaps\(/,/^}/' webui/frontend/src/api/client.ts | grep -Fq 'layout_fidelity_sample_with_read_only?:'
awk '/export function fetchHardGapsSummary/,/^}/' webui/frontend/src/api/client.ts | grep -Fq 'layout_fidelity_sample_with_read_only?:'
echo "client with_read_only types ok"
echo "cleaned"
echo "OK: phase1019 e2e passed"
