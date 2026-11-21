#!/usr/bin/env bash
# Phase-859: client types for stretch/chrome samples.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
awk '/export function fetchHardGaps\(/,/^}/' webui/frontend/src/api/client.ts | grep -Fq 'layout_fidelity_sample_pages_with_column_stretch'
awk '/export function fetchHardGaps\(/,/^}/' webui/frontend/src/api/client.ts | grep -Fq 'layout_fidelity_sample_chrome_size_grip_enabled'
awk '/export function fetchHardGapsSummary/,/^}/' webui/frontend/src/api/client.ts | grep -Fq 'layout_fidelity_sample_pages_with_layout_tree'
echo "client stretch/chrome sample types ok"
echo "cleaned"
echo "OK: phase859 e2e passed"
