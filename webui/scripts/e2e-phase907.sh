#!/usr/bin/env bash
# Phase-907: client types for chrome window_title/tab_position.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
awk '/export function fetchHardGaps\(/,/^}/' webui/frontend/src/api/client.ts | grep -Fq 'layout_fidelity_sample_chrome_window_title'
awk '/export function fetchHardGapsSummary/,/^}/' webui/frontend/src/api/client.ts | grep -Fq 'layout_fidelity_sample_chrome_tab_position'
echo "client chrome title/tabPos types ok"
echo "cleaned"
echo "OK: phase907 e2e passed"
