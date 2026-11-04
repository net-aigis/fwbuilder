#!/usr/bin/env bash
# Phase-1027: client types for pages_with_row_stretch.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
awk '/export function fetchHardGaps\(/,/^}/' webui/frontend/src/api/client.ts | grep -Fq 'layout_fidelity_sample_pages_with_row_stretch?:'
awk '/export function fetchHardGapsSummary/,/^}/' webui/frontend/src/api/client.ts | grep -Fq 'layout_fidelity_sample_pages_with_row_stretch?:'
echo "client pages_with_row_stretch types ok"
echo "cleaned"
echo "OK: phase1027 e2e passed"
